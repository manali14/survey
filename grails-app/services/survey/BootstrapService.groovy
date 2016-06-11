package survey

import enums.AdaptationScaleResponses
import enums.QuestionType
import grails.transaction.Transactional

@Transactional
class BootstrapService {

    def initData() {
        createADminUserAndRole()
        createQuizAndAddQuestions()
        createAdaptationScaleQuestions()
    }

    void createADminUserAndRole() {
        if (!User.count) {
            Role role = new Role(authority: "ROLE_ADMIN").save(flush: true)
            User user = new User(username: "implicitTheoriesAdmin", password: "password").save(flush: true)
            UserRole.create(user, role, true)
        }
    }

    void createQuizAndAddQuestions() {
        if (!Question.count) {
            new Question(description: "I don’t think I personally can do much to increase my intelligence", questionType: QuestionType.ENTITY_QUESTIONAIRE).save(flush: true)
            new Question(description: "My intelligence is something about me that I personally can’t change very much.", questionType: QuestionType.ENTITY_QUESTIONAIRE).save(flush: true)
            new Question(description: "To be honest, I don’t think I can really change how intelligent I am.", questionType: QuestionType.ENTITY_QUESTIONAIRE).save(flush: true)
            new Question(description: "I can learn new things, but I don&#39;t have the ability to change my basic intelligence.", questionType: QuestionType.ENTITY_QUESTIONAIRE).save(flush: true)
            new Question(description: "With enough time and effort I think I could significantly improve my intelligence level", questionType: QuestionType.ENTITY_QUESTIONAIRE).save(flush: true)
            new Question(description: "I believe I can always substantially improve on my intelligence", questionType: QuestionType.ENTITY_QUESTIONAIRE).save(flush: true)
            new Question(description: "Regardless of my current intelligence level, I think I have the capacity to change it quite a bit.", questionType: QuestionType.ENTITY_QUESTIONAIRE).save(flush: true)
            new Question(description: "I believe I have the ability to change my basic intelligence level considerable over time.", questionType: QuestionType.ENTITY_QUESTIONAIRE).save(flush: true)
            new Question(description: "RIFE", correctResponse: "FIRE", questionType: QuestionType.SIMPLE_ANAGRAM).save(flush: true)
            new Question(description: "KOOB", correctResponse: "BOOK", questionType: QuestionType.SIMPLE_ANAGRAM).save(flush: true)
            new Question(description: "EOCPMLTEET", questionType: QuestionType.UNSOLVABLE_ANAGRAM_STUDY1).save(flush: true)
            new Question(description: "LOCOEGLE", questionType: QuestionType.UNSOLVABLE_ANAGRAM_STUDY2).save(flush: true)
            new Question(description: "OPSSIBLE", questionType: QuestionType.UNSOLVABLE_ANAGRAM_STUDY2, correctResponse: "POSSIBLE").save(flush: true)
        }
    }

    void createAdaptationScaleQuestions() {
        if (!Question.countByQuestionType(QuestionType.ADAPTATION_SCALE_STUDY1_PARTA)) {
            Question adaptationQuestion = new Question(description: "What do you feel after doing this test? (You can choose more than one options!)", questionType: QuestionType.ADAPTATION_SCALE_STUDY1_PARTA).save(flush: true)
            AdaptationScaleResponses.values().each {
                adaptationQuestion.addToOptions(new QuestionOption(description: it, question: adaptationQuestion).save(flush: true))
            }
            adaptationQuestion.save(flush: true)
        }
        if (!Question.countByQuestionType(QuestionType.ADAPTATION_SCALE_STUDY1_PARTB)) {
            Question question = new Question(description: "What do you think is more important to you?", questionType: QuestionType.ADAPTATION_SCALE_STUDY1_PARTB).save(flush: true)
            ["Performing on the test/ getting a high score", "Learning the strategy how to solve it", "Both of the above"].each {
                question.addToOptions(new QuestionOption(description: it, question: question).save(flush: true))
            }
            question.save(flush: true)
            Question question1 = new Question(description: "Rate the difficulty level of the anagram presented to you.", questionType: QuestionType.ADAPTATION_SCALE_STUDY1_PARTB).save(flush: true)
            ["Very easy", "Easy", "Moderately difficult", "Difficult", "Very difficult"].each {
                question1.addToOptions(new QuestionOption(description: it, question: question).save(flush: true))
            }
            question1.save(flush: true)
            Question question2 = new Question(description: "Would you want to spend more time doing these kinds of anagrams?", questionType: QuestionType.ADAPTATION_SCALE_STUDY1_PARTB).save(flush: true)
            ["Yes", "No"].each {
                question2.addToOptions(new QuestionOption(description: it, question: question).save(flush: true))
            }
            question2.save(flush: true)
            Question question3 = new Question(description: "If no, what kind of tasks would you want to do?", questionType: QuestionType.ADAPTATION_SCALE_STUDY1_PARTB).save(flush: true)
            question3.save(flush: true)
            Question question4 = new Question(description: "I would want to avoid doing such anagrams.", questionType: QuestionType.ADAPTATION_SCALE_STUDY1_PARTB).save(flush: true)
            ["Yes", "No"].each {
                question4.addToOptions(new QuestionOption(description: it, question: question).save(flush: true))
            }
            question4.save(flush: true)
            Question question5 = new Question(description: "What do you feel about your ability/intelligence after performing this test?", questionType: QuestionType.ADAPTATION_SCALE_STUDY1_PARTB).save(flush: true)
            ["I have high ability but I wasn’t able to solve this one!", "I given a chance to work on similar anagrams, I will be able to solve such anagrams.", "I do not have the ability"].each {
                question5.addToOptions(new QuestionOption(description: it, question: question).save(flush: true))
            }
            question5.save(flush: true)
            Question question6 = new Question(description: "I felt nervous that I will be judged about my ability based on this", questionType: QuestionType.ADAPTATION_SCALE_STUDY1_PARTB).save(flush: true)
            ["Yes", "No"].each {
                question6.addToOptions(new QuestionOption(description: it, question: question).save(flush: true))
            }
            question6.save(flush: true)
            Question question7 = new Question(description: "I found the test", questionType: QuestionType.ADAPTATION_SCALE_STUDY1_PARTB).save(flush: true)
            ["Interesting", "Boring", "Difficult", "Easy"].each {
                question7.addToOptions(new QuestionOption(description: it, question: question).save(flush: true))
            }
            question7.save(flush: true)
            Question question8 = new Question(description: "I have put a great effort in this test", questionType: QuestionType.ADAPTATION_SCALE_STUDY1_PARTB).save(flush: true)
            ["Yes", "No"].each {
                question8.addToOptions(new QuestionOption(description: it, question: question).save(flush: true))
            }
            question8.save(flush: true)
            Question question9 = new Question(description: "I feel that putting in a lot of effort gives me a sense of: (You can chose more than one answer)", questionType: QuestionType.ADAPTATION_SCALE_STUDY1_PARTB).save(flush: true)
            ["Pride", "Happiness", "Shame", "Sadness", "Relief", "Disappointment", "Monotony (being Bored)"].each {
                question9.addToOptions(new QuestionOption(description: it, question: question).save(flush: true))
            }
            question9.save(flush: true)
        }
    }
}
