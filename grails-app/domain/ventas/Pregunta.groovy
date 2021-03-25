package ventas

class Pregunta {

    Producto producto
    String texto
    Date fecha


    static mapping = {
        table 'preg'
        cache usage: 'read-write', include: 'non-lazy'
        id column: 'preg__id'
        id generator: 'identity'
        version false
        columns {
            id column: 'preg__id'
            producto column: 'prod__id'
            fecha column: 'pregfcha'
            texto column: 'pregtxto'
        }
    }
    static constraints = {
        producto(blank: false, nullable: false)
        fecha(blank: true, nullable: true)
        texto(size: 1..255, blank:false, nullable: false)
    }
}
