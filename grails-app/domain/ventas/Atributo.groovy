package ventas

class Atributo {

    String descripcion

    static mapping = {
        table 'atrb'
        cache usage: 'read-write', include: 'non-lazy'
        id column: 'atrb__id'
        id generator: 'identity'
        version false
        columns {
            id column: 'atrb__id'
            descripcion column: 'atrbdscr'
        }
    }
    static constraints = {
        descripcion(size: 1..127, blank: false, nullable: false)
    }
}
