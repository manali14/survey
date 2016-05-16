package survey

class Quiz {

    String name
    String description
    List<Question> questions

    static hasMany = [questions: Question]

    static constraints = {
    }

    static mapping = {
        description sqlType: 'text'
    }
}
