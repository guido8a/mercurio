package ventas

import seguridad.Persona

class Anuncio {

    Producto producto
    Persona persona
    String estado
    String pago
    Date fecha
    Date fechaAprobacion
    String observaciones

    static mapping = {
        table 'anun'
        cache usage:'read-write', include:'non-lazy'
        version false
        id generator: 'identity'

        columns {
            id          column: 'anun__id'
            producto column: 'prod__id'
            persona column: 'prsn__id'
            estado column: 'anunetdo'
            pago column: 'anunpago'
            fecha column: 'anunfcha'
            fechaAprobacion column: 'anunfcap'
            observaciones column: 'anunobsr'
        }
    }

    static constraints = {
        producto(blank:false, nullable: false)
        persona(blank:true, nullable: true)
        estado(blank:false, nullable: false)
        pago(size:0..1,blank:true, nullable:true)
        observaciones(size:0..255,blank:true, nullable:true)
        fecha(blank:true, nullable: true)
        fechaAprobacion(blank:true, nullable: true)
    }

}
