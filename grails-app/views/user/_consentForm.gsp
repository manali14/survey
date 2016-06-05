<%@ page import="enums.Caste; enums.Gender" %>
<g:form name="candidateRegisterForm" role="form">
    <input type="text" value="${studyType}" style="display: none" name="studyType"/>
    <fieldset>

        <label class="block clearfix">
            <label for="name" class="col-lg-2">Name</label>
            <span class="block input-icon input-icon-right col-lg-10">
                <input type="text" minlength="2" class="form-control" placeholder="Name"
                       name="name">
                <i class="ace-icon fa fa-user"></i>
            </span>
        </label>

        <label class="block clearfix">
            <label for="age" class="col-lg-2">Age*</label>

            <span class="block input-icon input-icon-right col-lg-10">
                <input type="text" name="age" class="form-control"
                       placeholder="Age">
            </span>
        </label>

        <label class="block clearfix">
            <label for="gender" class="col-lg-2">Gender*</label>

            <span class="block input-icon input-icon-right col-lg-10">
                <span class="pull-left">
                    <input type="radio" name="gender" value="${Gender.MALE}">Male
                </span>
                <span class="margin-left20">
                    <input type="radio" name="gender" value="${Gender.FEMALE}">Female
                </span>
            </span>
        </label>

        <label class="block clearfix">
            <label for="caste" class="col-lg-2">Case*</label>

            <span class="block input-icon input-icon-right col-lg-10">
                <span class="pull-left">
                    <input type="radio" name="caste" value="${Caste.SC}">SC
                </span>
                <span class="margin-left20">
                    <input type="radio" name="caste" value="${Caste.ST}">ST
                </span>
                <span class="margin-left20">
                    <input type="radio" name="caste" value="${Caste.OBC}">OBC
                </span>
                <span class="margin-left20">
                    <input type="radio" name="caste" value="${Caste.GENERAL}">GENERAL
                </span>
            </span>
        </label>

        <label class="block clearfix">
            <label for="email" class="col-lg-2">Email</label>

            <span class="block input-icon input-icon-right col-lg-10">
                <input type="email" class="form-control" placeholder="Email" name="email">
                <i class="ace-icon fa fa-envelope"></i>
            </span>
        </label>

        <label class="block clearfix">
            <label for="school" class="col-lg-2">School*</label>

            <span class="block input-icon input-icon-right col-lg-10">
                <input type="text" class="form-control" placeholder="School" name="school">
            </span>
        </label>

        <label class="block clearfix">
            <label for="contactNo" class="col-lg-2">Contact Number*</label>

            <span class="block input-icon input-icon-right col-lg-10">
                <input type="text" name="mobileNumber" class="form-control"
                       placeholder="Mobile Number">
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
                   class=" pull-right btn btn-sm btn-success bigger-110"
                   value="Register">

        </div>
    </fieldset>
</g:form>