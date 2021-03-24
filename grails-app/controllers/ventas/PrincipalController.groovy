package ventas

import grails.converters.JSON
import groovy.io.FileType
import groovy.json.JsonBuilder
import groovy.json.JsonSlurper
import wslite.json.JSONObject

import javax.imageio.ImageIO
import java.awt.image.BufferedImage

class PrincipalController {
//    def mailService
    def dbConnectionService

    def index() {
        println "index params: $params"
        def cn = dbConnectionService.getConnection()
        def sql = "", busqueda = ""
        params.sbct = params.sbct?:"sbct_1"
        def sbct_id = params.sbct.split("_")[1]
        def consultas = Link.findAllByActivo('A')
        def sbct = Subcategoria.get(params.sbct.split("_")[1])

        /** Se deben mostrar los anuncios vigentes
         * 1. carrusel: destacados de anuncios, si no hay suficientes completar con vntaXX
         * 2. Productos: productos de anuncios vigentes, completar con "aqui su anuncio" **/
        sql = "select publ__id, anun.anun__id, publdstc destacado, anun.prod__id from publ, anun, prod " +
                "where now()::date between publfcin and publfcfn and " +
                "anun.anun__id = publ.anun__id and prod.prod__id = anun.prod__id and " +
                "sbct__id = ${sbct_id}"
        if(params.bscr) {
            sql = "select publ__id, anun.anun__id, publdstc destacado, anun.prod__id, prod.sbct__id from publ, anun, prod, sbct " +
                    "where now()::date between publfcin and publfcfn and " +
                    "anun.anun__id = publ.anun__id and prod.prod__id = anun.prod__id and " +
                    "ctgr__id = ${params.ctgr} and sbct.sbct__id = prod.sbct__id and prodtitl ilike '%${params.bscr}%'"
        }
        println "sql: $sql"
        def anuncios = cn.rows(sql.toString())
        println "anuncios: $anuncios"

        if(params.bscr && anuncios){
            sbct = Subcategoria.get(anuncios?.first().sbct__id)
        } else if(params?.bscr?.size() > 3) {
            busqueda = "No se ha encontrado anúncios para su búsqueda '<strong>${params.bscr}</strong>' en la categoría " +
                    "<strong>${Categoria.get(params.ctgr)?.descripcion}</strong>"
        }

//        def anun = Anuncio.findAllByEstado('1')
//        def publ = Publicacion.findAllByAnuncioInListAndFechaFinGreaterThanEquals(anun, new Date())

//        def carrusel = [[tp: 'p', ruta: 'ai.jpeg'], [tp: 'p', ruta: 'usuario.png']]
        def carrusel = []
//        println "publ: $publ"
//        publ.each {pb ->
        anuncios.each {pb ->
            /** si el producto tiene anuncio destacado  */
            if(pb.destacado){
                def producto = Producto.get(pb.prod__id)
                def imag = Imagen.findAllByProductoAndPrincipal(producto, '1')
//                println "imagen: ${imag}"
                imag.each { im ->
                    carrusel.add([tp: 'p', ruta: im.ruta, prod: im.producto.id, id: im.producto.id])
                }
            }
        }
        def i = 1
        while(carrusel.size() < 3) {
            carrusel.add([tp: 't', ruta: "anuncio${i++}.jpg", prod: 1])
        }

//        def productos = [[tp: 'p', rt: 'casa7.jpeg', p: 1, tt: 'titulo', sb:'subtitulo', t:'texto a desplegar por el producto'],
//                         [tp: 'p', rt: 'casa8.jpeg', p: 1, tt: 'titulo', sb:'subtitulo', t:'texto a desplegar por el producto'],
//                         [tp: 'p', rt: 'conjunto1.jpeg', p: 1, tt: 'titulo', sb:'subtitulo', t:'texto a desplegar por el producto']]
        def productos = [], normales = []
        anuncios.each {pb ->
            /** si el producto tiene anuncio destacado  */
            def producto = Producto.get(pb.prod__id)
            def imag = Imagen.findAllByProducto(producto)
//            println "imágenes: $imag ${imag.principal}"
            imag.each { im ->
                if(im.principal == '1') {
                    productos.add([tp: 'p', rt: im.ruta, p: im.producto.id, tt: im.producto.titulo,
                                   sb: im.producto.subtitulo, t: im.producto.texto, id: im.producto.id])
                } else {
                    normales.add([tp: 'p', rt: im.ruta, p: im.producto.id, tt: im.producto.titulo,
                                  sb: im.producto.subtitulo, t: im.producto.texto, id: im.producto.id])
                }
            }
        }

//        println("carru " + carrusel)
        println "productos: ${productos.rt}"
        println "normales: ${normales.rt}"

        return [activo: sbct?.categoria?.id, sbct_actv: sbct?.id, consultas: consultas,
                carrusel: carrusel, productos: productos, normales: normales, busqueda: busqueda]

    }


