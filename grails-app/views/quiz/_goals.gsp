<%@ page import="enums.QuestionType; survey.Question; enums.StudyType" %>
<g:form name="goals">
    <g:hiddenField name="candidateId" value="${candidate?.id}"/>
    <g:if test="${candidate?.studyType == StudyType.STUDY1}">
        <div class="margin-top20 heading">
            ${QuestionType.GOALS_1?.description}
        </div>
        <g:each in="${Question.findAllByQuestionType(QuestionType.GOALS_1)}" var="question" status="i">
            <div class="margin-top20">
                <strong>Q.${i + 1}</strong>  ${question?.description}<br/>
                <g:each in="${question?.options?.findResults { it }}" var="option" status="j">
                    <input type="radio" name="option[${i}]" value="${option?.description}" class="required"
                           data-question-id="${question?.id}" data-error="#error${i}">${option?.description}<br/>
                </g:each>
                <span id="error${i}"></span>
            </div>
        </g:each>
    </g:if>
    <g:if test="${candidate?.studyType == StudyType.STUDY2}">
        <div class="margin-top20 heading">
            ${QuestionType.GOALS_2?.description}
        </div>
        <g:each in="${Question.findAllByQuestionType(QuestionType.GOALS_2)}" var="question" status="i">
            <div class="margin-top20">
                <strong>Q.${i + 1}</strong>  ${question?.description}<br/>
                <g:each in="${question?.options?.findResults { it }}" var="option" status="j">
                    <input type="radio" name="option[${i}]" value="${option?.description}" class="required"
                           data-question-id="${question?.id}" data-error="#error${i}">${option?.description}<br/>
                </g:each>
                <span id="error${i}"></span>
            </div>
        </g:each>
    </g:if>
    <a href="#" class="btn btn-success margin-top20" id="quit"
       onclick="submitGoals()">Submit</a>
</g:form>
<script type="text/javascript">
    function submitGoals() {
        if ($('#goals').valid()) {
            var map = {};
            $.each($('input[name^=option]:checked'), function () {
                map[$(this).data('question-id')] = $(this).val();
            });
            $.ajax({
                url: '/quiz/saveGoalsData',
                data: {questionResponseMap: map, candidate: $('#candidateId').val()},
                success: function (data) {
                    $('.widget-main').html(data);
                }
            })
        }
    }
    $(document).ready(function () {
        $('#goals').validate({
            errorPlacement: function (error, element) {
                var placement = $(element).data('error');
                if (placement) {
                    $(placement).append(error)
                } else {
                    error.insertAfter(element);
                }
            }
        });
    })
</script>

