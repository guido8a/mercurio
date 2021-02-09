package utilitarios

import audita.Auditable

class Parametros implements Auditable {
    static auditable = true

    String imagenes
    String institucion

    static mapping = {
        table 'prax'
        cache usage: 'read-write', include: 'non-lazy'
        id column: 'prax__id'
        id generator: 'identity'
        version false
        columns {
            imagenes column: 'praximgn'
            institucion column: 'praxinst'
        }
    }
    static constraints = {
        imagenes(blank: true, nullable: true, attributes: [title: 'Imagen'])
        institucion(blank: false, nullable: false, attributes: [title: 'Nombre de la Institución'])
    }
}
