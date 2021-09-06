<%-- 
    Document   : logout.jsp
    Created on : Nov 5, 2019, 8:22:59 PM
    Author     : CIT
--%>
<%

session.invalidate();
response.sendRedirect("loginform.jsp");
%>