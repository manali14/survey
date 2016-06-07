package survey

import grails.plugin.springsecurity.annotation.Secured

@Secured("ROLE_ADMIN")
class AdminController {

    def index() {
        [candidateList: Candidate.list()]
    }
}