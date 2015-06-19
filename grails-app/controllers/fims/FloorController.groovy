package fims



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class FloorController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Floor.list(params), model:[floorInstanceCount: Floor.count()]
    }

    def show(Floor floorInstance) {
        respond floorInstance
    }

    def create() {
        respond new Floor(params)
    }

    @Transactional
    def save(Floor floorInstance) {
        if (floorInstance == null) {
            notFound()
            return
        }

        if (floorInstance.hasErrors()) {
            respond floorInstance.errors, view:'create'
            return
        }

        floorInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'floor.label', default: 'Floor'), floorInstance.id])
                redirect floorInstance
            }
            '*' { respond floorInstance, [status: CREATED] }
        }
    }

    def edit(Floor floorInstance) {
        respond floorInstance
    }

    @Transactional
    def update(Floor floorInstance) {
        if (floorInstance == null) {
            notFound()
            return
        }

        if (floorInstance.hasErrors()) {
            respond floorInstance.errors, view:'edit'
            return
        }

        floorInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Floor.label', default: 'Floor'), floorInstance.id])
                redirect floorInstance
            }
            '*'{ respond floorInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Floor floorInstance) {

        if (floorInstance == null) {
            notFound()
            return
        }

        floorInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Floor.label', default: 'Floor'), floorInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'floor.label', default: 'Floor'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
