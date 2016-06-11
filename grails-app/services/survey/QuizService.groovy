package survey

import commandObjects.AdaptationScalePartBCO
import grails.transaction.Transactional

@Transactional
class QuizService {

    void saveAdaptationScaleDetails(AdaptationScalePartBCO adaptationScalePartBCO) {
        adaptationScalePartBCO.questionResponseMap.each {
            Question question = Question.get(it.key?.toLong())
            CandidateResponse candidateResponse = new CandidateResponse(
                    candidate: adaptationScalePartBCO.candidate,
                    question: question,
                    answer: it?.value
            )
            candidateResponse.save(flush: true)
        }
    }
}
