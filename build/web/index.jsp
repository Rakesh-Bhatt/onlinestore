<%-- 
    Document   : index
    Created on : Aug 3, 2019, 1:46:03 PM
    Author     : CIT
--%>

<jsp:include page="layout/header.jsp"/>
<jsp:include page="layout/navbar.jsp"/>
<%
if(session.getAttribute("username")== null){  
             response.sendRedirect("loginform.jsp"); 
//request.getRequestDispatcher("loginform.jsp").include(request, response);
         }
%>
<jsp:include page="layout/footer.jsp"/>
