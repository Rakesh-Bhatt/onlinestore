<%-- 
    Document   : navbar
    Created on : Aug 3, 2019, 1:40:55 PM
    Author     : CIT
--%>

<%@page import="java.util.List"%>
<%@page import="org.onlinestore.model.Product"%>
<%@page import="org.onlinestore.controller.ProductDAO"%>
<%@page import="org.onlinestore.util.DBConnection"%>
<%@page import="java.sql.*"%>
<!-- Left Panel -->

<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("loginform.jsp");
//request.getRequestDispatcher("loginform.jsp").include(request, response);
    }
%>
<aside id="left-panel" class="left-panel">
    <nav class="navbar navbar-expand-sm navbar-default">

        <div class="navbar-header">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#main-menu" aria-controls="main-menu" aria-expanded="false" aria-label="Toggle navigation">
                <i class="fa fa-bars"></i>
            </button>
            <a class="navbar-brand" href="./"><img src="images/logo.png" alt="Logo"></a>
            <a class="navbar-brand hidden" href="./"><img src="images/logo2.png" alt="Logo"></a>
        </div>

        <div id="main-menu" class="main-menu collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active">
                    <a href="searchAdmin.jsp"> <i class="menu-icon fa fa-dashboard"></i>Dashboard </a>
                </li>
                <h3 class="menu-title">Forms</h3><!-- /.menu-title -->

                <!--Adding the forms here -->
                <li>
                    <a href="category.jsp"> <i class="menu-icon fa fa-sign-in"></i>Add Category </a>
                </li>
                <li>
                    <a href="product.jsp"> <i class="menu-icon fa fa-sign-in"></i>Add product</a>
                </li>
                <li>
                    <a href="shipper.jsp"> <i class="menu-icon fa fa-sign-in"></i>Add shipper </a>
                </li>
                <li>
                    <a href="supplier.jsp"> <i class="menu-icon fa fa-sign-in"></i>Add Supplier </a>
                </li>
                <!--view of  the forms here -->
                <h3 class="menu-title">View</h3><!-- /.menu-title -->
<!--                <li>
                    <a href="viewCustomer.jsp"> <i class="menu-icon ti-email"></i>View Customer</a>
                </li>-->
                <li>
                    <a href="viewCategory.jsp"> <i class="menu-icon ti-email"></i>View Category</a>
                </li>
                <li>
                    <a href="viewSupplier.jsp"> <i class="menu-icon ti-email"></i>View Suppliers</a>
                </li>
                <li>
                    <a href="viewShipper.jsp"> <i class="menu-icon ti-email"></i>View Shipper</a>
                </li>
                <li>
                    <a href="viewProduct.jsp"> <i class="menu-icon ti-email"></i>View product</a>
                </li>
                <li>
                    <a href="viewOrder.jsp"> <i class="menu-icon ti-email"></i>View order</a>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </nav>
</aside><!-- /#left-panel -->

<!-- Left Panel -->

<!-- Right Panel -->

<div id="right-panel" class="right-panel">

    <!-- Header-->
    <header id="header" class="header">

        <div class="header-menu">

            <div class="col-sm-7">
                <a id="menuToggle" class="menutoggle pull-left"><i class="fa fa fa-tasks"></i></a>
                <div class="header-left">
                    <!--<button class="search-trigger"><i class="fa fa-search"></i></button>-->
                    <form action="searchAdmin.jsp">
                        <div class="row form-group">
                            <!--<div class="col col-md-3"><label for="text-input" class=" form-control-label">Search</label></div>-->
                            <div class="search-form"><input type="text" id="text-input" name="search" placeholder="search product" class="form-control mr-sm-2"></div>
                            <div class="search-form"><button><i class="fa fa-search"></i></button></div>
                        </div>
                    </form>
                    <!--for notification-->
                    <!--<div class="dropdown">-->
                    <%
                        ProductDAO pDAO = new ProductDAO();
                        int count = pDAO.countQuantity();
//                        out.println(count);
                    %>
                    <a href="notification.jsp">
                        <button class="btn btn-secondary">
                            <i class="fa fa-bell"></i>
                                <span class="count bg-danger">
                                     <%=count%>
                                </span>
                        </button>
                    </a>
                    <a href="message.jsp">
                        <button class="btn btn-secondary">
                            <i class="ti-email"></i>
                                <span class="count bg-danger">
                                     5
                                </span>
                        </button>
                    </a>
                    <!--end-->
                </div>
            </div>

            <div class="col-sm-5">
                <div class="user-area dropdown float-right">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">

                    </a>

                    <a class="nav-link" href="logout.jsp"><i class="fa fa-power-off"></i> Logout</a>

                    <div class="language-select dropdown" id="language-select">
                        <%
                            if (session.getAttribute("username") != null) {
                        %>
                        <a class="dropdown-toggle" href="#" data-toggle="dropdown"  id="language" aria-haspopup="true" aria-expanded="true">
                            <%="Welcome," + session.getAttribute("username")%>
                        </a>

                        <% }
                        %>

                    </div>

                </div>
            </div>
        </div>
    </header>

