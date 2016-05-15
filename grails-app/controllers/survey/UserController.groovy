package survey

import commandObjects.CandidateCO

class UserController {

    def register(CandidateCO candidateCO) {
        if (candidateCO.validate()) {
            render "Valid"
        } else {
            flash.error = message(code: 'candidate.registration.error')
            render(view: '/index', model: [candidateCO: candidateCO])
        }
    }
}
