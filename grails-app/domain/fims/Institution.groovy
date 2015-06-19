package fims

class Institution {
    static hasMany = [campuses: Campus]

    Address address
    String name
    String ficeCode

    static constraints = {
        // Grails-generated views show attributes in order of constraint
        name maxSize:100, matches:"[\\w /&%#:\$!@*():;_\"'?.,+-]+", blank:false
        ficeCode maxSize:6, matches:"[\\d]+", blank:false
    }

    String getDisplayString() { return name }
}
