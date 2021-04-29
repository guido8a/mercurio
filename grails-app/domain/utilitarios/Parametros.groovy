package utilitarios

import audita.Auditable

class Parametros implements Auditable {
    static auditable = true

    String pagado

    static mapping = {
        table 'prax'
        cache usage: 'read-write', include: 'non-lazy'
        id column: 'prax__id'
        id generator: 'identity'
        version false
        columns {
            pagado column: 'praxpago'
        }
    }
    static constraints = {
        pagado(blank: false, nullable: false, attributes: [title: 'Pagado'])
    }
}
