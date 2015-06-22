package fims

class Campus {
    static hasMany = [buildings:  Building]
    static belongsTo = [institution: Institution]
    static mapping = { mapImage type: org.hibernate.type.MaterializedBlobType }

    String name
    byte[] mapImage
    Date mapImageDate

    static constraints = {
        // Grails-generated views show attributes in order of constraint
        name maxSize:100, matches:"[\\w /&%#:\$!@*():;_\"'?.,+-]+", blank:false
        mapImage nullable:true
        mapImageDate nullable:true
    }

    String getDisplayString() { return name }
}
