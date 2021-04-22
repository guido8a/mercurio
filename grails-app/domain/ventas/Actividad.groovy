package ventas

import seguridad.Accn

class Actividad {

    Link link
    String ip
    String informacion
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
            ip column: 'actv__ip'
            informacion column: 'actvinfo'
            fecha column: 'actvfcha'
        }
    }
    static constraints = {
        informacion(size: 0..255, blank: true, nullable: true)
        fecha(blank: true, nullable: true)
        link(blank: false, nullable: false)
        ip(blank: true, nullable: true)
    }
}
