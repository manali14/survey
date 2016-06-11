package survey

import commandObjects.AdaptationScalePartACO
import commandObjects.ResponseCO
import commandObjects.AnagramCO
import commandObjects.EntityQuestionaireCO
import enums.EntityQuestionaireResponse
import enums.QuestionType
import enums.StudyType
import grails.converters.JSON
import org.apache.commons.lang.time.DurationFormatUtils

class QuizController {
    def quizService

    def study1() {
        [studyType: StudyType.STUDY1]
    }

    def study2() {
        [studyType: StudyType.STUDY2]
    }

    def study3() {
        [studyType: StudyType.STUDY3]
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
            if (candidate.studyType in [StudyType.STUDY1, StudyType.STUDY2]) {
                render(template: '/quiz/goals', model: [candidate: candidate])
            } else if (candidate.studyType == StudyType.STUDY3) {
                render(template: '/quiz/round1', model: [candidate: candidate])
            } else {
                render([fail: "Error! Please try again."] as JSON)
            }
        } else {
            render([fail: "Error while saving score. Please try again"] as JSON)
        }
    }

    def saveGoalsData(ResponseCO responseCO) {
        quizService.saveCandidateResponseDetails(responseCO)
        render(template: '/quiz/round1', model: [candidate: responseCO.candidate])
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

    def quit(AnagramCO anagramCO) {
        Candidate candidate = anagramCO.candidate
        Question question = anagramCO.question
        if (candidate) {
            String timeSpent = DurationFormatUtils.formatDuration(params.long('timeElapsed'), "HH:mm:ss,SSS")
            if (question.correctResponse) {
                candidate.timeSpentOnSecondAnagram = timeSpent
                candidate.isSecondAnagramCorrect = (anagramCO.answer && (anagramCO.answer == anagramCO.question?.correctResponse))
                println(anagramCO.answer && (anagramCO.answer == anagramCO.question?.correctResponse))
            } else {
                candidate.timeSpent = timeSpent
            }
            candidate.save(flush: true)
        }
        if (candidate?.studyType == StudyType.STUDY1 || candidate?.studyType == StudyType.STUDY2) {
            render(template: '/quiz/adaptationScaleStudy1PartA', model: [candidate: candidate])
        } else {
            render(template: '/quiz/thankYouPage')
        }
    }

    def nextAnagram(AnagramCO anagramCO) {
        String timeSpent = DurationFormatUtils.formatDuration(params.long('timeElapsed'), "HH:mm:ss,SSS")
        Candidate candidate = anagramCO.candidate
        candidate.timeSpent = timeSpent
        candidate.save(flush: true)
        Question nextQuestion = Question.findByQuestionTypeAndIdNotInList(QuestionType.UNSOLVABLE_ANAGRAM_STUDY2, [anagramCO?.question?.id])
        render(template: '/quiz/round2Anagram', model: [question: nextQuestion, candidate: candidate])
    }

    def showAdaptationScaleStudy1PartB(AdaptationScalePartACO adaptationScalePartA) {
        adaptationScalePartA.options = params.list('options[]')
        CandidateResponse candidateResponse = new CandidateResponse()
        candidateResponse.properties = adaptationScalePartA.properties
        candidateResponse.answer = adaptationScalePartA.options?.join(", ")
        adaptationScalePartA.other ? (candidateResponse.answer = "${candidateResponse.answer} ,${adaptationScalePartA.other}") : null
        candidateResponse.save(flush: true)
        render(template: '/quiz/adaptationScaleStudy1PartB', model: [candidate: adaptationScalePartA.candidate])
    }

    def submitQuiz(ResponseCO adaptationScalePartBCO) {
        quizService.saveCandidateResponseDetails(adaptationScalePartBCO)
        render(template: '/quiz/thankYouPage')
    }
}
