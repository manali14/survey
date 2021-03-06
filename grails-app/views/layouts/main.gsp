<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        Implicit Theories | <g:layoutTitle default="Home"/>
    </title>
    <link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">

    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:stylesheet src="application.css"/>
    <g:layoutHead/>
    <script>
        var errorMessage = "${flash.error}";
        var successMessage = "${flash.success}";
        var infoMessage = "${flash.info}";
    </script>
</head>

<body class="login-layout light-login">
<g:render template="/user/userDetails"/>
<div id="navbar" class="navbar navbar-default ace-save-state navbar-fixed-top">
    <div class="navbar-container ace-save-state" id="navbar-container">

        <div class="navbar-header pull-left">
            <a href="${createLink(uri: '/')}" class="navbar-brand">
                <small>
                    SudoFire | Implicit Theories
                </small>
            </a>
        </div>
    </div>
</div>

<div class="main-container ace-save-state" id="main-container">
    <div class="alert report" role="alert" id="report">
        <button type="button" class="close" onclick="hideReport()" aria-label="Close"><span
                aria-hidden="true">x</span></button>
        <h4 class="reportText">Message</h4>
    </div>

    <div class="main-content">
        <div class="main-content-inner">
            <g:layoutBody/>
        </div>
    </div>
</div>

<div id="spinner" class="spinner" style="display:none;">
    <g:message code="spinner.alt" default="Loading&hellip;"/>
</div>

<asset:javascript src="application.js"/>

</body>
</html>
