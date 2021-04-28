package ventas

class Pago {

    TipoPago tipoPago
    Producto producto
    Date fecha
    double valor
    String tipo
    Date fechaInicio
    Date fechaFin
    String observaciones


    static mapping = {
        table 'pago'
        cache usage: 'read-write', include: 'non-lazy'
        id column: 'pago__id'
        id generator: 'identity'
        version false
        columns {
            id column: 'pago__id'
            tipoPago column: 'tppg__id'
            producto column: 'prod__id'
            fecha column: 'pagofcha'
            valor column: 'pagovlor'
            tipo column: 'pagotipo'
            fechaInicio column: 'pagofcin'
            fechaFin column: 'pagofcfn'
            observaciones column: 'pagoobsr'
        }
    }
    static constraints = {
        producto(blank: false, nullable: false)
        tipoPago(blank: false, nullable: false)
        fecha(blank: false, nullable: false)
        valor(blank: false, nullable: false)
        tipo(blank: true, nullable: true)
        fechaInicio(blank: false, nullable: false)
        fechaFin(blank: false, nullable: false)
        observaciones(blank: true, nullable: true)
    }
}
