package ventas

import geografia.Canton
import seguridad.Persona

class Producto {

    Subcategoria subcategoria
    Persona persona
    Canton canton
    String titulo
    String subtitulo
    String estado
    String texto
    Date fecha
    String destacado
    String sitio

    static mapping = {
        table 'prod'
        cache usage:'read-write', include:'non-lazy'
        version false
        id generator: 'identity'

        columns {
            id column: 'prod__id'
            subcategoria column: 'sbct__id'
            persona column: 'prsn__id'
            canton column: 'cntn__id'
            titulo column: 'prodtitl'
            subtitulo column: 'prodsbtl'
            estado column: 'prodetdo'
            texto column: 'prodtxto'
            fecha column: 'prodfcha'
            destacado column: 'proddstc'
            sitio column: 'prodsito'
        }
    }

    static constraints = {
        canton(blank:true, nullable: true)
        subcategoria(blank:false, nullable: false)
        persona(blank:true, nullable: true)
        titulo(blank:true,nullable: true, size:0..255)
        subtitulo(blank:true, nullable: true, size:0..255)
        estado(blank:false)
        texto(blank: true, nullable: true)
        fecha(blank: false, nullable:false)
        destacado(blank: true, nullable:true)
        sitio(blank:true, nullable: true, size:0..127)

    }

    String toString(){
        return "${this.titulo}"
    }
}
