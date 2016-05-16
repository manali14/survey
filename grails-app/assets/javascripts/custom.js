$('.date-picker').datepicker({
    autoclose: true,
    todayHighlight: true
}).next().on(ace.click_event, function () {
    $(this).prev().focus();
});
$('#candidateRegisterForm').validate({
    rules: {
        name: {
            required: true,
            minlength: 2
        },
        email: {
            required: true,
            email: true
        },
        mobileNumber: {
            required: true,
            length: 10,
            number: true
        },
        agree: "required"
    },
    messages: {
        name: {
            required: "Please enter your Name",
            minlength: "Please enter a name greater than 2 characters"
        },
        email: {
            email: "Please enter a valid email address",
            required: "Please enter your Email"
        },
        mobileNumber: {
            required: "Please enter your 10 digit Mobile Number",
            length: "Please enter valid Mobile Number",
            number: "Please enter valid Mobile Number"
        },
        agree: "Please accept our Terms & Conditions"
    }
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