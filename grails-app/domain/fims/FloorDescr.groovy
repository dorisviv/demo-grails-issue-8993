package fims

class FloorDescr {
    static hasMany = [floors:  Floor]
    static mapping = { sort floorCode: "asc" }

    String floorCode
    String description
    /*
        M1 mezzanine 1
        M2 mezzanine 2
        10 10th floor
        09 9th floor
        08 8th floor
        07 7th floor
        06 6th floor
        05 5th floor
        04 4th floor
        03 3rd floor
        02 2nd floor
        01 1st floor
        00 basement
        S1 sub-basement 1
        S2 sub-basement 2
     */

    static constraints = {
        // Grails-generated views show attributes in order of constraint
        floorCode blank:false, maxSize:2, matches:"[A-Z0-9]+"       // reporting manual 2523 Fall 2014
        description blank:false, maxSize:20, matches:"[\\w -]+"
    }

    String getDisplayString() { return floorCode }

}
