<%@ page import="enums.OptionSelect; enums.QuestionType; survey.Question" %>
<g:hiddenField name="candidateId" value="${candidate?.id}"/>
<g:each in="${Question.findAllByQuestionType(QuestionType.ADAPTATION_SCALE_STUDY1_PARTB)}" var="question" status="i">
    <g:hiddenField name="question[${i}]" value="${question?.id}"/>
    <div class="margin-top20">
        <strong>Q.${i + 1}</strong>  ${question?.description}<br/>
        <g:each in="${question?.options?.findResults { it }}" var="option" status="j">
            <g:if test="${question?.optionSelect == OptionSelect.MULTIPLE}">
                <input type="checkbox" name="option[${i}]" value="${option?.description}"
                       data-question-id="${question?.id}">${option?.description}
            </g:if>
            <g:else>
                <input type="radio" name="option[${i}]" value="${option?.description}"
                       data-question-id="${question?.id}">${option?.description}
            </g:else>
            <br/>
        </g:each>
        <g:if test="${question?.optionSelect == OptionSelect.MULTIPLE}">
            <input type="text" name="option" data-question-id="${question?.id}"
                   placeholder="Give reasons for your answer!"><br/>
        </g:if>
        <g:if test="${!question.options?.findResults { it }}">
            <input type="text" name="option" data-question-id="${question?.id}"><br/>
        </g:if>
    </div>
</g:each>
<a href="#" class="btn btn-success margin-top20" id="quit"
   onclick="submit()">Submit</a>
<script type="text/javascript">
    function submit() {
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
</script>
