$('.date-picker').datepicker({
    autoclose: true,
    todayHighlight: true
}).next().on(ace.click_event, function () {
    $(this).prev().focus();
});
// $('#candidateRegisterForm').validate({
//     rules: {
//         email: {
//             email: true
//         },
//         mobileNumber: {
//             required: true,
//             length: 10,
//             number: true
//         },
//         age: {
//             required: true,
//             number: true
//         },
//         gender: "required",
//         caste: "required",
//         school: "required",
//         agree: "required"
//     },
//     messages: {
//         email: {
//             required: "Please enter your Email"
//         },
//         mobileNumber: {
//             required: "Please enter your 10 digit Mobile Number",
//             length: "Please enter valid Mobile Number",
//             number: "Please enter valid Mobile Number"
//         },
//         age: {
//             required: "Please enter your Age",
//             number: "Please enter a valid Age"
//         },
//         gender: "Please select a Gender",
//         caste: "Please select your caste",
//         school: "Please enter your School Name",
//         agree: "Please accept our Terms & Conditions"
//     }
// });
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
$('#candidateRegisterForm').on('submit', function (e) {
    e.preventDefault();
    var data = $(this).serialize();
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
});
