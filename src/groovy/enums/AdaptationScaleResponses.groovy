package enums

enum AdaptationScaleResponses {
    HAPPY(":smile:"),
    EXCITED(":laughing:"),
    ANGRY(":rage:"),
    SAD(":worried:"),
    FEARFUL(":fearful:"),
    INDIFFERENT(":confused:"),
    CONFUSED(":expressionless:")

    String emojiCode

    AdaptationScaleResponses(String emojiCode) {
        this.emojiCode = emojiCode
    }
}