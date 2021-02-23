package ventas

class Cliente {

    Anuncio anuncio
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
            anuncio column: 'anun__id'
            nombre column: 'cnttnmbr'
            apellido column: 'cnttapll'
            mail column: 'cnttmail'
            telefono column: 'cntttelf'
            fecha column: 'cnttfcha'
            pregunta column: 'cnttpreg'
        }
    }
    static constraints = {
        anuncio(blank: false, nullable: false)
        nombre(size: 1..31, blank: false, nullable: false)
        apellido(size: 1..31, blank: false, nullable: false)
        telefono(size: 1..15, blank: false, nullable: false)
        mail(size: 1..63, blank: true, nullable: true)
        fecha(blank: true, nullable: true)
        pregunta(size: 1..1023, blank:false, nullable: false)
    }
}
