package survey

import enums.QuestionType

class Question {

    String description
    String correctResponse
    QuestionType questionType
    List<QuestionOption> options
    static hasMany = [options: QuestionOption]

    static constraints = {
        options nullable: true
        correctResponse nullable: true
    }
}
