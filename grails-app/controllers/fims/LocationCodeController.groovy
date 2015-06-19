package fims



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class LocationCodeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond LocationCode.list(params), model:[locationCodeInstanceCount: LocationCode.count()]
    }

    def show(LocationCode locationCodeInstance) {
        respond locationCodeInstance
    }

    def create() {
        respond new LocationCode(params)
    }

    @Transactional
    def save(LocationCode locationCodeInstance) {
        if (locationCodeInstance == null) {
            notFound()
            return
        }

        if (locationCodeInstance.hasErrors()) {
            respond locationCodeInstance.errors, view:'create'
            return
        }

        locationCodeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'locationCode.label', default: 'LocationCode'), locationCodeInstance.id])
                redirect locationCodeInstance
            }
            '*' { respond locationCodeInstance, [status: CREATED] }
        }
    }

    def edit(LocationCode locationCodeInstance) {
        respond locationCodeInstance
    }

    @Transactional
    def update(LocationCode locationCodeInstance) {
        if (locationCodeInstance == null) {
            notFound()
            return
        }

        if (locationCodeInstance.hasErrors()) {
            respond locationCodeInstance.errors, view:'edit'
            return
        }

        locationCodeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'LocationCode.label', default: 'LocationCode'), locationCodeInstance.id])
                redirect locationCodeInstance
            }
            '*'{ respond locationCodeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(LocationCode locationCodeInstance) {

        if (locationCodeInstance == null) {
            notFound()
            return
        }

        locationCodeInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'LocationCode.label', default: 'LocationCode'), locationCodeInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'locationCode.label', default: 'LocationCode'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
