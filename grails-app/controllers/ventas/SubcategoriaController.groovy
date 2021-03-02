package ventas

class SubcategoriaController {

    def list(){
        def categoria = Categoria.get(params.id)
//        def subcategorias = Subcategoria.list().sort{a,b -> a.orden <=> b.orden ?: a.descripcion <=> b.descripcion}
        def subcategorias = Subcategoria.findAllByCategoria(categoria).sort{it.orden}
        return[subcategorias: subcategorias, categoria:categoria]
    }

    def form_ajax(){
        def categoria = Categoria.get(params.categoria)
        def subcategoria
        if(params.id){
            subcategoria = Subcategoria.get(params.id)
        }else{
            subcategoria = new Subcategoria()
        }

        return[subcategoria: subcategoria, categoria: categoria]
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

    def subcategoria_ajax(){

        println("id " + params)

        def categoria = Categoria.get(params.id)
        def subCategorias = Subcategoria.findAllByCategoria(categoria).sort{it.descripcion}
        def producto
        if(params.producto){
            producto = Producto.get(params.producto)
        }else{
            producto = new Producto()
        }

        return[subCategorias: subCategorias, producto: producto]
    }


}
