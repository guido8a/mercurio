package ventas

import seguridad.Persona

class AlertaController {

    def list(){
        def alertas = Alerta.findAllByFechaAprobacionIsNull()
        return[alertas:alertas]
    }

    def revisadas(){
        def alertas = Alerta.findAllByFechaAprobacionIsNotNull()
        return[alertas:alertas]
    }

    def generarAlerta_ajax(){

        def producto = Producto.get(params.id)

        def existe = Alerta.findByProductoAndFechaAprobacionIsNull(producto)
        def alerta

        if(existe){
            existe.delete(flush:true)
        }

        alerta = new Alerta()
        alerta.producto = producto
        alerta.fechaIngreso = new Date()

        if(!alerta.save(flush:true)){
            println("error al generar la alerta" + alerta.errors)
            render "no"
        }else{
            producto.estado = 'R'
            producto.save(flush:true)
            render "ok"
        }
    }

    def negar_ajax(){
        def persona = Persona.get(session.usuario.id)
        def alerta = Alerta.get(params.id)
        def producto = alerta.producto
        producto.estado = 'N'

        if(!producto.save(flush:true)){
            println("error al colocar el estado negado en el producto " + producto.errors)
            render "no"
        }else{
            alerta.persona = persona
            alerta.fechaAprobacion = new Date()

            if(!alerta.save(flush:true)){
                println("error al negar la alerta " + alerta.errors)
                render "no"
            }else{
                render "ok"
            }
        }
    }

    def retornarAlerta_ajax(){
        def alerta = Alerta.get(params.id)
        def producto = alerta.producto

        def existeAlerta = Alerta.findByProductoAndFechaAprobacionIsNull(producto)
        def existeAnuncio = Anuncio.findByProducto(producto)

        if(existeAlerta){
                render "er_Ya existe una alerta en proceso asociada a este producto, no es posible retornar la alerta"
        }else{
            if(existeAnuncio){
                render "er_Ya existe un anuncio asociado a este producto, no es posible retornar la alerta"
            }else{

                producto.estado = 'R'

                if(!producto.save(flush:true)){
                    println("error al colocar el estado -en revision- en el producto " + producto.errors)
                    render "no"
                }else{

                    alerta.fechaAprobacion = null

                    if(!alerta.save(flush:true)){
                        println("error al retornar la alerta " + alerta.errors)
                        render "no"
                    }else{
                        render "ok"
                    }
                }
            }
        }


    }

}
