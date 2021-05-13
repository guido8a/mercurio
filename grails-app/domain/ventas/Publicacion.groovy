package ventas

class Publicacion {

    Anuncio anuncio
    Pago pago
    Date fechaInicio
    Date fechaFin
    String destacado

    static mapping = {
        table 'publ'
        cache usage: 'read-write', include: 'non-lazy'
        id column: 'publ__id'
        id generator: 'identity'
        version false
        columns {
            id column: 'publ__id'
            anuncio column: 'anun__id'
            pago column: 'pago__id'
            fechaInicio column: 'publfcin'
            fechaFin column: 'publfcfn'
            destacado column: 'publdstc'
        }
    }
    static constraints = {
        anuncio(blank: false, nullable: false)
        pago(blank: true, nullable: true)
        fechaInicio(blank: false, nullable: false)
        fechaFin(blank: true, nullable: true)
        destacado(blank: true, nullable: true)
    }
}
