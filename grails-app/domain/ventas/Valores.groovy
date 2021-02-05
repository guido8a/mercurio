package ventas

class Valores {

    Producto producto
    Atributo atributo
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
            atributo column: 'atbr__id'
            valor column: 'atvlvlor'
            orden column: 'atvlordn'
        }
    }
    static constraints = {
        producto(blank: false, nullable: false)
        atributo(blank: false, nullable: false)
        valor(blank: false, nullable: false)
        orden(blank: true, nullable: true)
    }
}
