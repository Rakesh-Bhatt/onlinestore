<%-- 
    Document   : logoutHome.jsp
    Created on : Nov 11, 2019, 9:04:19 PM
    Author     : CIT
--%>
<%

session.invalidate();
response.sendRedirect("customerLogin.jsp");
%>