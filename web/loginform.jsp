<%-- 
    Document   : loginform1
    Created on : Aug 3, 2019, 5:56:55 PM
    Author     : CIT
--%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="org.onlinestore.util.DBConnection"%>
<%@page import="java.sql.Connection"%>
<jsp:include page="layout/header.jsp"/>
<%
    if(session.getAttribute("Result")==null)
    {
        out.println("Login Failed");
    }
%>
<head>
    <script type="text/javascript">
        function validation() {
            var name = document.signup.username.value;
            var password = document.signup.password.value;
            /* start validation for name */
            var namepattern = /^([a-z A-Z])+$/;
            if (name.trim() == '') {
                alert('Enter name');
                document.signup.username.focus();
                return false;
            } else if (!namepattern.test(name)) {
                alert('Name Must be in character Format');
                document.signup.username.focus();
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
<body class="bg-dark">


    <div class="sufee-login d-flex align-content-center flex-wrap">
        <div class="container">
            <div class="login-content">
                <div class="login-logo">
                    <a href="#"> EG LOOKS
                        <!--<img class="align-content" src="images/logo.png" alt="">-->
                    </a>
                </div>
                <div class="login-form">
                    <!--<form action="LoginStore">-->
                    <form method="get" onsubmit="return validation()" name="signup">
                        <div class="form-group">
                            <label>User Name</label>
                            <input type="text" name="username" class="form-control" placeholder="Enter username">
                        </div>
                        <div class="form-group">
                            <label>Password</label>
                            <input type="password" name="password" class="form-control" placeholder="Enter Password">
                        </div>
                        <div class="checkbox">
                            <label>
                                <input type="checkbox"> Remember Me
                            </label>
                            <label class="pull-right">
                                <a href="#">Forgotten Password?</a>
                            </label>

                        </div>
                        <button type="submit" class="btn btn-success btn-flat m-b-30 m-t-30">Sign in</button>
                        <div class="social-login-content">
                        </div>
                        <div class="register-link m-t-15 text-center">
                            <p>Don't have account ? <a href="#"> Sign Up Here</a></p>
                        </div>

                        <%
                            String username = request.getParameter("username");
                            String password = request.getParameter("password");
                            int result = 0;
                            Connection con = DBConnection.getConnection();
                            String sql = "select * from tbl_admin where status=1 and username=? and password=?";
                            PreparedStatement pst = con.prepareStatement(sql);
                            pst.setString(1, username);
                            pst.setString(2, password);
                            ResultSet rs = pst.executeQuery();
                            if (rs.next()) {
                                session.setAttribute("username", username);
                                result = 1;
                                session.setAttribute("result", "success");
//            setcookie('username',username,time()+24*60*60);
                                response.sendRedirect("searchAdmin.jsp");
                                
                            }
                        %>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
<jsp:include page="layout/footer.jsp"/>