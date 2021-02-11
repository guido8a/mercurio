package ventas

class Anuncio {

    Promotor promotor
    Subcategoria subcategoria
    String nombre
    String descripcion
    String estado

    static mapping = {
        table 'anun'
        cache usage:'read-write', include:'non-lazy'
        version false
        id generator: 'identity'

        columns {
            id          column: 'anun__id'
            subcategoria column: 'sbct__id'
            promotor column: 'prmt__id'
            nombre      column: 'anunnmbr'
            descripcion column: 'anundscr'
            estado      column: 'anunetdo'
        }
    }

    static constraints = {
        categoria(blank:false, nullable: false)
        promotor(blank:false, nullable: false)
        nombre(blank:false,size:4..63)
        descripcion(blank:true,size:1..255)
        estado(blank:false, nullable: false)
    }

    String toString(){
        return "${this.nombre}"
    }
}
