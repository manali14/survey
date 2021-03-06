package survey

import grails.plugin.springsecurity.annotation.Secured

@Secured("ROLE_ADMIN")
class AdminController {

    def index() {
        [candidateList: Candidate.list([order: "desc", sort: "dateCreated"])]
    }

    def fetchUserInfo(Long id) {
        Candidate candidate = Candidate.get(id)
        render(template: '/user/userInfo', model: [candidate: candidate])
    }
}
