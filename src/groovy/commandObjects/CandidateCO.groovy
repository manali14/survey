package commandObjects

import enums.Caste
import enums.Gender
import enums.StudyType
import grails.validation.Validateable

@Validateable
class CandidateCO {
    String email
    String name
    String mobileNumber
    String school
    Integer age
    Gender gender
    Caste caste
    StudyType studyType

    static constraints = {
        email email: true, nullable: true
        mobileNumber nullable: false, maxSize: 10, minSize: 10, validator: { val, obj ->
            if (!val.matches("^[0-9]*\$")) {
                return 'candidate.mobile.number.invalid'
            }
        }
        name nullable: true
        school nullable: false
        age nullable: false
        gender nullable: false
        caste nullable: false
    }
}
