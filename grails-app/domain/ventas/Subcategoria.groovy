package ventas

class Subcategoria {

    Categoria categoria
    String descripcion
    int orden

    static mapping = {
        table 'sbct'
        cache usage: 'read-write', include: 'non-lazy'
        id column: 'sbct__id'
        id generator: 'identity'
        version false
        columns {
            id column: 'sbct__id'
            descripcion column: 'sbctdscr'
            orden column: 'sbctordn'
            categoria column: 'ctgr__id'
        }
    }
    static constraints = {
        descripcion(size: 1..63, blank: false, nullable: false)
        orden(blank: false, nullable: false)
        categoria(blank: false, nullable: false)
    }
}
