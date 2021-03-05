package ventas

import seguridad.Persona

class Alerta {

    Producto producto
    Persona persona
    Date fechaIngreso
    Date fechaAprobacion
    String observaciones
    String estado

    static mapping = {
        table 'alrt'
        cache usage: 'read-write', include: 'non-lazy'
        id column: 'alrt__id'
        id generator: 'identity'
        version false
        columns {
            id column: 'alrt__id'
            producto column: 'prod__id'
            persona column: 'prsn__id'
            fechaIngreso column: 'alrtfcig'
            fechaAprobacion column: 'alrtfcap'
            observaciones column: 'alrtobsr'
            estado column: 'alrtetdo'
        }
    }
    static constraints = {
        producto(blank: false, nullable: false)
        persona(blank: true, nullable: true)
        fechaIngreso(blank: false, nullable: false)
        fechaAprobacion(blank: true, nullable: true)
        observaciones(blank: true, nullable: true, size: 0..255)
        estado(blank: true, nullable: true, size: 0..1)
    }
}
