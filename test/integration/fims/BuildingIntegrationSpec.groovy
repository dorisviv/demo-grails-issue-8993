package fims

import grails.plugin.spock.IntegrationSpec
import spock.lang.*

class BuildingIntegrationSpec extends Specification {

    def "saving Building to database"() {
        given: "A new Building"
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
        campus.save()
        def building = new Building([bldgCode: "AD", address: address])
        when: "the campus and building are saved"
        building.campus = campus
        building.save()
        then: "it saved successfully and can be found in the database"
        campus.errors.errorCount == 0
        campus.id != null
        Campus.get(campus.id).name == campus.name
        building.errors.errorCount == 0
        building.id != null
        Building.get(building.id).bldgCode == building.bldgCode
        Building.get(building.id).campus.name == campus.name

        when: "Where query on attribute"
        def query = Building.where {
            bldgCode == "AD"
        }
        building = query.find()
        then: "The building 'AD' is found"
        Building.list().size() == 1
        building != null
        building.bldgCode == "AD"
        building.campus.name == "Main Campus"

        when: "Where query on association"
        query = Building.where {
            campus.institution.name == 'University of DFW'
        }
        building = query.find()
        then: "The instituion 'University of DFW' is found"
        Building.list().size() == 1
        building != null
        building.bldgCode == "AD"
        building.campus.name == "Main Campus"
        building.campus.institution.name == "University of DFW"

        // Why are building.bldgCode and building.campus.name ArrayLists?
        when: "HQL query on 1st level association"
        building = Building.executeQuery("from Building where bldgCode = 'AD'")
        then: "The building 'AD' is found"
        building != null
        building.bldgCode[0] == "AD"
        building.campus.name[0] == "Main Campus"

        // Why are building.bldgCode and building.campus.name ArrayLists?
        when: "HQL query on 2nd level association"
        building = Building.executeQuery("from Building where campus.name = 'Main Campus'")
        then: "The building 'AD' is found"
        building != null
        building.bldgCode[0] == "AD"
        building.campus.name[0] == "Main Campus"

        when: "Criteria query on attribute"
        def c = Building.createCriteria()
        building = c.get {
            eq("bldgCode", "AD")
        }
        then: "The building 'AD' is found"
        building != null
        building.bldgCode == "AD"
        building.campus.name == "Main Campus"

        when: "Criteria query on association"
        c = Building.createCriteria()
        building = c.get {
            campus {
                eq("name", "Main Campus")
            }
        }
        then: "The building 'AD' is found"
        building != null
        building.bldgCode == "AD"
        building.campus.name == "Main Campus"
    }

}
