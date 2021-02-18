package ventas

class Imagen {

    Producto producto
    String ruta
    String texto
    String estado
    String principal

    static mapping = {
        table 'imag'
        cache usage:'read-write', include:'non-lazy'
        version false
        id generator: 'identity'

        columns {
            id column: 'imag__id'
            producto column: 'prod__id'
            ruta column: 'imagruta'
            texto column: 'imagtxto'
            estado column: 'imagetdo'
            principal column: 'imagpncp'

        }
    }

    static constraints = {
        ruta(blank:false,size:4..255)
        texto(blank: true, nullable: true)
        principal(blank: true, nullable: true)
        estado(blank:false, nullable: false)
    }
}
