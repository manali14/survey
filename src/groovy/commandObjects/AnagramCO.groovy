package commandObjects

import grails.validation.Validateable
import survey.Candidate
import survey.Question

@Validateable
class AnagramCO {
    String answer
    Question question
    Candidate candidate
}
