package ventas

import grails.converters.JSON
import groovy.io.FileType
import groovy.json.JsonBuilder
import groovy.json.JsonSlurper
import org.springframework.web.context.request.RequestContextHolder
import wslite.json.JSONObject

import javax.imageio.ImageIO
import java.awt.image.BufferedImage

class PrincipalController {
//    def mailService
    def dbConnectionService

    def index() {
        println "index params: $params"


//        def a = request.getRemoteAddr()
//        def b = request.getHeader("HTTP_X_FORWARDED_FOR")
//        def c = request.getHeader("HTTP_CLIENT_IP")
//        def d = request.getHeader("user-agent")
//
//        println("a " + a)
//        println("b " + b)
//        println("c " + c)
//        println("d " + d)

        def cn = dbConnectionService.getConnection()
        def busqueda = ""
        def enCategoria = ""
        params.sbct = params.sbct?:"sbct_1"
        params.bscr = params.bscr != 'undefined'? params.bscr : ''
        def sbct_id = params.sbct.split("_")[1]
        def consultas = Link.findAllByActivo('A')
        def sbct = Subcategoria.get(params.sbct.split("_")[1])
        def sql = "select publ__id, anun.anun__id, publdstc destacado, anun.prod__id from publ, anun, prod " +
                "where now()::date between publfcin and publfcfn and anun.anun__id = publ.anun__id and " +
                "prod.prod__id = anun.prod__id and sbct__id = ${sbct_id}"
        def sqlBs = "select publ__id, anun.anun__id, publdstc destacado, anun.prod__id, prod.sbct__id " +
                "from publ, anun, prod, sbct " +
                "where now()::date between publfcin and publfcfn and anun.anun__id = publ.anun__id and " +
                "prod.prod__id = anun.prod__id and sbct.sbct__id = prod.sbct__id"
        def sqlDs = "select imagruta, prod.prod__id from publ, anun, prod, imag " +
                "where now()::date between publfcin and publfcfn and anun.anun__id = publ.anun__id and " +
                "prod.prod__id = anun.prod__id and publdstc = '1' and imag.prod__id = prod.prod__id and imagpncp = '1'"

        /* todo: hacer función para descartar palabras: "de para a la el las los las .." */

        /** Se deben mostrar los anuncios vigentes
         * 1. carrusel: destacados de todos los anuncios, si no hay suficientes completar con vntaXX
         * 2. Destacados: productos de anuncios vigentes, completar con "aqui su anuncio" **/
        if(params.bscr) {
            sql = ""
            params.bscr.split(' ').each { t ->
                    sql += (sql=='')? "${sqlBs} and prodtitl ilike '%${t}%'" : " union ${sqlBs} and prodtitl ilike '%${t}%'"
                }
        }
        println "sql: $sql"
        def anuncios = cn.rows(sql.toString())
        println "anuncios: $anuncios"

        if(params.bscr && anuncios){
            sbct = Subcategoria.get(anuncios?.first().sbct__id)
        } else if(params?.bscr?.size() > 3) {
            def ctgr = Categoria.get(params.ctgr)
//            enCategoria = Categoria.get(params.ctgr)?.descripcion?
            enCategoria = ctgr? "la categoría ${ctgr.descripcion}" :'todas las categorías'
            busqueda = "No se ha encontrado anúncios para su búsqueda '<strong>${params.bscr}</strong>' en " +
                    "<strong>${enCategoria}</strong>"
        }

        def carrusel = [], destacados = [], normales = []
//        println "publ: $sqlDs"
        /** se muestran en el carrusel todos los anuncios vigentes con publicación "destacada": publdstc = '1' **/
        def publ = cn.rows(sqlDs.toString())
        publ.each {pb ->
            carrusel.add([tp: 'p', ruta: pb.imagruta, prod: pb.prod__id, id: pb.prod__id])
        }
        def i = 1   /* completa las imágenes del carrusel */
        while(carrusel.size() < 3) {
            carrusel.add([tp: 't', ruta: "anuncio${i++}.jpg", prod: 1])
        }

        anuncios.each {pb ->
            def producto = Producto.get(pb.prod__id)
            def imag = Imagen.findAllByProductoAndPrincipal(producto, '1')
            println "producto: ${pb.prod__id} --> imágenes: ${imag}"
            imag.each { im ->
                if(im.principal == '1') {
                    destacados.add([tp: 'p', rt: im.ruta, p: im.producto.id, tt: im.producto.titulo,
                                    sb: im.producto.subtitulo, t: im.producto.texto, id: im.producto.id])
                }
                else {
                    normales.add([tp: 'p', rt: im.ruta, p: im.producto.id, tt: im.producto.titulo,
                                  sb: im.producto.subtitulo, t: im.producto.texto, id: im.producto.id])
                }
            }
        }

        println "carrusel ${carrusel.ruta}"
        println "destacados: ${destacados.rt}"
        println "normales: ${normales.rt}"
        println "activo: ${sbct?.categoria?.id}, sbct_actv: ${sbct?.id}"

        return [activo: sbct?.categoria?.id, sbct_actv: sbct?.id, consultas: consultas,
                carrusel: carrusel, destacados: destacados, normales: normales, busqueda: busqueda]

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

    def manual() {
        println "manual: $params"
        def nombre = 'externos.pdf'
        def path = '/var/ventas/manual/anuncios.pdf'
        def file = new File(path)
        def b = file.getBytes()
        response.setContentType('pdf')
        response.setHeader("Content-disposition", "attachment; filename=" + nombre)
        response.setContentLength(b.length)
        response.getOutputStream().write(b)
    }

    def manualAdm() {
        println "manual: $params"
        def nombre = 'administracion.pdf'
        def path = '/var/ventas/manual/administracion.pdf'
        def file = new File(path)
        def b = file.getBytes()
        response.setContentType('pdf')
        response.setHeader("Content-disposition", "attachment; filename=" + nombre)
        response.setContentLength(b.length)
        response.getOutputStream().write(b)
    }

    def terminos() {
//        println "manual: $params"
        def nombre = 'politica del sitio.pdf'
        def path = '/var/ventas/manual/política del sitio.pdf'
        def file = new File(path)
        def b = file.getBytes()
        response.setContentType('pdf')
        response.setHeader("Content-disposition", "attachment; filename=" + nombre)
        response.setContentLength(b.length)
        response.getOutputStream().write(b)
    }

    def actividad_ajax(){
        def a = request.getRemoteAddr()
        def d = request.getHeader("user-agent")

        def link = Link.get(params.id)
        def actividad = new Actividad()
        actividad.link = link
        actividad.fecha = new Date()
        actividad.ip = a
        actividad.informacion = d

        if(!actividad.save(flush:true)){
            println("error al guardar la actividad " + actividad.errors)
        }else{

        }

        render "ok"
    }

    def error(){

    }
}
