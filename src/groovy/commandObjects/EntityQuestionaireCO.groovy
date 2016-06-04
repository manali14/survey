package commandObjects

import enums.EntityQuestionaireResponse
import grails.validation.Validateable
import survey.Candidate

@Validateable
class EntityQuestionaireCO {
    List<String> responses
    Candidate candidate
}
