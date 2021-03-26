package ventas

class Cliente {

    Producto producto
    String nombre
    String apellido
    String mail
    String telefono
    Date fecha
    String pregunta

    static mapping = {
        table 'clnt'
        cache usage: 'read-write', include: 'non-lazy'
        id column: 'clnt__id'
        id generator: 'identity'
        version false
        columns {
            id column: 'clnt__id'
            producto column: 'prod__id'
            nombre column: 'cnttnmbr'
            apellido column: 'cnttapll'
            mail column: 'cnttmail'
            telefono column: 'cntttelf'
            fecha column: 'cnttfcha'
            pregunta column: 'cnttpreg'
        }
    }
    static constraints = {
        producto(blank: false, nullable: false)
        nombre(size: 1..31, blank: false, nullable: false)
        apellido(size: 0..31, blank: true, nullable: true)
        telefono(size: 0..15, blank: true, nullable: true)
        mail(size: 1..63, blank: false, nullable: false)
        fecha(blank: true, nullable: true)
        pregunta(size: 1..1023, blank:false, nullable: false)
    }
}
