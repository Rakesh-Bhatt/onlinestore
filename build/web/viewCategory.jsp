<%-- 
    Document   : viewCategory
    Created on : Aug 6, 2019, 9:58:00 AM
    Author     : CIT
--%>

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
                        <h1>View Category Table</h1>
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
                                <strong class="card-title">View Category</strong>
                            </div>
                            <div class="card-body">
                                <table id="bootstrap-data-table-export" class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                            <th>CategoryID</th>
                                            <th>Name</th>
                                            <th>Category</th>
                                            <th>Description</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                Connection con = DBConnection.getConnection();
                                CategoryDAO cDAO=new CategoryDAO();
                                List<Category> categorylist=cDAO.fetchData();
                                for(Category c: categorylist)
                                 {
                                %>
                                        <tr>
                                            <td><%=c.getBrandID()%></td>
                                            <td><%=c.getName()%></td>
                                            <td><%=c.getmID()%></td>
                                            <td><%=c.getDescription()%></td>
                                            <td>
                                                <div class="fa-hover col-lg-3 col-md-6">
                                                    <a href="editCategory.jsp?id=<%=c.getBrandID()%>"
                                                      <i class="fa fa-pencil"></i> Edit</a>
                                                </div>
                                                <div class="fa-hover col-lg-3 col-md-6">
                                                    <a href="DeleteCategory?id=<%=c.getBrandID()%>"
                                                        <i class="fa fa-trash-o"></i> Delete
                                                    </a>
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