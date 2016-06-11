package survey

import enums.OptionSelect
import enums.QuestionType

class Question {

    String description
    String correctResponse
    QuestionType questionType
    OptionSelect optionSelect
    List<QuestionOption> options
    static hasMany = [options: QuestionOption]

    static constraints = {
        options nullable: true
        correctResponse nullable: true
        optionSelect nullable: true
    }
}
