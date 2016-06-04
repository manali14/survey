package survey

import commandObjects.CandidateCO
import grails.converters.JSON

class UserController {

    def register(CandidateCO candidateCO) {
        if (candidateCO.validate()) {
            Candidate candidate = new Candidate()
            candidate.properties = candidateCO
            candidate.save(flush: true, failOnError: true)
            render(template: '/user/entityQuestionaire', model: [candidateId: candidate?.id])
        } else {
            flash.error = message(code: 'candidate.registration.error')
            render([fail: "Error while Registration. Please try again. ${candidateCO.errors.allErrors*.defaultMessage}"] as JSON)
        }
    }
}
