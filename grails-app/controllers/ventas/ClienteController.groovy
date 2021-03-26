package ventas


class ClienteController {

    def mailService

    def cliente_ajax(){
        def producto = Producto.get(params.producto)
        return[producto: producto]
    }

    def guardarCliente_ajax(){
        println("params " + params)

        def producto = Producto.get(params.producto)
        def cliente = new Cliente()
        cliente.properties = params

        if(!cliente.save(flush:true)){
            println("error al guardar la informacion del cliente" + cliente.errors)
            render "no"
        }else{

            def mail = producto.persona.mailContacto
            def errores = ''

            try{
                mailService.sendMail {
                    to mail
                    subject "Correo de información"
                    body "Ha recibido una solicitud de información de su producto: " +
                            "\n Nombre del solicitante: ${params.nombre} " +
                            "\n Email del solicitante: ${params.mail} " +
                            "\n Pregunta: ${params.pregunta} "
                }
            }catch (e){
                println("Error al enviar el mail: " + e)
                errores += e
            }

            if(errores == ''){
                println("entro")
                render  "ok"
            }else{
                render "no"
            }

        }
    }

}
