package fims

import grails.plugin.spock.IntegrationSpec
import spock.lang.*

class AddressIntegrationSpec extends Specification {

    def "saving Address to database"() {
        given: "A new address"
        def locationCodeObj = new LocationCode([code: "1", description: "On Campus"])
        def address = new Address([
                street1: "800 W. Main Road",
                city: "Richardson",
                state: "TX",
                zip: "12345",
                locationCode: locationCodeObj])
        when: "the address is saved"
        locationCodeObj.save()
        address.save()
        then: "it saved successfully and can be found in the database"
        locationCodeObj.errors.errorCount == 0
        locationCodeObj.id != null
        LocationCode.get(locationCodeObj.id).code == locationCodeObj.code
        address.errors.errorCount == 0
        address.id != null
        Address.get(address.id).zip == address.zip
        Address.get(address.id).locationCode.code == locationCodeObj.code

        when: "Where query: simple property comparison"
        def query = Address.where {
            zip == "12345"
        }.get()
        address = query.find()
        then: "The address zip is found"
        address != null
        address.zip == "12345"
        address.locationCode.code == "1"

        when: "Where query on association"
        query = Address.where {
            locationCode.code == "1"
        }
        address = query.find()
        then: "Addresses with location code '1' are found"
        address!= null
        address.locationCode.code == "1"

        // Why are address.zip and address.locationCode.code ArrayLists?
        when: "HQL query on attribute"
        address = Address.executeQuery("from  Address where zip = '12345'")
        then: "Address with location code '1' is found"
        address != null
        println "address.zip is: ${address.zip.getClass().name}"
        address.zip[0] == "12345"
        println "code: ${address.locationCode.code}"
        address.locationCode.code[0] == "1"

        // Why are address.zip and address.locationCode.code ArrayLists?
        when: "HQL query on 1. level association"
        address = Address.executeQuery("from  Address where locationCode.code = '1'")
        then: "Address with location code '1' is found"
        address != null
        address.zip[0] == "12345"
        address.locationCode.code[0] == "1"

        when: "Criteria query on attribute"
        def c = Address.createCriteria()
        address = c.get {
            eq("zip", "12345")
        }
        then: "The address zip is found"
        address != null
        address.zip == "12345"
        address.locationCode.code == "1"

        when: "Criteria query on 1. level association"
        c = Address.createCriteria()
        address = c.get {
            locationCode {
                eq("code", "1")
            }
        }
        then: "The address zip is found"
        address != null
        address.zip == "12345"
        address.locationCode.code == "1"
    }
}
