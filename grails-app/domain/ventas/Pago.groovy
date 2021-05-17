package ventas

class Pago {

    TipoPago tipoPago
    Anuncio anuncio
    Date fecha
    double valor
    String tipo
    Date fechaInicio
    Date fechaFin
    String ruta
    String estado
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
            anuncio column: 'anun__id'
            fecha column: 'pagofcha'
            valor column: 'pagovlor'
            tipo column: 'pagotipo'
            fechaInicio column: 'pagofcin'
            fechaFin column: 'pagofcfn'
            ruta column: 'pagoruta'
            estado column: 'pagoetdo'
            observaciones column: 'pagoobsr'
        }
    }
    static constraints = {
        tipoPago(blank: false, nullable: false)
        anuncio(blank: true, nullable: true)
        fecha(blank: false, nullable: false)
        valor(blank: false, nullable: false)
        tipo(blank: true, nullable: true)
        fechaInicio(blank: false, nullable: false)
        fechaFin(blank: false, nullable: false)
        ruta(size:1..127, blank: true, nullable: true)
        estado(size: 0..1, blank: true, nullable: true)
        observaciones(blank: true, nullable: true)
    }
}
