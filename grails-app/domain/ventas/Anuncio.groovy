package ventas

class Anuncio {

    Promotor promotor
    Categoria categoria
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
            categoria column: 'ctgr__id'
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
        descripcion(blank:false,size:0..255)
        estado(blank:false, inList: ["A", "N"])
    }

    String toString(){
        return "${this.nombre}"
    }
}
