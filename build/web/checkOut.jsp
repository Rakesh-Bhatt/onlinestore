<%-- 
    Document   : checkOut
    Created on : Dec 14, 2019, 1:37:36 PM
    Author     : CIT
--%>
<%-- 
    Document   : checkOut
    Created on : Nov 20, 2019, 7:03:15 PM
    Author     : CIT
--%>

<%@page import="org.onlinestore.controller.CartDAO"%>
<%@page import="org.onlinestore.controller.ProductDAO"%>
<%@page import="org.onlinestore.model.Product"%>
<%@page import="org.onlinestore.controller.OrderDAO"%>
<%@page import="org.onlinestore.util.DBConnection"%>
<%@page import="org.onlinestore.model.Order"%>
<%@page import="java.util.Date"%>
<jsp:include page="layout2/header.jsp"/>
<jsp:include page="layout2/navbar.jsp"/>
<%
    String cust_id = session.getAttribute("custID").toString();
    int cid = Integer.parseInt(cust_id);
    String area = request.getParameter("area");
    String location = request.getParameter("currentlocation");
    String city = request.getParameter("city");
    int freight = Integer.parseInt(request.getParameter("freight"));
    Long phone = Long.parseLong(request.getParameter("phone"));
    int postalCode = Integer.parseInt(request.getParameter("postcode"));
    Date date = new Date();

    int totalItem = Integer.parseInt(request.getParameter("totalItem")) + 1;
   // out.println(totalItem);
    int i = 1;
    while (i < totalItem) {
        int pid = Integer.parseInt(request.getParameter("productID"+i));
        int qty = Integer.parseInt(request.getParameter("quantity" + i));
//            double price = Double.parseDouble(request.getParameter("price" + i));

        Order ob = new Order();
        ob.setProductID(pid);
        ob.setCustomerID(cid);
        ob.setQuantity(qty);
        ob.setDate(date);
        ob.setArea(area);
        ob.setCity(city);
        ob.setLocation(location);
        ob.setPostalCode(postalCode);
        ob.setPhone(phone);
        ob.setFreight(freight);

//        out.println("p: " + ob.getProductID());
//        out.println("c: " + ob.getCustomerID());
//        out.println("q: " + ob.getQuantity());
//        out.println("date: " + ob.getDate());
//        out.println("Area: " + ob.getArea());
//        out.println("city: " + ob.getCity());
//        out.println("location: " + ob.getLocation());
//        out.println("postal: " + ob.getPostalCode());
//        out.println("phone: " + ob.getPhone());
//        out.println("Freight: " + ob.getFreight());
//        out.println("-----------------------");

        OrderDAO.saveOrder(ob);
         int totalQty = ProductDAO.getQty(pid);
          //  out.println("Total Quantity: "+totalQty);
            //out.println("Order Quantity: "+qty);
            int remQty = totalQty - qty;
           // out.println("Remaining Quantity: "+remQty);
            ProductDAO.updateQuantity(pid, remQty);
            CartDAO.removeCart(cid);
        i++;
    }
%><center><%out.println("YOUR ORDER HAS BEEN PLACED");%></center>
<center><a href="home.jsp">Please continue shopping</a></center>
<jsp:include page="layout2/footer.jsp"/>