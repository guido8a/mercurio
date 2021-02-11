package ventas


class PublicacionController {

    def form_ajax(){

        def anuncio = Anuncio.get(params.id)
        def publicacion
        def publicacionExiste = Publicacion.findByAnuncio(anuncio)

        if(publicacionExiste){
            publicacion = publicacionExiste
        }else{
            publicacion = new Publicacion()
        }

        return[publicacion:publicacion, anuncio: anuncio]
    }

    def savePublicacion(){

        println("params " + params)

        def fi = new Date().parse("dd-MM-yyyy", params.fechaInicio)
        def ff = new Date().parse("dd-MM-yyyy", params.fechaFin)

        def anuncio = Anuncio.get(params.anuncio)
        def publicacion
        def publicacionExiste = Publicacion.withCriteria {
                eq("anuncio", anuncio)

            or{
                gt("fechaFin", new Date())
            }

            or{
                lt("fechaInicio", new Date())
                eq("fechaFin", null)
            }
        }

        println("existe " + publicacionExiste.size())

        if(publicacionExiste.size() > 0){
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

    def tablaPublicacion_ajax(){
        def anuncio = Anuncio.get(params.id)
        def publicaciones = Publicacion.findAllByAnuncio(anuncio)
        return[publicaciones: publicaciones]
    }
}
