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
        mobileNum: {
            required: true,
            minlength: 9,
            maxlength: 10,
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
        mobileNum: {
            required: "Please enter your 10 digit Mobile Number",
            minlength: "Please enter valid Mobile Number",
            maxlength: "Please enter valid Mobile Number",
            number: "Please enter valid Mobile Number"
        },
        agree: "Please accept our Terms & Conditions"
    }
});
