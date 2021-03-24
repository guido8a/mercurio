package ventas

class AtributoCategoriaController {

    def form_ajax(){
        def ac
        def subcategoria = Subcategoria.get(params.subcategoria)

        if(params.id){
            ac = AtributoCategoria.get(params.id)
        }else{
            ac = new AtributoCategoria()
        }

        return[atributoCategoria : ac, subcategoria: subcategoria]
    }

    def saveAtributo(){


        def atr = Atributo.get(params.atributo)
        def subcategoria = Subcategoria.get(params.subcategoria)

        def existe = AtributoCategoria.findByAtributoAndSubcategoria(atr, subcategoria)

        if(existe){
            render "er_El atributo seleccionado ya fue asignado a la subcategoría"
        }else{
            def atributo = new AtributoCategoria()

            atributo.properties = params

            if(!atributo.save(flush:true)){
                println("error al guardar el atributo"+ atributo.errors)
                render "no"
            }else{
                render "ok"
            }
        }


    }

    def delete_ajax(){
        def atributo = AtributoCategoria.get(params.id)

        try{
            atributo.delete(flush:true)
            render "ok"
        }catch(e){
            render "no"
        }
    }

}
