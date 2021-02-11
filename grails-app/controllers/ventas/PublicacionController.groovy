package ventas


class PublicacionController {

    def form_ajax(){

        def anuncio = Anuncio.get(params.id)
        def publicacion = new Publicacion()

        return[publicacion:publicacion, anuncio: anuncio]
    }

    def savePublicacion(){

        println("params " + params)

        def fi = new Date().parse("dd-MM-yyyy", params.fechaInicio)
        params.fechaInicio = fi

        def ff
        if(params.fechaFin){
            ff = new Date().parse("dd-MM-yyyy", params.fechaFin)
            params.fechaFin = ff
        }else{
            params.fechaFin = null
        }

        println("fi " + params.fechaInicio)
        println("ff " + params.fechaFin)

        if(params.destacado){
            params.destacado = 1
        }else{
            params.destacado = 0
        }


        def anuncio = Anuncio.get(params.anuncio)
        def publicacion

        def publicacionExiste1 = Publicacion.findAllByAnuncioAndFechaFinGreaterThan(anuncio, new Date())
        def publicacionExiste2 = Publicacion.findAllByAnuncioAndFechaInicioLessThanEqualsAndFechaFinIsNull(anuncio, new Date())

        println("existe1 " + publicacionExiste1.size())
        println("existe2 " + publicacionExiste2.size())

        if(params.id){
            publicacion = Publicacion.get(params.id)
            publicacion.properties = params

            if(!publicacion.save(flush: true)){
                println("error al guardar la publicación" + publicacion.errors)
                render "no"
            }else{
                render "ok"
            }
        }else{
            if(publicacionExiste1.size() > 0 || publicacionExiste2.size() > 0 ){
                render "er_No se puede crear una publicación del anuncio, ya existe una publicación activa"
            }else{
                publicacion = new Publicacion()

                publicacion.properties = params

                if(!publicacion.save(flush: true)){
                    println("error al guardar la publicación" + publicacion.errors)
                    render "no"
                }else{
                    render "ok"
                }
            }
        }


    }

    def tablaPublicacion_ajax(){
        def anuncio = Anuncio.get(params.id)
        def publicaciones = Publicacion.findAllByAnuncio(anuncio)
        return[publicaciones: publicaciones]
    }
}
