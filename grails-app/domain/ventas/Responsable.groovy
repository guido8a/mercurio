package ventas

class Responsable {

    Vendedor vendedor
    Producto producto
    Date fechaDesde
    Date fechaHasta
    String observaciones

    static mapping = {
        table 'rspn'
        cache usage: 'read-write', include: 'non-lazy'
        id column: 'rspn__id'
        id generator: 'identity'
        version false
        columns {
            id column: 'rspn__id'
            vendedor column: 'vndr__id'
            producto column: 'prod__id'
            fechaHasta column: 'rspnfchs'
            fechaDesde column: 'rspnfcds'
            observaciones column: 'rspnobsr'
        }
    }
    static constraints = {
        vendedor(blank:false, nullable: false)
        producto(blank:false, nullable: false)
        fechaDesde(blank:false, nullable: false)
        fechaHasta(blank:true, nullable: true)
        observaciones(size: 1..255, blank: true, nullable: true)
    }
}
