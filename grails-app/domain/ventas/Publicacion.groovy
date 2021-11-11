package ventas

import geografia.Canton
import seguridad.Persona

class Publicacion {

    Producto producto
    Subcategoria subcategoria
    Persona persona
    Canton canton
    Date fecha
    Date fechaInicio
    Date fechaFin
    String destacado
    String titulo
    String subtitulo
    String estado
    String texto
    String observaciones
    double latitud
    double longitud

    static mapping = {
        table 'publ'
        cache usage:'read-write', include:'non-lazy'
        version false
        id generator: 'identity'

        columns {
            id column: 'publ__id'
            producto column: 'prod__id'
            subcategoria column: 'sbct__id'
            persona column: 'prsn__id'
            canton column: 'cntn__id'
            fecha column: 'publfcha'
            fechaInicio column: 'publfcin'
            fechaFin column: 'publfcfn'
            destacado column: 'publdstc'
            titulo column: 'publtitl'
            subtitulo column: 'publsbtl'
            estado column: 'publetdo'
            texto column: 'publtxto'
            observaciones column: 'publfcmd'
            latitud column: 'publlatt'
            longitud column: 'publlong'
        }
    }

    static constraints = {
        producto(blank:false, nullable: false)
        subcategoria(blank:true, nullable:true)
        persona(blank:true, nullable: true)
        canton(blank:true, nullable: true)
        fecha(blank: false, nullable:false)
        fechaInicio(blank: false, nullable:false)
        fechaFin(blank: false, nullable:false)
        destacado(blank:true, nullable: true, size:0..127)
        titulo(blank:true,nullable: true, size:0..255)
        subtitulo(blank:true, nullable: true, size:0..255)
        estado(blank:false)
        texto(blank: true, nullable: true)
        observaciones(blank: true, nullable: true)
        latitud(blank:true, nullable:true)
        longitud(blank:true, nullable:true)
    }

    String toString(){
        return "${this.titulo}"
    }

}
