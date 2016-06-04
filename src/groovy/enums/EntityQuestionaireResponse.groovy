package enums

enum EntityQuestionaireResponse {
    STRONGLY_AGREE("Strongly Agree", 1),
    AGREE("Agree", 2),
    NEUTRAL("Neutral", 3),
    DISAGREE("Disagree", 4),
    STRONGLY_DISAGREE("Strongly Disagree", 5)

    String name
    Integer score

    EntityQuestionaireResponse(String name, Integer score) {
        this.name = name
        this.score = score
    }
}