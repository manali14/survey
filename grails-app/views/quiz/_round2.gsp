<%@ page import="enums.QuestionType; survey.Question; enums.StudyType" %>
<g:hiddenField value="${candidate?.id}" name="candidateId"/>
<g:if test="${candidate.studyType == StudyType.STUDY1}">
    <div class="margin-top20">
        <g:each in="${Question.findAllByQuestionType(QuestionType.UNSOLVABLE_ANAGRAM_STUDY1)}" var="question"
                status="i">
            <strong>Q${i + 1}.</strong> ${question?.description}<br/>
            <input type="text" name="unsolvableAnagram[${i}]" placeholder="Answer"
                   oninput="checkUnsolvableAnswer($(this), $(this).data('description'))"
                   maxlength="${question?.description?.length()}" data-description="${question?.description}"/>
        </g:each>
    </div>

    <a href="#" class="btn btn-success margin-top20" id="quit" onclick="quit()">Quit</a>
</g:if>
<script type="text/javascript">
    var startDate = new Date();
    var startTime = startDate.getTime();
    function quit() {
        var endDate = new Date();
        var endTime = endDate.getTime();
        $.ajax({
            url: '/quiz/quit',
            data: {candidateId: $('#candidateId').val(), timeElapsed: (endTime - startTime)},
            success: function (response) {
                $('.widget-main').html(response);
            }
        })
    }
</script>