package ventas

class Anuncio {

    Producto producto
    String titulo
    String subtitulo
    String estado
    int orden
    String texto

    static mapping = {
        table 'anun'
        cache usage:'read-write', include:'non-lazy'
        version false
        id generator: 'identity'

        columns {
            id          column: 'anun__id'
            producto column: 'prod__id'
            titulo column: 'anuntitl'
            subtitulo column: 'anunsbtl'
            estado column: 'anunactv'
            orden column: 'anunordn'
            texto column: 'anuntxto'
        }
    }

    static constraints = {
        producto(blank:false, nullable: false)
        titulo(size: 1..255, blank:false, nullable: false)
        subtitulo(size: 1..255, blank:true, nullable: true)
        estado(blank:false, nullable: false)
        texto(blank:true, nullable: true)
        orden(blank:true, nullable: true)
    }

}
