<%@ page import="enums.QuestionType; survey.Question; enums.StudyType" %>
<g:hiddenField value="${candidate?.id}" name="candidateId"/>
<g:if test="${candidate.studyType == StudyType.STUDY1 || candidate.studyType == StudyType.STUDY2}">
    <div class="margin-top20">
        <g:each in="${Question.findAllByQuestionType(QuestionType.UNSOLVABLE_ANAGRAM_STUDY1)}" var="question"
                status="i">
            <g:hiddenField name="questionId" value="${question?.id}"/>
            <strong>Q${i + 1}.</strong> ${question?.description}<br/>
            <input type="text" name="unsolvableAnagram[${i}]" placeholder="Answer"
                   oninput="checkAnswer($(this), ${question?.id}, $(this).data('description'))"
                   maxlength="${question?.description?.length()}" data-description="${question?.description}"/>
        </g:each>
    </div>

    <a href="#" class="btn btn-success margin-top20" id="quit" onclick="quit()">Quit</a>
</g:if>
<g:if test="${candidate.studyType == StudyType.STUDY3}">
    <div class="margin-top20">
        <g:each in="${Question.findByQuestionType(QuestionType.UNSOLVABLE_ANAGRAM_STUDY2)}" var="question"
                status="i">
            <g:hiddenField name="questionId" value="${question?.id}"/>
            <strong>Q${i + 1}.</strong> ${question?.description}<br/>
            <input type="text" name="unsolvableAnagram[${i}]" placeholder="Answer" id="answer"
                   oninput="checkAnswer($(this), ${question?.id}, $(this).data('description'))"
                   maxlength="${question?.description?.length()}" data-description="${question?.description}"/>
        </g:each>
    </div>

    <a href="#" class="btn btn-success margin-top20" id="quit" onclick="quit()">Quit</a>
    <a href="#" class="btn btn-success margin-top20" id="switchToNextAnagram"
       onclick="switchToNextAnagram()">Switch To Next Anagram</a>
</g:if>
<script type="text/javascript">
    var startDate = new Date();
    var startTime = startDate.getTime();
    function switchToNextAnagram() {
        var endDate = new Date();
        var endTime = endDate.getTime();
        $.ajax({
            url: '/quiz/nextAnagram',
            data: {
                candidate: $('#candidateId').val(),
                timeElapsed: (endTime - startTime),
                question: $('#questionId').val()
            },
            success: function (response) {
                $('.widget-main').html(response);
            }
        })
    }
</script>