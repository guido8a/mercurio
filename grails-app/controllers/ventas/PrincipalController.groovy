package ventas

class PrincipalController {
//    def mailService

    def index() {

        def anuncio = Anuncio.get(1)
        def secciones = Producto.findAllByAnuncio(anuncio, [sort: 'orden', order: 'asc'])

//        println("secciones " + secciones)

//        def quanto = Articulo.findAllByProducto(Producto.get(3))

        return [anuncio: anuncio, secciones: secciones]
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

    def dialogos_ajax () {
        def articulo = Articulo.get(params.id)
        return [art: articulo]

    }

}
