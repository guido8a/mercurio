package ventas

class ProductoController {

    def list(){
        def anuncio = Anuncio.get(params.id)
        def productos = Producto.findAllByAnuncio(anuncio)
        return[productos: productos, anuncio: anuncio]
    }

    def form_ajax(){
        def anuncio = Anuncio.get(params.anuncio)
        def producto
        if(params.id){
            producto = Producto.get(params.id)
        }else{
            producto = new Producto()
        }

        return[producto: producto, anuncio: anuncio]
    }

    def saveProducto(){

        def producto

        if(params.id){
            producto = Producto.get(params.id)
        }else{
            producto = new Producto()
        }

        if(params.estado){
            params.estado = 1
        }else{
            params.estado = 0
        }

        producto.properties = params

        if(!producto.save(flush:true)){
            println("error al guardar el producto " + producto.errors)
            render "no"
        }else{
            render "ok"
        }
    }

    def show_ajax(){
        def producto = Producto.get(params.id)
        return[producto: producto]
    }

    def texto(){
        def producto = Producto.get(params.id)
        return[producto: producto]
    }

    def guardarTexto_ajax(){
        def producto = Producto.get(params.id)
        producto.texto = params.editorTramite

        if(!producto.save(flush:true)){
            println("error al guardar el texto del producto " + producto.errors)
            render "no"
        }else{
            render "ok"
        }
    }

    def imagenes_ajax() {
        def producto = Producto.get(params.id)
        def imagenes = Imagen.findAllByProducto(producto)
        return[imagenes: imagenes, producto: producto]
    }

    def upload_ajax(){
        println("params " + params)
    }

}
