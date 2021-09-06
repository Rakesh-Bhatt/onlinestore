<%-- 
    Document   : signup
    Created on : Nov 6, 2019, 1:33:59 PM
    Author     : CIT
--%>
<jsp:include page="layout2/header.jsp"/>
<jsp:include page="layout2/navbar.jsp"/> 
<head>
<script type="text/javascript">
    function validation() {
        var name = document.signup.name.value;
        var password = document.signup.password.value;
        var repassword = document.signup.repassword.value;
        var phone = document.signup.phone.value;
        var email = document.signup.email.value;
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
			
			if (repassword.trim() == '') {
				alert('Enter Re Password');
				document.signup.repassword.focus();
				return false;
			}

			if (password != repassword ) {
				alert('Password and Re Password Must be Same');
				document.signup.repassword.focus();
				return false;
			} else {
				document.signup.repassword.focus();
                                return false;
			}
        /* end validation for password */ 
        /* Start validation for phone */
        var phonepattern = /^([0-9]{10})$/;
        if (phone.trim() == '') {
            alert('Enter Phone');
            document.signup.phone.focus();
            return false;
        } else if (phone.length < 10) {
            alert(' Phone should be 10 character');
            document.signup.phone.focus();
            return false;
        } else if (!phonepattern.test(phone)) {
            alert('Phone Must be Number with 10 Digit');
            document.signup.phone.focus();
            return false;
        } else {
         }
        /* end validation for Phone */
        /* Start validation for Email */
        var emailpattern = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        if (email.trim() == '') {
            alert('Enter Email');
            document.signup.email.focus();
            return false;
        } else if (!emailpattern.test(email)) {
            alert('Email Must be Email Format');
            document.signup.email.focus();
            return false;
        } else {
           alart("Enter email");
        }
        /* end validation for Email */
    }

</script>
</head>
<body>
<div class="col-md-6 p-b-30">
    <form class="leave-comment" method="get" action="signupSuccess.jsp" onsubmit="return validation()" name="signup" >
        <h4 class="m-text26 p-b-36 p-t-15">
            Please fill the signup form
        </h4>
        Username
        <div class="bo4 of-hidden size15 m-b-20">
            <input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="name" placeholder="Full Name">
        </div>
        Phone
        <div class="bo4 of-hidden size15 m-b-20">
            <input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="phone-number" placeholder="Phone Number">
        </div>
        Email Address
        <div class="bo4 of-hidden size15 m-b-20">
            <input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="email" placeholder="Email Address">
        </div>
        Password
        <div class="bo4 of-hidden size15 m-b-20">
            <input class="sizefull s-text7 p-l-22 p-r-22" type="password" name="password" placeholder="Password">
        </div>
        Conform password
        <div class="bo4 of-hidden size15 m-b-20">
            <input class="sizefull s-text7 p-l-22 p-r-22" type="password" name="repassword" placeholder="Repassword">
        </div>
        <div class="w-size25">
            <!-- Button -->
            <button class="flex-c-m size2 bg1 bo-rad-23 hov1 m-text3 trans-0-4">
                Submit
            </button>
        <div class="w-size25">
            <!-- Button -->
            <button class="flex-c-m size2 bg1 bo-rad-23 hov1 m-text3 trans-0-4">
                <a href="customerLogin.jsp" color="white">  Login</a>
            </button>
        </div>
        </div>
    </form>
</div>
</body>
<jsp:include page="layout2/footer.jsp"/>