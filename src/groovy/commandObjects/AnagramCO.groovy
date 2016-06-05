package commandObjects

import grails.validation.Validateable
import survey.Question

@Validateable
class AnagramCO {
    String answer
    Question question
}
