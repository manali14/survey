<%@ page import="enums.EntityQuestionaireResponse; enums.QuestionType; survey.Question" %>
<g:hiddenField name="candidateId" id="candidateId" value="${candidateId}"/>
<p>
    <strong>
        Using the scale below, please indicate the extent to which you agree or disagree with the following statements.
        We are just interested in your views about intelligence.
    </strong>
</p>

<div>
    <g:each in="${Question.findAllByQuestionType(QuestionType.ENTITY_QUESTIONAIRE)}" status="i" var="question">
        <div>
            <strong>Q${i + 1}.</strong> ${question.description}
            <g:each in="${EntityQuestionaireResponse.values()}" var="entityQuestionaireResponse">
                <div>
                    <input type="radio" name="question[${i}]"
                           value="${entityQuestionaireResponse}">${entityQuestionaireResponse.name}
                </div>
            </g:each>
        </div>
        <br/>
    </g:each>
    <a href="#" id="submitEntityQuestionaire" class="btn btn-success">Submit Questionaire</a>
</div>

<script type="text/javascript">
    $('#submitEntityQuestionaire').on('click', function () {
        var data = [];
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
    });
</script>