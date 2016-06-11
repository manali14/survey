package commandObjects

import grails.validation.Validateable
import survey.Candidate

@Validateable
class ResponseCO {
    Candidate candidate
    Map questionResponseMap
}
