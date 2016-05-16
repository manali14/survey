package survey

class QuizController {

    def index() {
        [quizList: Quiz.list()]
    }

    def playQuiz(Long id) {
        Quiz quiz = Quiz.get(id)
        if (quiz) {
            [quiz: quiz]
        } else {
            redirect(uri: '/')
        }
    }

    def showQuestions(Long id) {
        if (request.xhr) {
            render(template: '/quiz/questions')
        }
    }
}
