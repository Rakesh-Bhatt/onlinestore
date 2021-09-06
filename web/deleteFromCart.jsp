<%-- 
    Document   : deleteFromCart
    Created on : Nov 18, 2019, 2:49:05 PM
    Author     : CIT
--%>
<%@page import="org.onlinestore.controller.CartDAO"%>
<%@page import="org.onlinestore.model.Cart"%>
<%
    int ProductID = Integer.parseInt(request.getParameter("productID"));
    int customerID = Integer.parseInt(request.getParameter("custID"));
    
    Cart ob = new Cart();
        ob.setProductID(ProductID);
        ob.setCustomerID(customerID);
        CartDAO pDAO = new CartDAO();
     int val = pDAO.deleteFromCart(ob);
     if (val>0)
     {
         session.setAttribute("deleteSuccess","SuccessFully Deleted from cart");
         response.sendRedirect("cart.jsp");
     }
     else
     {
         out.println("not deleted");
     }
//    out.println(session.getAttribute("custID"));

%>