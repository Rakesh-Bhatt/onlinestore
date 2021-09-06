<%-- 
    Document   : addToCart
    Created on : Aug 15, 2019, 4:25:26 PM
    Author     : CIT
--%>
<%@page import="org.onlinestore.controller.ProductDAO"%>
<%@page import="org.onlinestore.util.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@page import="org.onlinestore.model.Product"%>
<%@page import="org.onlinestore.controller.CartDAO"%>
<%@page import="org.onlinestore.model.Cart"%>
<%
    if(session.getAttribute("custUser")==null)
    {
        response.sendRedirect("customerLogin.jsp");
    }
    %>
    <%
    //session.setMaxInactiveInterval(2 * 60);
    //String sid = session.getId();
//    out.println(session.getAttribute("custID"));
//    out.println(session.getAttribute("ProductID"));
//    out.println(session.getAttribute("price"));
//    out.println(session.getAttribute("quantity"));
//    out.println(request.getParameter("qty"));
//    out.print(request.getParameter("price"));
//        cid = session.getAttribute("cutsID").toString();
//        cust_id = Integer.parseInt(cid);
    try {
        int cust_id = Integer.parseInt(session.getAttribute("custID").toString());
        int product_id = Integer.parseInt(request.getParameter("productID"));
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("qty"));

        Cart c = new Cart();
        c.setCustomerID(cust_id);
        c.setProductID(product_id);
        //c.setColor(color);

        //out.println(cust_id);out.println(product_id);
                        Connection con = DBConnection.getConnection();
        Product ob1 = new Product();
//        ob.setBrandID(id);
        ob1 = ProductDAO.fetchDataByID(product_id);

        int qunty = ob1.getUnit();
        int qty = CartDAO.getQty(c);
        out.println(qty);

        if (qty > 0) {
            if (qunty > qty) {

                Cart ob = new Cart();
                ob.setCustomerID(cust_id);
                ob.setProductID(product_id);
                ob.setQuantity(qty + (qunty - qty));

                int count = CartDAO.updateCart(ob);
                if (count > 0) {
                    session.setAttribute("successCart", "Successfully added into Cart");
                    response.sendRedirect("cart.jsp");
                }
            }
            else{
                response.sendRedirect("home.jsp");
            }
        } else {
            Cart ob = new Cart();
            ob.setProductID(product_id);
            ob.setCustomerID(cust_id);
            ob.setQuantity(quantity);
            ob.setPrice(price);

            CartDAO cDAO = new CartDAO();
            int count = cDAO.AddCart(ob);
            if (count > 0) {
                session.setAttribute("successCart", "Successfully added into Cart");
                response.sendRedirect("cart.jsp");
            }
        }
//    }else{
//         session.setAttribute("cartFail", "can not added into Cart");
//            response.sendRedirect("cart.jsp");
//    }
    } catch (NumberFormatException ex) {
        //
    }

//    Cart ob = new Cart();
//    ob.setCustomer_id(cust_id);
//    ob.setProduct_id(pid);
//    ob.setSession_id(sid);
//    ob.setColor(color);
//    ob.setRam(ram);
//    ob.setRom(rom);
//    ob.setPrice(price);
//    ob.setQuantity(quantity);
//
//    CartDAO cDAO = new CartDAO();
//    int count = cDAO.addCart(ob);
//    if (count > 0) {
//        session.setAttribute("successCart", "Successfully added into Cart");
//        response.sendRedirect("ShoppingCart.jsp");
//    }
%>