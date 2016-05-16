package survey

import grails.transaction.Transactional

@Transactional
class BootstrapService {

    def initData() {
        createQuizAndAddQuestions()
    }

    void createQuizAndAddQuestions() {
        if (!Quiz.count) {
            [
                    [name: "Test 1", description: "In this test, you will be presented with anagrams to solve. Basically, you will get letters that you have to rearrange to form a new and valid word. Please use every letter given, and use each letter only once. Please write your solutions to each anagram on the solution form provided to you. You will have to work accurately to perform well in this test. There is no time limit for this test. If you feel at any place that you are stuck or not able to find the answer, you can either choose to switch to next question or to next test or quit being a part of the study altogether."],
                    [name: "Test 2", description: "In this test, you will be presented with a grid of symbols in which one symbol is missing. Your task is to identify the missing symbol. Please draw the symbol in the solution form provided to you. You will have to work accurately to perform well in this test. There is no time limit for this test. If you feel at any place that you are stuck or not able to find the answer, you can either choose to switch to next question or to next test or quit being a part of the study altogether."],
                    [name: "Test 3", description: "In this test, you will be presented with a series of numbers. Your task is to identify the pattern in the series and find the next number. Please write the answer in the solution form provided to you. You will have to work accurately to perform well in this test. There is no time limit for this test. If you feel at any place that you are stuck or not able to find the answer, you can either choose to switch to next question or to next test or quit being a part of the study altogether."],
                    [name: "Test 4", description: "In this test, you will be presented with two similar pictures. Your task is to find the differences between these two pictures. Please write the differences in the solution form provided to you. You will have to work accurately to perform well in this test. There is no time limit for this test. If you feel at any place that you are stuck or not able to find the answer, you can either choose to switch to next question or to next test or quit being a part of the study altogether."],
                    [name: "Test 5", description: "In this test, you will be presented with a grid of symbols in which one symbol is missing. Your task is to identify the missing symbol. Please draw the symbol in the solution form provided to you. You will have to work accurately to perform well in this test. There is no time limit for this test. If you feel at any place that you are stuck or not able to find the answer, you can either choose to switch to next question or to next test or quit being a part of the study altogether."]
            ].each {
                new Quiz(name: it.name, description: it.description).save(flush: true, failOnError: true)
            }
        }
    }
}
