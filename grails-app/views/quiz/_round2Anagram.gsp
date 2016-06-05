<g:hiddenField name="questionId" value="${question?.id}"/>
<g:hiddenField name="candidateId" value="${candidate?.id}"/>
<strong>Q2.</strong> ${question?.description}<br/>
<input type="text" name="unsolvableAnagram[${i}]" placeholder="Answer" id="answer"
       oninput="checkAnswer($(this), ${question?.id}, $(this).data('description'))"
       maxlength="${question?.description?.length()}" data-description="${question?.description}"/>
<br/>
<a href="#" class="btn btn-success margin-top20" id="quit" onclick="quit()">Quit</a>
<a href="#" class="btn btn-success margin-top20" id="switchToNextAnagram"
   onclick="quit()">Next</a>

<script type="text/javascript">
    var startDate = new Date();
    var startTime = startDate.getTime();
</script>