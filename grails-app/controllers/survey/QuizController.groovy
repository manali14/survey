package survey

import commandObjects.AnagramCO
import commandObjects.EntityQuestionaireCO
import enums.EntityQuestionaireResponse
import enums.QuestionType
import enums.StudyType
import grails.converters.JSON
import org.apache.commons.lang.time.DurationFormatUtils

class QuizController {

    def study1() {
        [studyType: StudyType.STUDY1]
    }

    def study2() {
        [studyType: StudyType.STUDY2]
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
            if (candidate.studyType) {
                render(template: '/quiz/round1', model: [candidate: candidate])
            } else {
                render([fail: "Error! Please try again."] as JSON)
            }
        } else {
            render([fail: "Error while saving score. Please try again"] as JSON)
        }
    }

    def checkAnangramAnswer(AnagramCO anagramCO) {
        if (anagramCO.answer?.toUpperCase() == anagramCO.question?.correctResponse?.toUpperCase()) {
            render([success: "Correct Answer"] as JSON)
        } else {
            render([fail: "Incorrect Answer"] as JSON)
        }
    }

    def moveToNextLevel(Long candidateId) {
        Boolean showNextLevel = true
        Candidate candidate = Candidate.get(candidateId)
        List answerList = params.list('answerList[]')
        Question.findAllByQuestionType(QuestionType.SIMPLE_ANAGRAM).eachWithIndex { val, i ->
            if (!(val.correctResponse == answerList?.get(i)?.toString()?.toUpperCase()) && showNextLevel) {
                showNextLevel = false
            }
        }
        if (showNextLevel) {
            render(template: '/quiz/round2', model: [candidate: candidate])
        } else {
            render([fail: "Wrong Answers! Please try again."] as JSON)

        }
    }

    def quit(Long candidateId) {
        Candidate candidate = Candidate.get(candidateId)
        if (candidate) {
            String timeSpent = DurationFormatUtils.formatDuration(params.long('timeElapsed'), "HH:mm:ss,SSS")
            candidate.timeSpent = timeSpent
            candidate.save(flush: true)
        }
        render(template: '/quiz/thankYouPage')
    }
}
