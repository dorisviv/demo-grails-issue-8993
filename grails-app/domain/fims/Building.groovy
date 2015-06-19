package fims

class Building {
    static hasMany = [floors: Floor]
    static belongsTo = [campus: Campus]
    static mapping = { sort bldgCode: "asc" }

    Address address
    String bldgCode
    Campus campus           // Building Location
    byte[] image


    static constraints = {
        // Grails-generated views show attributes in order of constraint
        bldgCode blank:false, maxSize:20, matches:"[\\w \\d]*"
        campus nullable:false
        image nullable:true, maxSize:204800     // 200 KB
    }

    String getDisplayString() { return bldgCode }

 }