    def getImage(){
        println "getImage: $params"
        def path = "/var/ventas/" + params.ruta
//        def path = "/var/ventas/cedula.jpeg"
        //returns an image to display
        BufferedImage imagen = ImageIO.read(new File(path));
        ByteArrayOutputStream baos = new ByteArrayOutputStream();

        def fileext = path.substring(path.indexOf(".")+1, path.length())

        ImageIO.write( imagen, fileext, baos );
        baos.flush();

        byte[] img = baos.toByteArray();
        baos.close();
        response.setHeader('Content-length', img.length.toString())
        response.contentType = "image/"+fileext // or the appropriate image content type
        response.outputStream << img
        response.outputStream.flush()
    }

    def getImgnCnsl(){
//        println "getImgnCnsl: $params"
        def path = "/var/ventas/imagen/consultas/" + params.ruta

        BufferedImage imagen = ImageIO.read(new File(path));
        ByteArrayOutputStream baos = new ByteArrayOutputStream();

        def fileext = path.substring(path.indexOf(".")+1, path.length())

        ImageIO.write( imagen, fileext, baos );
        baos.flush();

        byte[] img = baos.toByteArray();
        baos.close();
        response.setHeader('Content-length', img.length.toString())
        response.contentType = "image/"+fileext // or the appropriate image content type
        response.outputStream << img
        response.outputStream.flush()
    }

    def getImgnProd(){
//        println "getImgnProd: $params"
        def producto = Producto.get(params.id)
        def path = (params.tp == 'p'? "/var/ventas/productos/pro_${producto.id}/" : "/var/ventas/imagen/destacados/") + params.ruta
        def fileext = path.substring(path.indexOf(".")+1, path.length())

//        println "ruta: $path"

        BufferedImage imagen = ImageIO.read(new File(path));
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        ImageIO.write( imagen, fileext, baos );
        baos.flush();
        byte[] img = baos.toByteArray();
        baos.close();
        response.setHeader('Content-length', img.length.toString())
        response.contentType = "image/"+fileext // or the appropriate image content type
        response.outputStream << img
        response.outputStream.flush()
    }

    def getImgnCarrusel(){
        println "getImgnCarrusel: $params"
        def path = params.ruta
        def fileext = path.substring(path.indexOf(".")+1, path.length())

        println "ruta: $path, fileext $fileext"

        BufferedImage imagen = ImageIO.read(new File(path));
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        ImageIO.write( imagen, fileext, baos );
        baos.flush();
        byte[] img = baos.toByteArray();
        baos.close();
        response.setHeader('Content-length', img.length.toString())
        response.contentType = "image/"+fileext // or the appropriate image content type
        response.outputStream << img
        response.outputStream.flush()
    }


    def enviarMail_ajax () {
//        println("params enviar mail " + params)
        def mailTedein = "informacion@tedein.com.ec"
        def mailTedein2 = "guido8a@gmail.com"
        def errores = ''


        try{
            mailService.sendMail {
                to mailTedein
                subject "Nuevo correo desde la página web de TEDEIN"
                body "Pregunta o información: " +
                        "\n Nombre: ${params.nombre} " +
                        "\n Teléfono: ${params.telefono} " +
                        "\n Email: ${params.correo} " +
                        "\n Mensaje: ${params.mensaje}"
            }
        }catch (e){
            println("Error al enviar el mail")
            errores += e
        }

        try{
            mailService.sendMail {
                to mailTedein2
                subject "Nuevo correo desde la página web de TEDEIN"
                body "Pregunta o información: " +
                        "\n Nombre: ${params.nombre} " +
                        "\n Teléfono: ${params.telefono} " +
                        "\n Email: ${params.correo} " +
                        "\n Mensaje: ${params.mensaje}"
            }
        }catch (e){
            println("Error al enviar el mail 2")
            errores += e
        }

        if(errores == ''){
            render "ok"
        }else{
            render "no"
        }
    }

    def login_ajax(){

    }

    def categorias() {
//        println "cargar categorias $params"
        def tx_id = params.id?:'ct_1'
        def ct_id = tx_id.split("_")[1].toInteger()
        def sbct_id = params.sbct? params.sbct.split('_')[1] : 0
        def sbct = sbct_id? Subcategoria.get(sbct_id).id : 0
/*
        if(sbct_id) {
            sbct = Subcategoria.get(sbct_id).id
        } else {
            sbct = Subcategoria.findAllByCategoria(Categoria.get(ct_id), [sort: 'orden'])
//            sbct = sbct? sbct.first().id : 0
            sbct = 0
        }
*/
        println "activo: ${ct_id}, sbct_actv: ${sbct}"
//        redirect(action: 'index', params: params)
        [activo: ct_id, sbct_actv: sbct]
//        [activo: ct_id, sbct_actv: 0]
    }

    def buscar() {
        println "buscar: $params"
        redirect(action: 'index', params: params)
//        render "hola"
    }
}
