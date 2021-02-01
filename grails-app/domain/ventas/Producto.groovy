package ventas

class Producto {
    Anuncio anuncio
//    Layout layout
    String menu
    String titulo
    String subtitulo
    int orden
    String estado
    String imagen

    static mapping = {
        table 'prod'
        cache usage:'read-write', include:'non-lazy'
        version false
        id generator: 'identity'

        columns {
            id column: 'prod__id'
            anuncio column: 'anun__id'
            menu column: 'prodmenu'
            titulo column: 'prodtitl'
            subtitulo column: 'prodsbtt'
            orden column: 'prodordn'
            estado column: 'prodetdo'
            imagen column: 'prodimgn'
        }
    }


    static constraints = {
        menu(blank:false,size:1..63)
        titulo(blank:false,size:0..255)
        subtitulo(blank:true,size:0..255)
        orden(blank:false)
        estado(blank:false, inList: ["A", "N"])
//        estado(blank:true, size:0..255)
        imagen(nullable: true)
    }

   String toString(){
       return "${this.titulo}"
   }
}
