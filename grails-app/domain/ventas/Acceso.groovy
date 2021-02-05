package ventas

import seguridad.Accn

class Acceso {

    Accn accion
    String url
    Date fecha
    String desde

    static mapping = {
        table 'accs'
        cache usage: 'read-write', include: 'non-lazy'
        id column: 'accs__id'
        id generator: 'identity'
        version false
        columns {
            id column: 'accs__id'
            accion column: 'accn__id'
            url column: 'accs_url'
            fecha column: 'accsfcha'
            desde column: 'accsdsde'
        }
    }
    static constraints = {
        url(size: 1..255, blank: true, nullable: true)
        desde(size: 1..255, blank: true, nullable: true)
        fecha(blank: true, nullable: true)
        accion(blank: false, nullable: false)
    }
}
