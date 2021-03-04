package ventas

import seguridad.Persona

class Producto {

    Subcategoria subcategoria
    Persona persona
    String titulo
    String subtitulo
    String estado
    String texto
    Date fecha

    static mapping = {
        table 'prod'
        cache usage:'read-write', include:'non-lazy'
        version false
        id generator: 'identity'

        columns {
            id column: 'prod__id'
            subcategoria column: 'sbct__id'
            persona column: 'prsn__id'
            titulo column: 'prodtitl'
            subtitulo column: 'prodsbtl'
            estado column: 'prodetdo'
            texto column: 'prodtxto'
            fecha column: 'prodfcha'
        }
    }

    static constraints = {
        subcategoria(blank:false, nullable: false)
        persona(blank:true, nullable: true)
        titulo(blank:false,size:1..255)
        subtitulo(blank:true, nullable: true, size:0..255)
        estado(blank:false)
        texto(blank: true, nullable: true)
        fecha(blank: false, nullable:false)
    }

   String toString(){
       return "${this.titulo}"
   }
}
