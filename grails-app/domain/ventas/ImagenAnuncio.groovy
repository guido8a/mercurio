package ventas

class ImagenAnuncio {

    Imagen imagen
    Anuncio anuncio

    static mapping = {
        table 'iman'
        cache usage:'read-write', include:'non-lazy'
        version false
        id generator: 'identity'

        columns {
            id column: 'iman__id'
            imagen column: 'imag__id'
            anuncio column: 'anun__id'
        }
    }

    static constraints = {
        imagen(blank:false, nullable: false)
        anuncio(blank:false, nullable: false)
    }
}
