package ventas

class SubcategoriaController {

    def list(){
        def subcategorias = Subcategoria.list().sort{a,b -> a.orden <=> b.orden ?: a.descripcion <=> b.descripcion}
        return[subcategorias: subcategorias]
    }

    def form_ajax(){
        def subcategoria
        if(params.id){
            subcategoria = Subcategoria.get(params.id)
        }else{
            subcategoria = new Subcategoria()
        }

        return[subcategoria: subcategoria]
    }

    def saveSubcategoria () {
        def subcategoria
        if(params.id){
            subcategoria = Subcategoria.get(params.id)
        }else{
            subcategoria = new Subcategoria()
        }

        subcategoria.properties = params

        if(!subcategoria.save(flush:true)){
            println("error al guardar la subcategoria")
            render "no"
        }else{
            render"ok"
        }
    }

    def delete_ajax(){

        def subcategoria = Subcategoria.get(params.id)

        try{
            subcategoria.delete(flush:true)
            render "ok"
        }catch(e){
            println("error al borrar la subcategoría " + subcategoria.errors)
            render "no"
        }

    }

}
