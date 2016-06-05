<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Admin Page</title>
    <meta name="layout" content="main"/>
</head>

<body>
<div class="table-header margin-top20">
    Candidate List
</div>

<div>
    <table id="dynamic-table" class="table table-striped table-bordered table-hover dataTable no-footer"
           role="grid" aria-describedby="dynamic-table_info">
        <thead>
        <tr role="row">
            <th class="sorting_disabled" tabindex="0" aria-controls="dynamic-table">Name</th>
            <th class="sorting_disabled" tabindex="0" aria-controls="dynamic-table">Email</th><th
                class=" sorting_disabled" tabindex="0" aria-controls="dynamic-table">Mobile Number</th>
            <th class="sorting_disabled" tabindex="0" aria-controls="dynamic-table">
                School
            </th>
            <th class="sorting_disabled" tabindex="0" aria-controls="dynamic-table">
                Age
            </th>
            <th class="hidden-480 sorting_disabled" tabindex="0" aria-controls="dynamic-table">Study Type</th>
            <th class="sorting_disabled" aria-label="">Date</th>
            <th class="sorting_disabled" aria-label="">Caste</th>
            <th class="sorting_disabled" aria-label="">Entity Questionaire Score</th>
            <th class="sorting_disabled" aria-label="">Time Spent</th>
        </tr>
        </thead>

        <tbody>
        <g:each in="${candidateList}" var="candidate">
            <tr>
                <td>${candidate?.name}</td>
                <td>${candidate?.email}</td>
                <td>${candidate?.mobileNumber}</td>
                <td>${candidate?.school}</td>
                <td>${candidate?.age}</td>
                <td>${candidate?.studyType}</td>
                <td>${candidate?.dateCreated}</td>
                <td>${candidate?.caste}</td>
                <td>${candidate?.entityQuestionaireScore}</td>
                <td>${candidate?.timeSpent}</td>
            </tr>
        </g:each>
        </tbody>
    </table>
</body>
</html>