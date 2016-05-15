<%@ page import="enums.Gender" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Register</title>
</head>

<body>
<div class="row">
    <div class="col-sm-10 col-sm-offset-1">
        <div class="login-container">

            <div class="space-6"></div>

            <div class="position-relative">
                <div id="signup-box" class="signup-box widget-box no-border visible">
                    <div class="widget-body">
                        <div class="widget-main">
                            <h4 class="header green lighter bigger">
                                <i class="ace-icon fa fa-users blue"></i>
                                Candidate Registration
                            </h4>

                            <div class="space-6"></div>

                            <p>Enter your details to begin:</p>

                            <g:form controller="user" action="register" name="candidateRegisterForm">
                                <fieldset>
                                    <label class="block clearfix">
                                        <span class="block input-icon input-icon-right">
                                            <input type="email" class="form-control" placeholder="Email" name="email">
                                            <i class="ace-icon fa fa-envelope"></i>
                                        </span>
                                    </label>

                                    <label class="block clearfix">
                                        <span class="block input-icon input-icon-right">
                                            <input type="text" minlength="2" class="form-control" placeholder="Name"
                                                   name="name">
                                            <i class="ace-icon fa fa-user"></i>
                                        </span>
                                    </label>

                                    <label class="block clearfix">
                                        <span class="block input-icon input-icon-right">
                                            <input type="text" name="mobileNum" class="form-control"
                                                   placeholder="Mobile Number">
                                        </span>
                                    </label>

                                    <label class="block clearfix">
                                        <span class="block input-icon input-icon-right">
                                            <span class="pull-left">
                                                <input type="radio" name="gender" value="${Gender.MALE}">Male
                                            </span>
                                            <span class="margin-left20">
                                                <input type="radio" name="gender" value="${Gender.FEMALE}">Female
                                            </span>
                                        </span>
                                    </label>

                                    <label class="block">
                                        <span class="lbl">
                                            I accept the Terms & Conditions
                                        </span>
                                        <input type="checkbox" name="agree">
                                    </label>

                                    <div class="space-24"></div>

                                    <div class="clearfix">

                                        <input type="submit"
                                               class="width-65 pull-right btn btn-sm btn-success bigger-110"
                                               value="Register">

                                    </div>
                                </fieldset>
                            </g:form>
                        </div>

                    </div><!-- /.widget-body -->
                </div><!-- /.signup-box -->

            </div><!-- /.position-relative -->

        </div>
    </div><!-- /.col -->
</div>
</body>
</html>
