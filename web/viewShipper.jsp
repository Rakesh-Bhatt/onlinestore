<%-- 
    Document   : viewShipper
    Created on : Aug 6, 2019, 10:23:36 AM
    Author     : CIT
--%>

<%@page import="org.onlinestore.controller.ShipperDAO"%>
<%@page import="org.onlinestore.model.Shipper"%>
<%@page import="org.onlinestore.model.Supplier"%>
<%@page import="org.onlinestore.controller.SupplierDAO"%>
<%@page import="org.onlinestore.controller.CategoryDAO"%>
<%@page import="org.onlinestore.model.Category"%>
<%@page import="java.util.List"%>
<%@page import="org.onlinestore.model.Customer"%>
<%@page import="org.onlinestore.util.DBConnection"%>
<%@page import="java.sql.*;"%>
<jsp:include page="layout/header.jsp"/>
<jsp:include page="layout/navbar.jsp"/>
<%
if(session.getAttribute("username")== null){  
             response.sendRedirect("loginform.jsp"); 
//request.getRequestDispatcher("loginform.jsp").include(request, response);
         }
%>
        </header><!-- /header -->
        <!-- Header-->

        <div class="breadcrumbs">
            <div class="col-sm-4">
                <div class="page-header float-left">
                    <div class="page-title">  
                        <h1>View Shipper Table</h1>
                    </div>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="page-header float-right">
                    <div class="page-title">
                        <ol class="breadcrumb text-right">
                            <li><a href="index.jsp">Dashboard</a></li>
                            <li class="active">Shipper Table</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>

        <div class="content mt-3">
            <div class="animated fadeIn">
                <div class="row">

                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <strong class="card-title">Shipper Table</strong>
                            </div>
                            <div class="card-body">
                                <table id="bootstrap-data-table-export" class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                            <th>Shipper ID</th>
                                            <th>Company Name</th>
                                            
                                            <th>Phone</th>
                                            <th>Product ID</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                Connection con = DBConnection.getConnection();
                                ShipperDAO sDAO=new ShipperDAO();
                                List<Shipper> shipperlist=sDAO.fetchData();
                                for(Shipper s: shipperlist)
                                 {
                                %>
                                        <tr>
                                            <td><%=s.getShippingID()%></td>
                                            <td><%=s.getCompanyname()%></td>
                                             
                                            <td><%=s.getPhone()%></td>
                                            <td><%=s.getProductID()%></td>
                                            <td>
                                                <div class="fa-hover col-lg-3 col-md-6">
                                                   <a href="editShipper.jsp?id=<%=s.getShippingID()%>"
                                                        <i class="fa fa-pencil"></i> Edit</a>
                                                </div>
                                                <div class="fa-hover col-lg-3 col-md-6">
                                                    <a href="DeleteShipper?id=<%=s.getShippingID()%>"><i class="fa fa-trash-o"></i> Delete</a>
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


    </div><!-- /#right-panel -->

    <!-- Right Panel -->
    <jsp:include page="layout/footer.jsp"/>