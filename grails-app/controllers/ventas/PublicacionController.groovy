package ventas


class PublicacionController {

    def form_ajax(){

        def anuncio = Anuncio.get(params.id)
        def producto = anuncio.producto
        def publicacion = new Publicacion()

        return[publicacion:publicacion, anuncio: anuncio, producto:producto]
    }

    def savePublicacion(){

        println("params " + params)

        def fi = new Date().parse("dd-MM-yyyy HH:mm:ss", params.fechaInicio + " 00:00:00")
        params.fechaInicio = fi

        def ff
        if(params.fechaFin){
            ff = new Date().parse("dd-MM-yyyy HH:mm:ss", params.fechaFin + " 23:59:00")
            params.fechaFin = ff
        }else{
            params.fechaFin = null
        }

        println("fi " + params.fechaInicio)
        println("ff " + params.fechaFin)

        if(params.fechaInicio > params.fechaFin){
            render "er_La fecha de inicio de la publicación es mayor a la fecha de finalización"
        }else{
            if(params.destacado){
                params.destacado = 1
            }else{
                params.destacado = 0
            }

            def anuncio = Anuncio.get(params.anuncio)
            def producto = anuncio.producto

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

                    if(publicacion.fechaFin && publicacion.fechaFin <= new Date()){
                        anuncio.estado = 0
                        producto.estado = 'I'
                    }else{
                        anuncio.estado = 1
                        producto.estado = 'A'
                    }

                    anuncio.save(flush:true)
                    producto.save(flush:true)

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

                        if(publicacion.fechaFin && publicacion.fechaFin <= new Date()){
                            anuncio.estado = 0
                            producto.estado = 'I'
                        }else{
                            anuncio.estado = 1
                            producto.estado = 'A'
                        }

                        anuncio.save(flush:true)
                        producto.save(flush:true)
                        render "ok"
                    }
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
