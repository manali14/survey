var reportDelay = 4000;
var reportTimeOutVar = null;
function successReport(reportText, timeout) {
    $('#report').addClass('alert-success');
    $('#report').removeClass('alert-info');
    $('#report').removeClass('alert-danger');
    report(reportText, timeout);
}
function infoReport(reportText, timeout) {
    $('#report').removeClass('alert-success');
    $('#report').addClass('alert-info');
    $('#report').removeClass('alert-danger');
    report(reportText, timeout);
}
function warningReport(reportText, timeout) {
    $('#report').removeClass('alert-success');
    $('#report').removeClass('alert-info');
    $('#report').addClass('alert-danger');
    report(reportText, timeout);
}
function report(reportText, timeout) {
    hideReport();
    var $report = $('#report');
    $report.find('.reportText').html(reportText);
    $report.slideDown("fast", function () {
        timeout = timeout ? timeout : reportDelay
        reportTimeOutVar = setTimeout(hideReport, timeout, $report);
    });
}
function hideReport() {
    $('#report').slideUp("fast");
    if (reportTimeOutVar != null) {
        clearTimeout(reportTimeOutVar)
    }
}

function showMessage(data, timeout) {
    if (data.indexOf("Error: ") == 0) {
        warningReport(data.substring(7), timeout)
    }
    if (data.indexOf("Success: ") == 0) {
        successReport(data.substring(9), timeout)
    }
    if (data.indexOf("Info: ") == 0) {
        infoReport(data.substring(6), timeout)
    }
}

$(document).ready(function () {
    if (errorMessage.length > 0) {
        warningReport(errorMessage);
    }
    if (infoMessage.length > 0) {
        infoReport(infoMessage);
    }
    if (successMessage.length > 0) {
        successReport(successMessage);
    }
});

