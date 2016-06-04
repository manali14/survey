package survey

import commandObjects.EntityQuestionaireCO
import enums.EntityQuestionaireResponse
import grails.converters.JSON

class QuizController {

    def study1() {

    }

    def study2() {

    }

    def study3() {

    }

    def playQuiz(Long id) {
        Quiz quiz = Quiz.get(id)
        if (quiz) {
            [quiz: quiz]
        } else {
            redirect(uri: '/')
        }
    }

    def showQuestions(Long id) {
        if (request.xhr) {
            render(template: '/quiz/questions')
        }
    }

    def saveEntityQuestionaireScore(EntityQuestionaireCO entityQuestionaireCO) {
        entityQuestionaireCO.responses = params.list('responses[]')
        Integer entityQuestionaireScore = 0
        entityQuestionaireCO.responses.each {
            EntityQuestionaireResponse entityQuestionaireResponse = EntityQuestionaireResponse.valueOf(it)
            entityQuestionaireScore += entityQuestionaireResponse.score
        }
        Candidate candidate = entityQuestionaireCO.candidate
        candidate.entityQuestionaireScore = entityQuestionaireScore
        if (candidate.save(flush: true)) {
            render([success: "Score saved successfully"] as JSON)
        } else {
            render([fail: "Error while saving score. Please try again"] as JSON)
        }
    }
}
