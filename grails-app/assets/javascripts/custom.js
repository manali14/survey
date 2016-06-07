$('.date-picker').datepicker({
    autoclose: true,
    todayHighlight: true
}).next().on(ace.click_event, function () {
    $(this).prev().focus();
});
$('#back').on('click', function () {
    history.back();
});
$('#playQuiz').on('click', function () {
    var id = $(this).data('quiz-id');
    var url = $(this).data('url');
    $.get(url, {id: id}, function (response) {
        $('.playQuiz').html(response);
    })
});
$(document).ready(function () {
    $('#candidateRegisterForm').validate({
        rules: {
            email: {
                email: true
            },
            mobileNumber: {
                required: true,
                number: true,
                minlength: 10,
                maxlength: 10
            },
            age: {
                required: true,
                number: true
            },
            gender: "required",
            caste: "required",
            school: "required",
            agree: "required"
        },
        messages: {
            email: {
                required: "Please enter your Email"
            },
            mobileNumber: {
                required: "Please enter your 10 digit Mobile Number",
                length: "Please enter valid Mobile Number",
                number: "Please enter valid Mobile Number"
            },
            age: {
                required: "Please enter your Age",
                number: "Please enter a valid Age"
            },
            gender: "Please select a Gender",
            caste: "Please select your caste",
            school: "Please enter your School Name",
            agree: "Please accept our Terms & Conditions"
        }
    });
});

$('#candidateRegisterForm').on('submit', function (e) {
    e.preventDefault();
    var data = $(this).serialize();
    if ($('#candidateRegisterForm').valid()) {
        $.ajax({
            type: "POST",
            url: "/user/register",
            data: data,
            success: function (response) {
                if (response.fail) {
                    warningReport(response.fail);
                } else {
                    $('.widget-main').html(response);
                }
            }
        });
    }
});

function checkAnswer(obj, questionId, description) {
    removePreviousOptions(obj);
    if (obj.val().trim().length == description.length) {
        $.ajax({
            url: "/quiz/checkAnangramAnswer",
            data: {answer: obj.val().trim(), question: questionId},
            success: function (response) {
                if (response.success) {
                    obj.after('<i class="ace-icon fa fa-check tickMark"></i>');
                    if ($('.tickMark').length == 2) {
                        $('#startFirstTest').attr('disabled', false);
                    }
                } else {
                    obj.after('<i class="ace-icon fa fa-times cross"></i>');
                }
            }
        });
    } else {
        $('#startFirstTest').attr('disabled', true);
    }
}

function removePreviousOptions(obj) {
    obj.parent().find($('.tickMark')).remove();
    obj.parent().find($('.cross')).remove();
}

function quit() {
    var endDate = new Date();
    var endTime = endDate.getTime();
    $.ajax({
        url: '/quiz/quit',
        data: {
            candidate: $('#candidateId').val(),
            timeElapsed: (endTime - startTime),
            question: $('#questionId').val(),
            answer: $('#answer').val()
        },
        success: function (response) {
            $('.widget-main').html(response);
        }
    })
}