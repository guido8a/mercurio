package ventas

import geografia.Canton
import seguridad.Persona

class Producto {

    Subcategoria subcategoria
    Persona persona
    Canton canton
    Producto padre
    String titulo
    String subtitulo
    String estado
    String texto
    Date fecha
    Date fechaModificacion
    String sitio
    double latitud
    double longitud

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
            padre column: 'prodpdre'
            titulo column: 'prodtitl'
            subtitulo column: 'prodsbtl'
            estado column: 'prodetdo'
            texto column: 'prodtxto'
            fecha column: 'prodfcha'
            fechaModificacion column: 'prodfcmd'
            sitio column: 'prodsito'
            latitud column: 'prodlatt'
            longitud column: 'prodlong'
        }
    }

    static constraints = {
        canton(blank:true, nullable: true)
        subcategoria(blank:true, nullable:true)
        persona(blank:true, nullable: true)
        padre(blank:true, nullable: true)
        titulo(blank:true,nullable: true, size:0..255)
        subtitulo(blank:true, nullable: true, size:0..255)
        estado(blank:false)
        texto(blank: true, nullable: true)
        fecha(blank: false, nullable:false)
        fechaModificacion(blank: true, nullable:true)
        sitio(blank:true, nullable: true, size:0..127)
        latitud(blank:true, nullable:true)
        longitud(blank:true, nullable:true)
    }

    String toString(){
        return "${this.titulo}"
    }

}
