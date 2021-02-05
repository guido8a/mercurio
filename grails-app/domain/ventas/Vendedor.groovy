package ventas

class Vendedor {

    Promotor promotor
    String nombre
    String apellido
    String mail
    String telefono
    Date fecha
    String estado

    static mapping = {
        table 'vndr'
        cache usage: 'read-write', include: 'non-lazy'
        id column: 'vndr__id'
        id generator: 'identity'
        version false
        columns {
            id column: 'vndr__id'
            promotor column: 'prmt__id'
            nombre column: 'vndrnmbr'
            apellido column: 'vndrapll'
            mail column: 'vndrmail'
            telefono column: 'vndrtelf'
            fecha column: 'vndrfcha'
            estado column: 'vndractv'
        }
    }
    static constraints = {
        promotor(blank: false, nullable: false)
        nombre(size: 1..31, blank: false, nullable: false)
        apellido(size: 1..31, blank: false, nullable: false)
        telefono(size: 1..63, blank: false, nullable: false)
        mail(size: 1..63, blank: true, nullable: true)
        fecha(blank: true, nullable: true)
        estado(blank:false, nullable: false)
    }
}
