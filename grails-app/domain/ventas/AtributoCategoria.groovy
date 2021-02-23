package ventas

class AtributoCategoria {

    Subcategoria subcategoria
    Atributo atributo

    static mapping = {
        table 'atct'
        cache usage: 'read-write', include: 'non-lazy'
        id column: 'atct__id'
        id generator: 'identity'
        version false
        columns {
            id column: 'atct__id'
            subcategoria column: 'sbct__id'
            atributo column: 'atrb__id'
        }
    }
    static constraints = {
        subcategoria(blank: false, nullable: false)
        atributo(blank: false, nullable: false)
    }
}
