<%@ page import="enums.StudyType; survey.CandidateResponse" %>
<table id="dynamic-table" class="table table-striped table-bordered table-hover dataTable no-footer"
       role="grid" aria-describedby="dynamic-table_info">
    <tbody>
    <tr>
        <th>Name</th>
        <td>${candidate?.name}</td>
    </tr>
    <tr>
        <th>Email</th>
        <td>${candidate?.email}</td>
    </tr>
    <tr>
        <th>Entity Questionaire Score</th>
        <td>${candidate?.entityQuestionaireScore}</td>
    </tr>
    <g:if test="${candidate.studyType in [StudyType.STUDY1, StudyType.STUDY2]}">
        <tr>
            <th>Time spent on Anagram 1</th>
            <td>${candidate?.timeSpent}</td>
        </tr>
    </g:if>
    <tr>
        <th colspan="2">Responses</th>
    </tr>
    <g:each in="${CandidateResponse.findAllByCandidate(candidate)}" var="response">
        <tr>
            <th>${response?.question?.description}</th>
            <td>${response?.answer}</td>
        </tr>
    </g:each>
    </tbody>
</table>