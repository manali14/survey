package survey

import commandObjects.CandidateCO

class UserController {

    def register(CandidateCO candidateCO) {
        if (candidateCO.validate()) {
            Candidate candidate = new Candidate()
            candidate.properties = candidateCO
            candidate.save(flush: true, failOnError: true)
            redirect(controller: 'quiz')
        } else {
            flash.error = message(code: 'candidate.registration.error')
            render(view: '/index', model: [candidateCO: candidateCO])
        }
    }
}
