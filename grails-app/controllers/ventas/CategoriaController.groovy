package ventas

class CategoriaController {

    def list(){
        def categorias = Categoria.list().sort{it.descripcion}
        return[categorias: categorias]
    }

    def form_ajax(){

        def categoria

        if(params.id){
            categoria = Categoria.get(params.id)
        }else{
            categoria = new Categoria()
        }

        return[categoria:categoria]
    }

    def saveCategoria(){

//        println("params " + params)

        def categoria

        if(params.id){
            categoria = Categoria.get(params.id)
        }else{
            categoria = new Categoria()
        }

        categoria.properties = params

        if(!categoria.save(flush:true)){
            println("error al guardar la categoria " + categoria.errors)
            render "no"
        }else{
            render "ok"
        }
    }

    def delete_ajax(){

        def categoria = Categoria.get(params.id)

        try{
            categoria.delete(flush:true)
            render "ok"
        }catch(e){
            println("error al borrar la categoria " + categoria.errors)
            render "no"
        }

    }

}
