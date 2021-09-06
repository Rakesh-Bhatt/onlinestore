<%-- 
    Document   : notification
    Created on : Nov 19, 2019, 5:43:49 PM
    Author     : CIT
--%>
<%@page import="java.util.List"%>
<%@page import="org.onlinestore.model.Product"%>
<%@page import="org.onlinestore.util.DBConnection"%>
<%@page import="org.onlinestore.controller.ProductDAO"%>
<%@page import="java.sql.*"%>
<jsp:include page="layout/header.jsp"/>
<jsp:include page="layout/navbar.jsp"/>
<div class="card">
    <div class="card-header">
        <strong class="card-title">your notifications for  product</strong>
    </div>
    
    <div class="card-body">
        <%
    Connection con = DBConnection.getConnection();
    ProductDAO pDAO = new ProductDAO();
    List<Product> productlist = pDAO.fetchDataWithQuantity();
    for (Product p : productlist) {
%>
        <div class="sufee-alert alert with-close alert-primary alert-dismissible fade show">
            <span class="badge badge-pill badge-primary">Stock Limited</span>
            <%=p.getProductname()%> has only <%=p.getUnit()%> Left in Stock
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
          <%}%>
    </div>
  
</div>

<jsp:include page="layout/footer.jsp"/>