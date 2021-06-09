package ventas

class TipoPagoController {


    def list(){
        def tipos = TipoPago.list().sort{it.orden}
        return[tipos:tipos]
    }

    def form_ajax(){
        def tipoPago
        if(params.id){
            tipoPago = TipoPago.get(params.id)
        }else{
            tipoPago = new TipoPago()
        }
        return[tipoPago: tipoPago]
    }

    def eliminar_ajax(){

        def tipoPago = TipoPago.get(params.id)

        try{
            tipoPago.delete(flush:true)
            render"ok"
        }catch(e){
            println("error al borrar el tipo de pago " + tipoPago.errors)
            render "no"
        }
    }

    def saveTipoPago(){

        def tipoPago

        if(params.id){
            tipoPago = TipoPago.get(params.id)
        }else{
            tipoPago = new TipoPago()
        }

        tipoPago.properties = params

        if(!tipoPago.save(flush:true)){
            println("error al guardar el tipo de pago " + tipoPago.errors)
            render "no"
        }else{
            render "ok"
        }
    }
}
