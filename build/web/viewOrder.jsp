<%-- 
    Document   : viewCustomer
    Created on : Aug 5, 2019, 7:06:00 PM
    Author     : CIT
--%>
<%@page import="org.onlinestore.model.Order"%>
<%@page import="org.onlinestore.controller.OrderDAO"%>
<%@page import="java.util.List"%>
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
                        <h1>View order Table </h1>
                    </div>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="page-header float-right">
                    <div class="page-title">
                        <ol class="breadcrumb text-right">
                            <li><a href="index.jsp">Dashboard</a></li>
                            <li class="active">Data table</li>
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
                                <strong class="card-title">Data Table</strong>
                            </div>
                            <div class="card-body">
                                <table id="bootstrap-data-table-export" class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                            <th>OrderID</th>
                                            <th>CustomerID</th>
                                            <th>ProductID</th>
                                            <th>Quantity</th>
                                            <th>Order Date</th>
                                            <th>Area</th>
                                            <th>City</th>
                                            <th>Location</th>
                                            <th>PostCode</th>
                                            <th>phone</th>
                                            <th>freight</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                Connection con = DBConnection.getConnection();
                                OrderDAO oDAO=new OrderDAO();
                                List<Order> orderlist=oDAO.viewOrders();
                                for(Order c: orderlist)
                                 {
                                %>
                                        <tr>
                                       
                                            <td><%=c.getOrderID()%></td>
                                             <td><%=c.getCustomerID()%></td>
                                            <td><%=c.getProductID()%></td>
                                            <td><%=c.getQuantity()%></td>
                                            <td><%=c.getDate()%></td>
                                            <td><%=c.getArea()%></td>
                                            <td><%=c.getCity()%></td>
                                            <td><%=c.getLocation()%></td>
                                            <td><%=c.getPostalCode()%></td>
                                            <td><%=c.getPhone()%></td>
                                            <td><%=c.getFreight()%></td>
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