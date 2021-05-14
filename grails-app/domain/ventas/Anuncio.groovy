package ventas

import geografia.Canton
import seguridad.Persona

class Anuncio {

    Producto producto
    Persona persona
    Canton canton
    Subcategoria subcategoria
    String titulo
    String subtitulo
    String estado
    String texto
    String pago
    String observaciones
    double latitud
    double longitud
    Date fecha

    static mapping = {
        table 'anun'
        cache usage:'read-write', include:'non-lazy'
        version false
        id generator: 'identity'

        columns {
            id          column: 'anun__id'
            producto column: 'prod__id'
            persona column: 'prsn__id'
            canton column: 'cntn__id'
            subcategoria column: 'sbct__id'
            titulo column: 'anuntitl'
            subtitulo column: 'anunsbtl'
            estado column: 'anunactv'
            texto column: 'anuntxto'
            pago column: 'anunpago'
            observaciones column: 'anunobsr'
            longitud column: 'anunlong'
            latitud column: 'anunlatt'
            fecha column: 'anunfcap'
        }
    }

    static constraints = {
        producto(blank:false, nullable: false)
        persona(blank:true, nullable: true)
        canton(blank:true, nullable: true)
        subcategoria(blank:true, nullable: true)
        titulo(size: 1..255, blank:false, nullable: false)
        subtitulo(size: 1..255, blank:true, nullable: true)
        estado(blank:false, nullable: false)
        texto(blank:true, nullable: true)
        pago(size:0..1,blank:true, nullable:true)
        observaciones(blank:true, nullable: true)
        latitud(blank:true, nullable:true)
        longitud(blank:true, nullable:true)
        fecha(blank:true, nullable: true)
    }

}
