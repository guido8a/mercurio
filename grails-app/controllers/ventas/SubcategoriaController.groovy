package ventas

class SubcategoriaController {

    def list(){
        def categoria = Categoria.get(params.id)
//        def subcategorias = Subcategoria.list().sort{a,b -> a.orden <=> b.orden ?: a.descripcion <=> b.descripcion}
        def subcategorias = Subcategoria.findAllByCategoria(categoria).sort{it.orden}
        return[subcategorias: subcategorias, categoria:categoria]
    }

    def form_ajax(){
        def categoria
        def subcategoria

        if(params.categoria){
            categoria = Categoria.get(params.categoria)
        }else{
            categoria = Subcategoria.get(params.id).categoria
        }

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
        def atributos = AtributoCategoria.findAllBySubcategoria(subcategoria)


        if(atributos){
            render "er_No se puede borrar la subcategoría existen atributos asignados"
        }else{
            try{
                subcategoria.delete(flush:true)
                render "ok"
            }catch(e){
                println("error al borrar la subcategoría " + subcategoria.errors)
                render "no"
            }
        }



    }

    def subcategoria_ajax(){

        println("subcategoria_ajax " + params)

        def categoria = Categoria.get(params.id)
        def subCategorias = Subcategoria.findAllByCategoria(categoria).sort{it.descripcion}
        def producto
        if(params.producto){
            producto = Producto.get(params.producto)
        }else{
            if(params.sbct) {
                producto = new Producto()
                producto.subcategoria = Subcategoria.get(params.sbct)
            }
        }

        return[subCategorias: subCategorias, producto: producto]
    }


}
