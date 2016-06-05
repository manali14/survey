package survey

import enums.Caste
import enums.Gender
import enums.StudyType

class Candidate {

    String name
    String email
    String mobileNumber
    String school
    Integer age
    Date dateCreated
    Gender gender
    Caste caste
    StudyType studyType
    Integer entityQuestionaireScore = 0

    static constraints = {
        email nullable: true
        name nullable: true
    }
}
