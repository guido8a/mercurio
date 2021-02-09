package ventas


class VendedorController {

    def list () {
        def promotor = Promotor.get(params.id)
        def vendedores = Vendedor.findAllByPromotor(promotor)
        return[vendedores:vendedores, promotor:promotor]
    }

    def form_ajax() {
        def promotor = Promotor.get(params.promotor)
        def vendedor
        if(params.id){
            vendedor = Vendedor.get(params.id)
        }else{
            vendedor = new Vendedor()
        }

        return[vendedor:vendedor, promotor: promotor]
    }

    def saveVendedor(){

        def vendedor

        if(params.id){
            vendedor = Vendedor.get(params.id)
        }else{
            vendedor = new Vendedor()
            params.fecha = new Date()
        }

        if(params.estado){
            params.estado = 1
        }else{
            params.estado = 0
        }

        vendedor.properties = params

        if(!vendedor.save(flush:true)){
            println("error al guardar el vendedor " + vendedor.errors)
            render "no"
        }else{
            render "ok"
        }
    }

    def delete_ajax(){
        def vendedor = Vendedor.get(params.id)

        try{
            vendedor.delete(flush: true)
            render "ok"
        }catch(e){
            println("error al borrar al vendedor " + vendedor.errors)
            render "no"
        }
    }

    def show_ajax(){
        def vendedor = Vendedor.get(params.id)
        return[vendedor: vendedor]
    }

}
