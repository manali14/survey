<%@ page import="enums.QuestionType; survey.Question" %>
<g:hiddenField name="candidateId" value="${candidate?.id}"/>
<% Question question = Question.findByQuestionType(QuestionType.ADAPTATION_SCALE_STUDY1_PARTA) %>
<g:hiddenField name="questionId" value="${question?.id}"/>
<strong>${question?.description}</strong>
<g:each in="${question?.options?.findResults { it }}" var="option">
    <div>
        <input type="checkbox" name="option" value="${option?.description}">${option?.description}<br/>
    </div>
</g:each>
<br/>
Any other?<br/>
<input type="text" name="anyOther" id="anyOther"><br/><br/>
<a href="#" class="btn btn-success margin-top20" id="switchToNextAnagram"
   onclick="next()">Next</a>

<script type="text/javascript">
    function next() {
        var data = [];
        $.each($('input[name=option]:checked'), function () {
            data.push($(this).val());
        });

        $.ajax({
            url: '/quiz/showAdaptationScaleStudy1PartB',
            data: {
                options: data,
                candidate: $('#candidateId').val(),
                other: $('#anyOther').val(),
                question: $('#questionId').val()
            },
            success: function (data) {
                $('.widget-main').html(data);
            }
        })
    }
</script>
