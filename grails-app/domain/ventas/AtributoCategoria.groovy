package ventas

class AtributoCategoria {

    Categoria categoria
    Atributo atributo

    static mapping = {
        table 'atct'
        cache usage: 'read-write', include: 'non-lazy'
        id column: 'atct__id'
        id generator: 'identity'
        version false
        columns {
            id column: 'atct__id'
            categoria column: 'ctgr__id'
            atributo column: 'atrb__id'
        }
    }
    static constraints = {
        categoria(blank: false, nullable: false)
        atributo(blank: false, nullable: false)
    }
}
