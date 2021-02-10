package ventas

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class AnuncioController {

//    AnuncioService anuncioService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond anuncioService.list(params), model:[anuncioCount: anuncioService.count()]
    }

    def show(Long id) {
        respond anuncioService.get(id)
    }

    def create() {
        respond new Anuncio(params)
    }

    def save(Anuncio anuncio) {
        if (anuncio == null) {
            notFound()
            return
        }

        try {
            anuncioService.save(anuncio)
        } catch (ValidationException e) {
            respond anuncio.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'anuncio.label', default: 'Anuncio'), anuncio.id])
                redirect anuncio
            }
            '*' { respond anuncio, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond anuncioService.get(id)
    }

    def update(Anuncio anuncio) {
        if (anuncio == null) {
            notFound()
            return
        }

        try {
            anuncioService.save(anuncio)
        } catch (ValidationException e) {
            respond anuncio.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'anuncio.label', default: 'Anuncio'), anuncio.id])
                redirect anuncio
            }
            '*'{ respond anuncio, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        anuncioService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'anuncio.label', default: 'Anuncio'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'anuncio.label', default: 'Anuncio'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
