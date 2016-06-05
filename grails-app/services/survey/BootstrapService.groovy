package survey

import enums.QuestionType
import grails.transaction.Transactional

@Transactional
class BootstrapService {

    def initData() {
        createADminUserAndRole()
        createQuizAndAddQuestions()
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
}
