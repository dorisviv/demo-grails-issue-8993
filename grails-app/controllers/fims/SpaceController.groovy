package fims



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class SpaceController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        def spaceList
//        def query = "from Space as s where s.floor.building.campus.institution.name = 'University of DFW' order by s.floor.building.bldgCode asc, s.spaceNum asc"
//        spaceList = Space.executeQuery(query)

        // fails with could not resolve property: floor.building.bldgCode
//        spaceList = Space.where {floor.building.campus.institution.name == 'University of DFW'}.order('floor.building.bldgCode', 'asc').order('spaceNum', 'asc').list()

        def c = Space.createCriteria()
        spaceList = c.list {
            floor {
                building {
                    campus {
                        institution {
                            eq("name", "University of DFW")
                        }
                    }
                }
            }
//            order("floor.building.bldgCode", "asc")
            order("spaceNum", "asc")
        }

        respond spaceList, model:[spaceInstanceCount: Space.count()]
    }

    def show(Space spaceInstance) {
        respond spaceInstance
    }

    def create() {
        respond new Space(params)
    }

    @Transactional
    def save(Space spaceInstance) {
        if (spaceInstance == null) {
            notFound()
            return
        }

        if (spaceInstance.hasErrors()) {
            respond spaceInstance.errors, view:'create'
            return
        }

        spaceInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'space.label', default: 'Space'), spaceInstance.id])
                redirect spaceInstance
            }
            '*' { respond spaceInstance, [status: CREATED] }
        }
    }

    def edit(Space spaceInstance) {
        respond spaceInstance
    }

    @Transactional
    def update(Space spaceInstance) {
        if (spaceInstance == null) {
            notFound()
            return
        }

        if (spaceInstance.hasErrors()) {
            respond spaceInstance.errors, view:'edit'
            return
        }

        spaceInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Space.label', default: 'Space'), spaceInstance.id])
                redirect spaceInstance
            }
            '*'{ respond spaceInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Space spaceInstance) {

        if (spaceInstance == null) {
            notFound()
            return
        }

        spaceInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Space.label', default: 'Space'), spaceInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'space.label', default: 'Space'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
