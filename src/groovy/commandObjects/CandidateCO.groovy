package commandObjects

import enums.Gender
import grails.validation.Validateable

@Validateable
class CandidateCO {
    String email
    String name
    String mobileNum
    Gender gender

    static constraints = {
        email email: true, nullable: false
        name nullable: false
        mobileNum maxSize: 10, minSize: 10, validator: { val, obj ->
            if (!val.matches("^[0-9]*\$")) {
                return 'candidate.mobile.number.invalid'
            }
        }
    }
}
