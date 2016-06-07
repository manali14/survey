// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better
// to create separate JavaScript files as needed.
//
//= require jquery.2.1.1.min
//= require jquery.1.11.1.min
//= require bootstrap.min
//= require moment.min
//= require jquery.dataTables.min
//= require jquery.dataTables.bootstrap.min
//= require dataTables.colVis.min
//= require dataTables.tableTools.min
//= require bootstrap-datepicker.min
//= require ace.min
//= require report
//= require jquery.validate.min
//= require custom
//= require_self

if (typeof jQuery !== 'undefined') {
    (function ($) {
        $('#spinner').ajaxStart(function () {
            $(this).fadeIn();
        }).ajaxStop(function () {
            $(this).fadeOut();
        });
    })(jQuery);
}
