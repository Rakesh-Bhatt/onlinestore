<%-- 
    Document   : search
    Created on : Nov 14, 2019, 5:34:47 PM
    Author     : CIT
--%>
<%@page import="java.util.List"%>
<%@page import="org.onlinestore.controller.ProductDAO"%>
<%@page import="org.onlinestore.model.Product"%>
<%@page import="org.onlinestore.util.DBConnection"%>
<%@page import="java.sql.*"%>
<jsp:include page="layout/header.jsp"/>
<jsp:include page="layout/navbar.jsp"/>
<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("loginform.jsp");
//request.getRequestDispatcher("loginform.jsp").include(request, response);
    }
%>
<%
    String name = request.getParameter("search");
//    out.println(name);
    Product ob = new Product();
//search from database

//        out.println(p.getProductname());
//        out.println(p.getProductID());
//        out.println(p.getNewprice());

%>
<div class="breadcrumbs">
    <center> <h1>Search product  to Edit and Delete By Product Name</h1></center>
</div>

<div class="content mt-3">
    <div class="animated fadeIn">
        <div class="row">

            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <strong class="card-title">Product Table</strong>
                    </div>
                    <div class="card-body">
                        <table id="bootstrap-data-table-export" class="table table-striped table-bordered">
                            <thead>
                                <tr>
                                    <th>Product ID</th>
                                    <th>Product Name</th>
                                    <th>Old Price</th>
                                    <th>New Price</th>
                                    <th>Unit in stock</th>
                                    <th>Description</th>
                                    <th>Main Category</th>
                                    <th>Sub Category</th>
                                    <th>Image</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%   ProductDAO pDAO = new ProductDAO();
                                    List<Product> searchlist = pDAO.SearchByName(name);
                                    for (Product p : searchlist) {
                                %>
                                <tr>
                                    <td><%=p.getProductID()%></td>
                                    <td><%=p.getProductname()%></td>
                                    <td><%=p.getOldprice()%></td>
                                    <td><%=p.getNewprice()%></td>
                                    <td><%=p.getUnit()%></td>
                                    <td><%=p.getDescription()%></td>
                                    <td><%=p.getMainCategoryID()%></td>
                                    <td><%=p.getCategoryID()%></td>
                                    <td><img src="images/<%=p.getImage()%>"></td>
                                    <td>
                                        <div class="fa-hover col-lg-3 col-md-6">
                                            <a href="editProduct.jsp?id=<%=p.getProductID()%>"
                                               <i class="fa fa-edit"></i> Edit</a>
                                        </div>
                                        <div class="fa-hover col-lg-3 col-md-6">
                                            <a href="deleteProduct.jsp?id=<%=p.getProductID()%>">
                                                <i class="fa fa-trash fa-2x" arial-hidden="true"></i></a>
                                        </div>
                                    </td>
                                </tr>
                                <%}%>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div><!-- .animated -->
</div><!-- .content -->

<!-- Right Panel -->
<jsp:include page="layout/footer.jsp"/>