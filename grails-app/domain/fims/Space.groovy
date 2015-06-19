package fims

class Space {
    static belongsTo = [floor: Floor]
    static mapping = { sort spaceNum: "asc" }

    String spaceNum
    Integer capacity
    Integer seatCapacity
    BigDecimal area
    Date imageDate
    byte[] image

    static constraints = {
        // Grails-generated views show attributes in order of constraint
        spaceNum blank:false, maxSize:10, matches:"[\\w .-]+"
        area scale:4
        image nullable:true, maxSize:204800     // 200 KB
        imageDate nullable:true
    }

    String getDisplayString() { return spaceNum }
}
