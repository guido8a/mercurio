package ventas

class Categoria {

    String descripcion
    int orden

    static mapping = {
        table 'ctgr'
        cache usage: 'read-write', include: 'non-lazy'
        id column: 'ctgr__id'
        id generator: 'identity'
        version false
        columns {
            id column: 'ctgr__id'
            descripcion column: 'ctgrdscr'
            orden column: 'ctgrordn'
        }
    }
    static constraints = {
        descripcion(size: 1..31, blank: false, nullable: false)
        orden(blank: false, nullable: false)
    }
}
