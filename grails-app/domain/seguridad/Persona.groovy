package seguridad

import audita.Auditable
import geografia.Canton

class Persona implements Auditable{

    Canton canton
    String tipoPersona
    String cedula
    String nombre
    String apellido
    Date fechaInicio
    Date fechaFin
    String mail
    String login
    String password
    int activo
    Date fecha
    String telefono
    String autorizacion
    String sexo
    String discapacidad
    String direccion
    String referencia
    String observaciones
    String contacto
    String telefonoContacto
    String mailContacto

    static auditable = true

    static hasMany = [perfiles: Sesn]

    def permisos = []

    static mapping = {
        table 'prsn'
        cache usage: 'read-write', include: 'non-lazy'
        id generator: 'identity'
        version false

        columns {
            id column: 'prsn__id'
            canton column: 'cntn__id'
            tipoPersona column: 'prsntppr'
            cedula column: 'prsncdla'
            nombre column: 'prsnnmbr'
            apellido column: 'prsnapll'
            fechaInicio column: 'prsnfcin'
            fechaFin column: 'prsnfcfn'
            mail column: 'prsnmail'
            login column: 'prsnlogn'
            password column: 'prsnpass'
            activo column: 'prsnactv'
            telefono column: 'prsntelf'
            fecha column: 'prsnfcps'
            autorizacion column: 'prsnatrz'
            sexo column: 'prsnsexo'
            discapacidad column: 'prsndscp'
            direccion column: 'prsndire'
            referencia column: 'prsnrefe'
            observaciones column: 'prsnobsr'
            contacto column: 'prsncntc'
            telefonoContacto column: 'prsntfct'
            mailContacto column: 'prsnmlct'
        }
    }
    static constraints = {
        cedula(blank: false, nullable: false)
        nombre(size: 3..31, blank: false)
        apellido(size: 3..31, blank: false)
        fechaInicio(blank: true, nullable: true, attributes: [title: 'Fecha de inicio'])
        fechaFin(blank: true, nullable: true, attributes: [title: 'Fecha de finalización'])
        sexo(inList: ["F", "M"], size: 1..1, blank: false, attributes: ['mensaje': 'Sexo de la persona'])
        mail(size: 3..63, blank: false, nullable: false)
        login(size: 4..15, blank: false, unique: true)
        password(size: 3..63, blank: false, nullable: false)
        fecha(blank: true, nullable: true)
        telefono(size: 0..31, blank: true, nullable: true, attributes: [title: 'teléfono'])
        autorizacion(matches: /^[a-zA-Z0-9ñÑáéíóúÁÉÍÚÓüÜ_-]+$/, blank: true, nullable: true, attributes: [mensaje: 'Contraseña para autorizaciones'])
        activo(blank: false, attributes: [title: 'activo'])
        discapacidad(size: 0..15, blank: true, nullable: true)
        direccion(size: 0..255, blank: true, nullable: true)
        referencia(size: 0..255, blank: true, nullable: true)
        observaciones(size: 0..255, blank: true, nullable: true)
        contacto(blank: true, nullable: true)
        telefonoContacto(blank: true, nullable: true)
        mailContacto(blank: true, nullable: true)

    }

    String toString() {
        "${this.id}: ${this.nombre} ${this.apellido}"
    }

    def getEstaActivo() {
        if (this.activo != 1) {
            return false
        }

        return true
    }

    def vaciarPermisos() {
        this.permisos = []
    }

}
