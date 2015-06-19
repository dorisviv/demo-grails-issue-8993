package fims

import spock.lang.Specification

class SpaceIntegrationSpec extends Specification {

    def "saving Space to database"() {
        given: "A new Space"
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
        def floorDescr = new FloorDescr([floorCode: "01", description: "1st floor"])
        floorDescr.save()
        def floor = new Floor([floorDescr: floorDescr, building: building])
        def space = new Space([floor: floor, spaceNum: "1.100", capacity: "50", seatCapacity:20, area:200])
        building.addToFloors(floor)
        building.save()
        floor.addToSpaces(space)
        floor.save()
        space.save()
        building = Building.get(building.id)
        floor = Floor.get(floor.id)
        space = Space.get(space.id)
        then: "it saved successfully and can be found in the database"
        campus.errors.errorCount == 0
        campus.id != null
        Campus.get(campus.id).name == campus.name
        building.errors.errorCount == 0
        building.id != null
        building.bldgCode == building.bldgCode
        building.campus.name == campus.name
        space.floor.floorDescr.floorCode == "01"
        space.floor.building.campus.name == "Main Campus"
        space.floor.building.campus.institution.name == "University of DFW"
        def query

        // 3 levels of where queries
        when: "Where query on 1. level association"
        query = Building.where {
            bldgCode == "AD"
        }
        building = query.find()

        query = Campus.where {
            name == "Main Campus"
        }
        campus = query.find()

        query = Institution.where {
            name == "University of DFW"
        }
        institution = query.find()

        query = Space.where {
            floor.building == building
        }
        space = query.find()

        then: "Space with building code AD is found"
        space!= null
        space.floor.building == building

        when: "Where query on 2. level association"
        query = Space.where {
            floor.building.campus == campus
        }
        space = query.find()
        then: "Space with campus is found"
        space!= null
        space.floor.building.campus == campus

        when: "Where query on 3. level association"
        query = Space.where {
            floor.building.campus.institution == institution
        }
        space = query.find()
        then: "Space with institution is found"
        space!= null
        space.floor.building.campus.institution == institution

        when: "Where query on 3. level association attribute"
        query = Space.where {
            floor.building.campus.institution.name == "University of DFW"
        }
        space = query.find()
        then: "Space with institution name is found"
        space!= null
        space.floor.building.campus.institution.name == "University of DFW"
        space.floor.building.bldgCode == "AD"

        when: "Where sorting on 2. level association attribute and another attribute"
        query = Space.where {
            floor.building.campus.institution.name == 'University of DFW'
            floor.floorDescr.floorCode == 'NA'
        }.order("floor.building.bldgCode", "asc").order ("spaceNum", "asc")     // hibernate.QueryException: could not resolve property: floor.building.bldgCode even
                                                                                // though space.floor.building.bldgCode == "AD" passes
                                                                                // this one throws "java.sql.SQLException Stream has already been closed" with Oracle
        def spaceInstanceList = query.find()
        then: "Found one in list"
        spaceInstanceList.size() == 1

        // 3 levels of criteria queries
        when: "Criteria query on attribute"
        def c = Floor.createCriteria()
        floor = c.get() {
            idEq(floor.id)
        }
        c = Building.createCriteria()
        building = c.get() {
            idEq(building.id)
        }
        c = Campus.createCriteria()
        campus = c.get() {
            idEq(campus.id)
        }
        c = Institution.createCriteria()
        institution = c.get() {
            idEq(institution.id)
        }
        c = Space.createCriteria()
        space = c.get() {
            eq("floor", floor)
        }
        then: "Space with floor is found"
        space!= null
        space.floor == floor
        space.floor.building == building
        space.floor.building.campus == campus
        space.floor.building.campus.institution == institution

        when: "Criteria query on attribute"
        c = Space.createCriteria()
        space = c.get() {
            eq("spaceNum", "1.100")
        }
        then: "Space with number 1.100 is found"
        space!= null
        space.floor.building == building

        when: "Criteria query on 1. level association"      // al subsequent Criteria queries fail
        building = Building.findByBldgCode("AD")
        c = Space.createCriteria()
        space = c.get() {
            floor {
                eq("building", building)
            }
        }
        then: "Space with building code AD is found"
        space!= null
        space.floor.building == building

        when: "Criteria query on 2. level association"
        c = Space.createCriteria()
        space = c.get() {
            floor {
                building {
                    eq("campus", campus)
                }
            }
        }
        then: "Space with campus is found"
        space!= null
        space.floor.building.campus == campus

        when: "Criteria query on 3. level association"
        c = Space.createCriteria()
        space = c.get() {
            floor {
                building {
                    campus {
                        eq("institution", institution)
                    }
                }
            }
        }
        then: "Space with institution is found"
        space!= null
        space.floor.building.campus.institution == institution

        when: "Criteria query on 3. level association attribute"
        c = Space.createCriteria()
        space = c.get() {
            floor {
                building {
                    campus {
                        institution {
                            eq("name", "University of DFW")
                        }
                    }
                }
            }
        }
        then: "Space with institution name is found"
        space!= null
        space.floor.building.campus.institution.name == "University of DFW"
    }
}
