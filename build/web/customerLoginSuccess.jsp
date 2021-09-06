<%-- 
    Document   : customerLoginSuccess
    Created on : Nov 16, 2019, 1:32:13 PM
    Author     : CIT
--%>
<%@page import="org.onlinestore.controller.SignUpDAO"%>
<%@page import="org.onlinestore.model.SignUp"%>
<%
       String username = request.getParameter("name");
        String password = request.getParameter("password");
      

        SignUp ob = new SignUp();
        ob.setUsername(username);
        ob.setPassword(password);
        int count = SignUpDAO.verifyUser(ob);
        if(count >0)
        {
           session.setAttribute("custUser",username);
          int id = ob.getId();
//          out.println(id);
          session.setAttribute("custID",id);
          
   
//           session.setAttribute("result",result);
//            setcookie('username',username,time()+24*60*60);
           response.sendRedirect("home.jsp");
        }
//        }else{
//            session.setMaxInactiveInterval(5);
//            session.setAttribute("loginFail","customer login failed");
//        }
                 %>