package ventas

import seguridad.Persona

class PreguntaController {

    def list(){

        def persona = Persona.get(session.usuario.id)
        def productos = Producto.findAllByPersona(persona).sort{it.titulo}
        def preguntas = Pregunta.findAllByProductoInList(productos).sort{it.id}

        return[preguntas:preguntas, persona:persona]
    }

    def respuesta_ajax(){
        def pregunta = Pregunta.get(params.id)
        return[pregunta:pregunta]
    }

    def savePregunta_ajax(){

//        println("params " + params)

        def pregunta = Pregunta.get(params.id)
        pregunta.respuesta = params.respuesta
        pregunta.fechaRespuesta = new Date()

        if(!pregunta.save(flush:true)){
            println("error al guardar la pregunta " + pregunta.errors)
            render "no"
        }else{
            render "ok"
        }
    }

    def eliminarPregunta_ajax(){
        def pregunta = Pregunta.get(params.id)

        try{
            pregunta.delete(flush:true)
            render "ok"
        }catch(e){
            println("error al borrar la pregunta" + pregunta.errors)
            render "no"
        }
    }

}
