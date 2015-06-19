package fims



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class FloorDescrController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond FloorDescr.list(params), model:[floorDescrInstanceCount: FloorDescr.count()]
    }

    def show(FloorDescr floorDescrInstance) {
        respond floorDescrInstance
    }

    def create() {
        respond new FloorDescr(params)
    }

    @Transactional
    def save(FloorDescr floorDescrInstance) {
        if (floorDescrInstance == null) {
            notFound()
            return
        }

        if (floorDescrInstance.hasErrors()) {
            respond floorDescrInstance.errors, view:'create'
            return
        }

        floorDescrInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'floorDescr.label', default: 'FloorDescr'), floorDescrInstance.id])
                redirect floorDescrInstance
            }
            '*' { respond floorDescrInstance, [status: CREATED] }
        }
    }

    def edit(FloorDescr floorDescrInstance) {
        respond floorDescrInstance
    }

    @Transactional
    def update(FloorDescr floorDescrInstance) {
        if (floorDescrInstance == null) {
            notFound()
            return
        }

        if (floorDescrInstance.hasErrors()) {
            respond floorDescrInstance.errors, view:'edit'
            return
        }

        floorDescrInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'FloorDescr.label', default: 'FloorDescr'), floorDescrInstance.id])
                redirect floorDescrInstance
            }
            '*'{ respond floorDescrInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(FloorDescr floorDescrInstance) {

        if (floorDescrInstance == null) {
            notFound()
            return
        }

        floorDescrInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'FloorDescr.label', default: 'FloorDescr'), floorDescrInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'floorDescr.label', default: 'FloorDescr'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
