<%@ page import="survey.Quiz" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Quiz List</title>
</head>

<body>
<div class="margin-top20 col-sm-4 quizDiv">
    <div class="well well-lg">
        <g:each in="${quizList}" var="quiz">
            <h4 class="blue"><g:link controller="quiz" action="playQuiz" id="${quiz?.id}">${quiz?.name}</g:link></h4>
        </g:each>
    </div>
</div>
</body>
</html>
