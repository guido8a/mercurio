package ventas

class Pregunta {

    Producto producto
    String texto
    String respuesta
    Date fecha
    Date fechaRespuesta


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
            respuesta column: 'pregresp'
            fechaRespuesta column: 'pregfcrp'
        }
    }
    static constraints = {
        producto(blank: false, nullable: false)
        fecha(blank: true, nullable: true)
        fechaRespuesta(blank: true, nullable: true)
        texto(size: 1..255, blank:false, nullable: false)
        respuesta(size: 0..255, blank:true, nullable: true)
    }
}
