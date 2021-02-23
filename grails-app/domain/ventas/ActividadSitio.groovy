package ventas

import seguridad.Accn

class ActividadSitio {

    Link link
    Accn accion
    String consulta
    Date fecha

    static mapping = {
        table 'actv'
        cache usage: 'read-write', include: 'non-lazy'
        id column: 'actv__id'
        id generator: 'identity'
        version false
        columns {
            id column: 'actv__id'
            link column: 'link__id'
            accion column: 'accn__id'
            consulta column: 'actvcnsl'
            fecha column: 'actvfcha'
        }
    }
    static constraints = {
        consulta(size: 1..255, blank: true, nullable: true)
        fecha(blank: true, nullable: true)
        link(blank: false, nullable: false)
        accion(blank: false, nullable: false)
    }
}
