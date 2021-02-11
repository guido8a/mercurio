package ventas

class AnuncioController {

    def list(){

        def promotor = Promotor.get(params.id)
        def anuncios = Anuncio.findAllByPromotor(promotor)

        return[promotor:promotor, anuncios:anuncios]
    }

    def form_ajax(){
        def promotor = Promotor.get(params.promotor)
        def anuncio
        if(params.id){
            anuncio = Anuncio.get(params.id)
        }else{
            anuncio = new Anuncio()
        }

        return[anuncio:anuncio, promotor: promotor]
    }

    def saveAnuncio(){

        println("params " + params)

        def anuncio
        if(params.id){
            anuncio = Anuncio.get(params.id)
        }else{
            anuncio = new Anuncio()
        }

        if(params.estado){
            params.estado = 1
        }else{
            params.estado = 0
        }

        anuncio.properties = params

        if(!anuncio.save(flush:true)){
            println("error al guardar el anuncio")
            render "no"
        }else{
            render "ok"
        }
    }

    def delete_ajax(){

    }

    def subcategoria_ajax(){

        println("id " + params)

        def categoria = Categoria.get(params.id)
        def subCategorias = Subcategoria.findAllByCategoria(categoria).sort{it.descripcion}
        def anuncio
        if(params.anuncio){
            anuncio = Anuncio.get(params.anuncio)
        }else{
            anuncio = new Anuncio()
        }

        return[subCategorias: subCategorias, anuncio: anuncio]
    }

}
