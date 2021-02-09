package ventas

import geografia.Canton

class Promotor {

    Canton canton
    String tipo
    String nombre
    String apellido
    String ruc
    String telefono
    String mail
    Date fecha
    String direccion
    String observaciones
    String estado
    String logo

    static mapping = {
        table 'prmt'
        cache usage: 'read-write', include: 'non-lazy'
        id column: 'prmt__id'
        id generator: 'identity'
        version false
        columns {
            id column: 'prmt__id'
            canton column: 'cntn__id'
            tipo  column: 'prmttppr'
            nombre column: 'prmtnmbr'
            apellido column: 'prmtapll'
            ruc column: 'prmt_ruc'
            telefono column: 'prmttelf'
            mail column: 'prmtmail'
            fecha column: 'prmtfcha'
            direccion column: 'prmtdire'
            observaciones column: 'prmtobsr'
            estado column: 'prmtactv'
            logo column: 'prmtimgn'
        }
    }
    static constraints = {
        canton(blank: false, nullable: false)
        tipo(blank: false, nullable: false)
        nombre(size: 1..63, blank: false, nullable: false)
        apellido(size: 1..31, blank: true, nullable: true)
        ruc(size: 1..13, blank: false, nullable: false)
        telefono(size: 1..127, blank: true, nullable: true)
        mail(size: 1..63, blank: true, nullable: true)
        fecha(blank: true, nullable: true)
        direccion(size: 1..255, blank: true, nullable: true)
        logo(size: 1..255, blank: true, nullable: true)
        observaciones(size: 1..8,blank: true, nullable: true)
        estado(blank:true, nullable: true)
    }
}
