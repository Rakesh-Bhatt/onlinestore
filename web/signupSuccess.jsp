<%-- 
    Document   : signupSuccess
    Created on : Nov 9, 2019, 3:29:57 PM
    Author     : CIT
--%>
<%@page import="org.onlinestore.model.SignUp"%>
<%@page import="org.onlinestore.controller.SignUpDAO"%>
<!--Get The Value From Category From Web-->
<%
        String name = request.getParameter("name");
        Long phone = Long.parseLong(request.getParameter("phone-number"));
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        SignUp ob = new SignUp();
        ob.setUsername(name);
        ob.setPhone(phone);    
        ob.setEmail(email);
        ob.setPassword(password);
        
        SignUpDAO sDAO = new SignUpDAO();
        int val = sDAO.AddCustomer(ob);
        
if(val>0)
{
    response.sendRedirect("customerLogin.jsp");
}
else
{
    response.sendRedirect("signup.jsp");
}
%>