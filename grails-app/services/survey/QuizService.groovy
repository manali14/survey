package survey

import commandObjects.ResponseCO
import grails.transaction.Transactional

@Transactional
class QuizService {

    void saveCandidateResponseDetails(ResponseCO responseCO) {
        responseCO.questionResponseMap.each {
            Question question = Question.get(it.key?.toLong())
            CandidateResponse candidateResponse = new CandidateResponse(
                    candidate: responseCO.candidate,
                    question: question,
                    answer: it?.value
            )
            candidateResponse.save(flush: true)
        }
    }
}
