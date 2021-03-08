package ventas

import groovy.io.FileType

import javax.imageio.ImageIO
import java.awt.image.BufferedImage

class PrincipalController {
//    def mailService

    def index() {
        println "index params: $params"

        params.id = params.id?:1
        def categoria = Categoria.get(params.id)
        def consultas = Link.findAllByActivo('A')
        def sbct = Subcategoria.findAllByCategoria(categoria, [sort: 'orden', order: 'asc'])

        def usuario = session.usuario

        println("usuario " + usuario)
        /** Se deben mostrar los anuncios vigentes
         * 1. carrusel: destacados de anuncios, si no hay suficientes completar con vntaXX
         * 2. Productos: productos de anuncios vigentes, completar con "aqui su anuncio" **/

        def anun = Anuncio.findAllByEstado('1')
        def publ = Publicacion.findAllByAnuncioInListAndFechaFinGreaterThanEquals(anun, new Date())
        def prod = Imagen.findAllByProductoAndPrincipal(anun.producto, '0')
//        def carrusel = [[tp: 'p', ruta: 'ai.jpeg'], [tp: 'p', ruta: 'usuario.png']]
        def carrusel = []
        println "publ: $publ"
        publ.each {pb ->
            /** si el producto tiene anuncio destacado  */
            if(pb.destacado){
                def imag = Imagen.findAllByProductoInListAndPrincipal(anun.producto, '1')
                imag.each { im ->
                    carrusel.add([tp: 'p', ruta: im.ruta, prod: im.producto.id])
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
//        def productos = []
//
//        publ.each {pb ->
//            /** si el producto tiene anuncio destacado  */
////            def imag = Imagen.findByProductoAndPrincipal(anun.producto, '1')
//            def imag = Imagen.findByProductoAndPrincipal(pb.anuncio.producto, '1')
//            imag.each { im ->
//                productos.add([tp: 'p', rt: im.ruta, p: im.producto.id, tt: im.producto.titulo,
//                              sb: im.producto.subtitulo, t: im.producto.texto])
//            }
//        }

        def anunciosDestacados = Anuncio.findAllByEstado('1')
        def publicacionesDestacadas = Publicacion.findAllByAnuncioInListAndFechaFinGreaterThanEqualsAndDestacado(anunciosDestacados, new Date(),'1')

        def productosDestacados = []

        publicacionesDestacadas.each {pb ->
            def imag = Imagen.findByProductoAndPrincipal(pb.anuncio.producto, '1')
            def imagenComun = Imagen.findByProducto(pb.anuncio.producto)
            if(imag){
                imag.each { im ->
                    productosDestacados.add([tp: 'p', rt: im.ruta, p: im.producto.id, tt: im.producto.titulo,
                                             sb: im.producto.subtitulo, t: im.producto.texto, w: 100, h: 100])
                }
            }else{
                imagenComun.each { im ->
                    productosDestacados.add([tp: 'p', rt: im.ruta, p: im.producto.id, tt: im.producto.titulo,
                                             sb: im.producto.subtitulo, t: im.producto.texto, w: 100, h: 100])
                }
            }
        }

        def publicacionesNormales = Publicacion.findAllByAnuncioInListAndFechaFinGreaterThanEqualsAndDestacado(anunciosDestacados, new Date(),'0')

        def productosNormales =[]

        publicacionesNormales.each {pb ->
            def imag = Imagen.findByProductoAndPrincipal(pb.anuncio.producto, '1')
            def imagenComun = Imagen.findByProducto(pb.anuncio.producto)
            if(imag){
                imag.each { im ->
                    productosNormales.add([tp: 'p', rt: im.ruta, p: im.producto.id, tt: im.producto.titulo,
                                             sb: im.producto.subtitulo, t: im.producto.texto, w: 100, h: 100])
                }
            }else{
                imagenComun.each { im ->
                    productosNormales.add([tp: 'p', rt: im.ruta, p: im.producto.id, tt: im.producto.titulo,
                                             sb: im.producto.subtitulo, t: im.producto.texto, w: 100, h: 100])
                }
            }
        }

        println("productos D " + productosDestacados)
        println("productos N " + productosNormales)

//        while(carrusel.size() < 3) {
//            carrusel.add([tp: 't', ruta: "anuncio${i++}.jpg"])
//        }

        return [categorias: sbct, activo: params.id, consultas: consultas, usuario: usuario,
                carrusel: carrusel, productos: productosDestacados, normales: productosNormales]

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
        println "image: $params"
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
        println "getImgnProd: $params"
        def producto = Producto.get(params.id)
        def path = (params.tp == 'p'? "/var/ventas/productos/pro_${producto.id}/" : "/var/ventas/imagen/destacados/") + params.ruta
        def fileext = path.substring(path.indexOf(".")+1, path.length())

        println "ruta: $path"

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

}
