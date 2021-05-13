package ventas

class AtributoAnuncio {

    Anuncio anuncio
    Valores valores
    String valor
    int orden
    String atributo

    static mapping = {
        table 'atan'
        cache usage:'read-write', include:'non-lazy'
        version false
        id generator: 'identity'

        columns {
            id column: 'atan__id'
            anuncio column: 'anun__id'
            valores column: 'atvl__id'
            valor column: 'atanvlor'
            orden column: 'atanordn'
            atributo column: 'atanartb'
        }
    }

    static constraints = {
        valores(blank:false, nullable: false)
        anuncio(blank:false, nullable: false)
        valor(size:0..63, blank: true, nullable: true)
        atributo(size:0..127, blank: true, nullable: true)
        orden(blank: true, nullable: true)
    }
}
