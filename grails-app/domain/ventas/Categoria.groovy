package ventas

class Categoria {

    String descripcion

    static mapping = {
        table 'ctgr'
        cache usage: 'read-write', include: 'non-lazy'
        id column: 'ctgr__id'
        id generator: 'identity'
        version false
        columns {
            id column: 'ctgr__id'
            descripcion column: 'ctgrdscr'
        }
    }
    static constraints = {
        descripcion(size: 1..255, blank: false, nullable: false)
    }
}
