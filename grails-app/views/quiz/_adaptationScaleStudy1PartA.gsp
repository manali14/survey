<%@ page import="enums.QuestionType; survey.Question" %>
<g:form name="adaptationScalePartA">
    <g:hiddenField name="candidateId" value="${candidate?.id}"/>
    <% Question question = Question.findByQuestionType(QuestionType.ADAPTATION_SCALE_STUDY1_PARTA) %>
    <g:hiddenField name="questionId" value="${question?.id}"/>
    <strong>${question?.description}</strong>
    <g:each in="${question?.options?.findResults { it }}" var="option">
        <div>
            <input type="checkbox" name="option" value="${option?.description}" class="required"
                   data-error="#error">${option?.description}<br/>
        </div>
    </g:each>
    <span id="error"></span>

    <br/>
    Any other?<br/>
    <input type="text" name="anyOther" id="anyOther"><br/><br/>
    <a href="#" class="btn btn-success margin-top20" id="switchToNextAnagram"
       onclick="next()">Next</a>
</g:form>
<script type="text/javascript">
    function next() {
        if ($('#adaptationScalePartA').valid()) {
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
    }
    $(document).ready(function () {
        $('#adaptationScalePartA').validate({
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
