<%@ page import="enums.QuestionType; survey.Question; enums.StudyType" %>
<g:hiddenField value="${candidate?.id}" name="candidateId"/>
<strong>Instructions:</strong> You will be presented with an anagram to solve. Basically, you will get letters that you have to
rearrange to form a new and valid word. Please use every letter given, and use each letter only once.
Please write your solution to the anagram in the space provided to you below the anagram. You will have to work
accurately to perform well in this test. There is no time limit for this test. If you feel at any place that you
are stuck or not able to find the answer, you can chose to quit the study.

<g:each in="${Question.findAllByQuestionType(QuestionType.SIMPLE_ANAGRAM)}" status="i" var="question">
    <div class="margin-top20">
        <strong>Q${i + 1}.</strong>  ${question?.description}<br/>
        <input type="text" name="question[${i}]" placeholder="Answer"
               oninput="checkAnswer($(this), ${question?.id})" maxlength="${question?.description?.length()}"/>
    </div>
</g:each>

<a href="#" class="btn btn-success margin-top20" id="startFirstTest" disabled=""
   onclick="moveToNextLevel()">Let's Begin</a>

<script type="text/javascript">
    function moveToNextLevel() {
        var answerList = [];
        $.each($('input[name^=question]'), function () {
            answerList.push($(this).val());
        });
        $.ajax({
            url: '/quiz/moveToNextLevel',
            data: {answerList: answerList, candidateId: $('#candidateId').val()},
            success: function (response) {
                if (response.fail) {
                    warningReport(response.fail);
                } else {
                    $('.widget-main').html(response);
                }
            }
        })
    }
</script>