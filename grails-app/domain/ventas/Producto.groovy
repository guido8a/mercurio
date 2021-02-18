package ventas

class Producto {
    Anuncio anuncio
    String titulo
    String subtitulo
    int orden
    String estado
    String texto

    static mapping = {
        table 'prod'
        cache usage:'read-write', include:'non-lazy'
        version false
        id generator: 'identity'

        columns {
            id column: 'prod__id'
            anuncio column: 'anun__id'
            titulo column: 'prodtitl'
            subtitulo column: 'prodsbtt'
            orden column: 'prodordn'
            estado column: 'prodetdo'
            texto column: 'prodtxto'
        }
    }

    static constraints = {
        titulo(blank:false,size:0..255)
        subtitulo(blank:true,size:0..255)
        orden(blank:false)
        estado(blank:false)
        texto(blank: true, nullable: true)
    }

   String toString(){
       return "${this.titulo}"
   }
}
