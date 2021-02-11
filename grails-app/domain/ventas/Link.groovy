package ventas

class Link {

    String titulo
    String link
    String logo
    int orden
    String texto
    String activo

    static mapping = {
        table 'link'
        cache usage: 'read-write', include: 'non-lazy'
        id column: 'link__id'
        id generator: 'identity'
        version false
        columns {
            id column: 'link__id'
            titulo column: 'linktitl'
            link column: 'linklink'
            logo column: 'linklogo'
            orden column: 'linkordn'
            texto column: 'linktxto'
            activo column: 'linkactv'
        }
    }
    static constraints = {
        titulo(size: 1..127, blank: false, nullable: false)
        link(size: 1..255, blank: false, nullable: false)
        logo(size: 1..255, blank: true, nullable: true)
        orden(blank: false, nullable: false)
        texto(blank: true, nullable: true)
        activo(blank: false, nullable: false)
    }
}


