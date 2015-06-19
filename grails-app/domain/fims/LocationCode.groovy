package fims

class LocationCode {
    String code // Code 1 On-Campus – The facility is located on a lot contiguous to the main campus.
                // Code 2 Off-Campus – The facility is located on a noncontiguous lot less than 20 miles from the main campus.
                // Code 3 Remote Location – The facility is located on a noncontiguous lot more than 20 miles from the main campus.
    String description

    static constraints = {
        // Grails-generated views show attributes in order of constraint
        code blank:false, maxSize:1, matches:"[1-3]"
        description maxSize:30, blank:false, matches:"[\\w -]+"
    }

    String getDisplayString() { return description }
}
