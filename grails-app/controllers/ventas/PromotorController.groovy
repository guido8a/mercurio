package ventas

import geografia.Canton
import geografia.Provincia

class PromotorController {

    def list() {
        def promotores = Promotor.list().sort{it.tipo}
        return[promotores:promotores]
    }

    def form_ajax(){

        def promotor

        if(params.id){
            promotor = Promotor.get(params.id)
        }else{
            promotor = new Promotor()
        }

        return [promotor:promotor]
    }

    def savePromotor(){

//        println("guardar " + params)

        def promotor

        if(params.id){
            promotor = Promotor.get(params.id)
        }else{
            promotor = new Promotor()
            params.fecha = new Date()
        }

        if(params.estado){
            params.estado = 1
        }else{
            params.estado = 0
        }

        promotor.properties = params

        if(!promotor.save(flush:true)){
            println("error al guardar el promotor " + promotor.errors)
            render "no"
        }else{
            render "ok"
        }
    }

    def canton_ajax(){
        def provincia = Provincia.get(params.id)
        def cantones = Canton.findAllByProvincia(provincia).sort{it.nombre}
        def promotor

        if(params.promotor){
            promotor = Promotor.get(params.promotor)
        }else{
            promotor = new Promotor()
        }

        return[cantones:cantones, promotor: promotor]
    }

    def show_ajax(){
        def promotor = Promotor.get(params.id)
        return[promotor: promotor]
    }

    def delete_ajax(){

        def promotor = Promotor.get(params.id)

        try{
            promotor.delete(flush:true)
            render "ok"
        }catch(e){
            println("error al borrar el promotor" + promotor.errors)
            render "no"
        }

    }
}
