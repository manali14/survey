<%@ page import="survey.Quiz" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Play</title>
</head>

<body>
<div class="margin-top20 col-sm-8 playQuiz">
    <div class="well well-lg">
        <h4 class="blue">${quiz?.name}</h4>
        <h5>Instructions</h5>
        <h6>${quiz?.description}</h6>
        <button type="button" class="btm btn-primary" id="back">Back</button>
        <button type="button" class="btm btn-primary" id="playQuiz" data-quiz-id="${quiz?.id}"
                data-url="${createLink(controller: 'quiz', action: 'showQuestions', absolute: true)}">Play Quiz</button>
    </div>
</div>
</body>
</html>
