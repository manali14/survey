package survey

import java.sql.Time

class CandidateResponse {

    String answer
    Time timeTaken
    Question question
    Candidate candidate

    static constraints = {
    }
}
