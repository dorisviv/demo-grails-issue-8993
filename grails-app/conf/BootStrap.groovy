import fims.Address
import fims.Building
import fims.Campus
import fims.Floor
import fims.FloorDescr
import fims.Institution
import fims.LocationCode
import fims.Space

class BootStrap {

    def init = { servletContext ->
        def appName = grails.util.Holders.applicationContext.grailsApplication.metadata['app.name']
        def version = grails.util.Holders.applicationContext.grailsApplication.metadata['app.version']
        environments {
            development {
                println "**** ${appName} Ver. ${version} detected development"
                def locationCode = new LocationCode([code: "1", description: "On Campus"])
                locationCode.save()
                def address = new Address([
                        street1: "800 W. Main Road",
                        city: "Richardson",
                        state: "TX",
                        zip: "12345",
                        locationCode: locationCode])
                address.save()
                def institution = new Institution([
                        address       : address,
                        name          : "University of DFW",
                        ficeCode      : "123456"])
                institution.save()
                def campus = new Campus([name: "Main Campus", institution: institution])
                def building = new Building([bldgCode: "AD"])
                building.campus = campus
                building.address = address
                campus.save()
                building.save()
                campus.addToBuildings(building)
                def floorDescr = new FloorDescr([floorCode: "01", description: "1st Floor"])
                floorDescr.save()
                def floor = new Floor([floorDescr: floorDescr, building: building])
                building.addToFloors(floor)
                floor.save()
                def space = new Space([floor: floor, spaceNum: "1.100", capacity: 20, seatCapacity: 10, area: 100])
                space.save()
            }
            test {
                println "**** ${appName} Ver. ${version} detected test"
            }
            production {
                println "**** ${appName} Ver. ${version} detected production"
            }
        }
    }
    def destroy = {
    }
}
