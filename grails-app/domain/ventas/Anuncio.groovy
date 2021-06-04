package ventas

import seguridad.Persona

class Anuncio {

    Producto producto
    Persona persona
    TipoPago tipoPago
    String estado
//    String pago
    Date fecha
    Date fechaInicio
    Date fechaFin
    Date fechaAprobacion
    Date fechaModificacion
    String observaciones

    static mapping = {
        table 'anun'
        cache usage:'read-write', include:'non-lazy'
        version false
        id generator: 'identity'

        columns {
            id          column: 'anun__id'
            producto column: 'prod__id'
            tipoPago column: 'tppg__id'
            persona column: 'prsn__id'
            estado column: 'anunetdo'
//            pago column: 'anunpago'
            fecha column: 'anunfcha'
            fechaInicio column: 'anunfcin'
            fechaFin column: 'anunfcfn'
            fechaAprobacion column: 'anunfcap'
            fechaModificacion column: 'anunfcmd'
            observaciones column: 'anunobsr'
        }
    }

    static constraints = {
        producto(blank:false, nullable: false)
        persona(blank:true, nullable: true)
        tipoPago(blank:true, nullable: true)
        estado(blank:false, nullable: false)
//        pago(size:0..1,blank:false, nullable:false)
        observaciones(size:0..255,blank:true, nullable:true)
        fecha(blank:false, nullable: false)
        fechaInicio(blank:true, nullable: true)
        fechaFin(blank:true, nullable: true)
        fechaModificacion(blank:true, nullable: true)
        fechaAprobacion(blank:true, nullable: true)
    }

}
