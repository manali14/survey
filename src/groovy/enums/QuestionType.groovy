package enums

enum QuestionType {
    ENTITY_QUESTIONAIRE(""),
    GOALS_1("Please choose one option that you think best suits you. Please be as honest as possible while answering the questions."),
    GOALS_2("Please choose one option that you think best suits you. Please be as honest as possible while answering the questions."),
    SIMPLE_ANAGRAM(""),
    UNSOLVABLE_ANAGRAM_STUDY1(""),
    UNSOLVABLE_ANAGRAM_STUDY2(""),
    ADAPTATION_SCALE_STUDY1_PARTA(""),
    ADAPTATION_SCALE_STUDY1_PARTB("")

    String description

    QuestionType(String description) {
        this.description = description
    }
}