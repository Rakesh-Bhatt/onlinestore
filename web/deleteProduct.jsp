<%-- 
    Document   : deleteProduct
    Created on : Nov 18, 2019, 6:01:11 PM
    Author     : CIT
--%>
<%@page import="org.onlinestore.controller.ProductDAO"%>
<%@page import="org.onlinestore.model.Product"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    Product ob = new Product();
        ob.setProductID(id);
        ProductDAO pDAO = new ProductDAO();
     int val = pDAO.deleteData(ob);
     if (val>0)
     {
         response.sendRedirect("viewProduct.jsp");
     }
     else
     {
         out.println("not deleted");
     }
//    out.println(session.getAttribute("custID"));

%>