package fims

class Floor {
    static hasMany = [spaces: Space]
    static belongsTo = [building: Building]
    static mapping = { image type: org.hibernate.type.MaterializedBlobType }

    FloorDescr floorDescr
    Date imageDate
    byte[] image
    static constraints = {
        image nullable:true, maxSize:204800     // 200 KB
        imageDate nullable:true
    }

    String getDisplayString() { return floorDescr.floorCode }
}
