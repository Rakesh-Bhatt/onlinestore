<%-- 
    Document   : signup
    Created on : Nov 6, 2019, 1:33:59 PM
    Author     : CIT
--%>
<%@page import="org.onlinestore.model.SignUp"%>
<%@page import="java.sql.*"%>
<%@page import="org.onlinestore.util.DBConnection"%>
<jsp:include page="layout2/header.jsp"/>
<jsp:include page="layout2/navbar.jsp"/> 
<head>
<script type="text/javascript">
    function validation() {
        var name = document.signup.name.value;
        var password = document.signup.password.value;
        /* start validation for name */
        var namepattern = /^([a-z A-Z])+$/;
        if (name.trim() == '') {
            alert('Enter name');
            document.signup.name.focus();
            return false;
        } else if (!namepattern.test(name)) {
            alert('Name Must be in character Format');
            document.signup.name.focus();
            return false;
        } else if (name.length < 3) {
            alert('Name should be minimum 3 character');
            document.signup.name.focus();
            return false;
        }
        /* start validation for password */ 
			if (password.trim() == '') {
				alert('Enter Password');
				document.signup.password.focus();
				return false;
                        }
        /* end validation for password */ 
    }

</script>
</head>
<div class="col-md-6 p-b-30">
    <form class="leave-comment" action="customerLoginSuccess.jsp" method="get" onsubmit="return validation()" name="signup" >
        <h4 class="m-text26 p-b-36 p-t-15">
            Please Login to continue
        </h4>
        Username
        <div class="bo4 of-hidden size15 m-b-20">
            <input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="name" placeholder="Full Name">
        </div>
        Password
        <div class="bo4 of-hidden size15 m-b-20">
            <input class="sizefull s-text7 p-l-22 p-r-22" type="password" name="password" placeholder="Password">
        </div>
        <div class="w-size25">
            <!-- Button -->
            <button class="flex-c-m size2 bg1 bo-rad-23 hov1 m-text3 trans-0-4">
                Submit
            </button>
        </div>
       
    </form>
</div>

<jsp:include page="layout2/footer.jsp"/>