<%@ page import="enums.OptionSelect; enums.QuestionType; survey.Question" %>
<g:form name="adaptationScalePartB">
    <g:hiddenField name="candidateId" value="${candidate?.id}"/>
    <g:each in="${Question.findAllByQuestionType(QuestionType.ADAPTATION_SCALE_STUDY1_PARTB)}" var="question"
            status="i">
        <g:hiddenField name="question[${i}]" value="${question?.id}"/>
        <div class="margin-top20">
            <strong>Q.${i + 1}</strong>  ${question?.description}<br/>
            <g:each in="${question?.options?.findResults { it }}" var="option" status="j">
                <g:if test="${question?.optionSelect == OptionSelect.MULTIPLE}">
                    <input type="checkbox" name="option[${i}]" value="${option?.description}" class="required"
                           data-question-id="${question?.id}" data-error="#error${i}">${option?.description}
                </g:if>
                <g:else>
                    <input type="radio" name="option[${i}]" value="${option?.description}" class="required"
                           data-question-id="${question?.id}" data-error="#error${i}">${option?.description}
                </g:else>
                <br/>
            </g:each>
            <g:if test="${question?.optionSelect == OptionSelect.MULTIPLE}">
                <input type="text" name="option" data-question-id="${question?.id}" class="required"
                       placeholder="Give reasons for your answer!" data-error="#error${i}"><br/>
            </g:if>
            <g:if test="${!question.options?.findResults { it }}">
                <input type="text" name="option" data-question-id="${question?.id}" class="required"
                       data-error="#error${i}"><br/>
            </g:if>
            <span id="error${i}"></span>
        </div>
    </g:each>
    <a href="#" class="btn btn-success margin-top20" id="quit"
       onclick="submit()">Submit</a>
</g:form>
<script type="text/javascript">
    function submit() {
        if ($('#adaptationScalePartB').valid()) {
            var map = {};
            var data = [];
            $.each($('input[name^=option]:checked'), function () {
                if ($(this).attr('type') == "checkbox") {
                    if (map[$(this).data('question-id')]) {
                        data.push($(this).val());
                        map[$(this).data('question-id')] = data.join(", ");
                    } else {
                        data = [];
                        data.push($(this).val());
                        map[$(this).data('question-id')] = data.join(", ");
                    }
                } else {
                    map[$(this).data('question-id')] = $(this).val();
                }
            });
            $.each($('input[type=text][name^=option]'), function () {
                if (map[$(this).data('question-id')]) {
                    var value = map[$(this).data('question-id')];
                    map[$(this).data('question-id')] = value.concat(", " + $(this).val());
                } else {
                    map[$(this).data('question-id')] = $(this).val();
                }
            });
            $.ajax({
                url: '/quiz/submitQuiz',
                data: {questionResponseMap: map, candidate: $('#candidateId').val()},
                success: function (data) {
                    $('.widget-main').html(data);
                }
            })
        }
    }
    $(document).ready(function () {
        $('#adaptationScalePartB').validate({
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
