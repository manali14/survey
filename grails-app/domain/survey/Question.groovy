package survey

class Question {

    String description
    String correctResponse
    List<QuestionOption> options
    static hasMany = [options: QuestionOption]

    static constraints = {
        options nullable: true
    }
}
