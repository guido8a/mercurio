package ventas

import seguridad.Persona

class VerController {

    /* debe llegar el id del producto */
    def carrusel() {
//        println "index params: $params"

//        params.id = params.id?:1
        def producto = Producto.get(params.id)
        def persona = Persona.get(params.persona)
        def atrb = Valores.findAllByProducto(producto)
        def carrusel = []

        def imag = Imagen.findAllByProducto(producto, [sort: 'principal', order: 'desc'])
//        println "imagen: ${imag}"
        imag.each { im ->
            carrusel.add([ruta: "/var/ventas/productos/pro_${producto.id}/${im.ruta}"])
        }
//        println "carrusel: ${carrusel}"

        def anuncio = Anuncio.findByProducto(producto)
        def publicaciones
        if(anuncio){
            publicaciones = Publicacion.findAllByAnuncioAndFechaInicioIsNotNullAndFechaFinGreaterThanEquals(anuncio, new Date())?.size()
        }else{
            publicaciones = 0
        }


        println("publicaciones " + publicaciones)


        return [carrusel: carrusel, producto: producto, atributos: atrb, tipo: params.tipo, persona: persona, publicaciones: publicaciones]

    }
}
