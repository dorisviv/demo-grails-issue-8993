package fims

class Address {
    LocationCode locationCode

    String street1
    String street2
    String city
    String state
    String zip

    static constraints = {
        // Grails-generated views show attributes in order of constraint
        street1 blank:false, maxSize:100, matches:"[\\w /&%#:\$!@*():;_\"'?.,+-]+"
        street2 blank:true, nullable:true, maxSize:100, matches:"[\\w /&%#:\$!@*():;_\"'?.,+-]+"
        city blank:false, maxSize:100, matches:"[\\w /&%#:\$!@*():;_\"'?.,+-]+"
        state blank:false, maxSize:2, matches:"[A-Z][A-Z]"
        zip blank:false, matches: "^(\\d{5}(?:\\-\\d{4})?)\$"
    }

    String getDisplayString() { return street1 }
}
