package ventas

class Valores {

    Producto producto
    AtributoCategoria atributoCategoria
    String valor
    int orden

    static mapping = {
        table 'atvl'
        cache usage: 'read-write', include: 'non-lazy'
        id column: 'atvl__id'
        id generator: 'identity'
        version false
        columns {
            id column: 'atvl__id'
            producto column: 'prod__id'
            atributoCategoria column: 'atct__id'
            valor column: 'atvlvlor'
            orden column: 'atvlordn'
        }
    }
    static constraints = {
        producto(blank: false, nullable: false)
        atributoCategoria(blank: false, nullable: false)
        valor(size: 1..63, blank: false, nullable: false)
        orden(blank: true, nullable: true)
    }
}
