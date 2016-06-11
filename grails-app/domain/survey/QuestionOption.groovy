package survey

class QuestionOption {

    String description
    static belongsTo = [question: Question]
    static constraints = {
    }
}
