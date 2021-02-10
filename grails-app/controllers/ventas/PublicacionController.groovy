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

        def anuncio = Anuncio.get(params.id)
        def publicacion
        def publicacionExiste = Publicacion.findByAnuncio(anuncio)

        if(publicacionExiste){
            publicacion = publicacionExiste
        }else{
            publicacion = new Publicacion()
        }

        if(!publicacion.save(flush: true)){
            println("error al guardar la publicación")
            render "no"
        }else{
            render "ok"
        }
    }
}
