package ventas

class TipoPago {

    String descripcion
    int dias
    double tarifa

    static mapping = {
        table 'tppg'
        cache usage: 'read-write', include: 'non-lazy'
        id column: 'tppg__id'
        id generator: 'identity'
        version false
        columns {
            id column: 'tppg__id'
            descripcion column: 'tppgdscr'
            dias column: 'tppgdias'
            tarifa column: 'tppgtarf'
        }
    }
    static constraints = {
        descripcion(size: 0..63, blank:false, nullable: false)
        dias(blank:false, nullable: false)
        tarifa(blank:false, nullable: false)
    }
}
