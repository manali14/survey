<%@ page import="enums.EntityQuestionaireResponse; enums.QuestionType; survey.Question" %>
<g:hiddenField name="candidateId" id="candidateId" value="${candidateId}"/>
<p>
    <strong>
        Using the scale below, please indicate the extent to which you agree or disagree with the following statements.
        We are just interested in your views about intelligence.
    </strong>
</p>

<div>
    <g:form name="entityQuestionaire" role="form">
        <g:each in="${Question.findAllByQuestionType(QuestionType.ENTITY_QUESTIONAIRE)}" status="i" var="question">
            <div>
                <strong>Q${i + 1}.</strong> ${question.description}
                <g:each in="${EntityQuestionaireResponse.values()}" var="entityQuestionaireResponse">
                    <div>
                        <input type="radio" name="question[${i}]" class="required" data-error="#error${i}"
                               value="${entityQuestionaireResponse}">${entityQuestionaireResponse.name}
                    </div>
                </g:each>
                <span id="error${i}"></span>
            </div>
            <br/>
        </g:each>
        <input type="submit" id="submitEntityQuestionaire" class="btn btn-success" value="Submit Questionaire">
    </g:form>
</div>

<script type="text/javascript">
    $('#entityQuestionaire').on('submit', function (e) {
        e.preventDefault();
        var data = [];
        if ($('#entityQuestionaire').valid()) {
            $.each($('input[type=radio]:checked'), function () {
                data.push($(this).val());
            });
            $.ajax({
                url: "/quiz/saveEntityQuestionaireScore",
                data: {responses: data, candidate: $('#candidateId').val()},
                success: function (response) {
                    if (response.fail) {
                        warningReport(response.success);
                    } else {
                        $('.widget-main').html(response);
                    }
                }

            })
        }
    });
    $(document).ready(function () {
        $('#entityQuestionaire').validate({
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