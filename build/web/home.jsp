<%-- 
    Document   : home
    Created on : Sep 1, 2019, 2:32:25 PM
    Author     : CIT
--%>

<%@page import="java.util.List"%>
<%@page import="org.onlinestore.model.Product"%>
<%@page import="org.onlinestore.controller.ProductDAO"%>
<%@page import="org.onlinestore.util.DBConnection"%>
<%@page import="java.sql.*"%>
<jsp:include page="layout2/header.jsp"/>
<jsp:include page="layout2/navbar.jsp"/>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>


    <!-- Slide1 -->
    <!-- slide for the home page -->
    <!-- Our product -->
    <section class="bgwhite p-t-45 p-b-58">
        <div class="container">
            <div class="sec-title p-b-22">
                <h3 class="m-text5 t-center">
                    Our Products
                </h3>
            </div>

            <!-- Tab01 -->
            <div class="tab01">
                <!-- Nav tabs -->
                <ul class="nav nav-tabs" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" data-toggle="tab" href="#best-seller" role="tab">Best Seller</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#featured" role="tab">Featured</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#sale" role="tab">Sale</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#top-rate" role="tab">Top Rate</a>
                    </li>
                </ul>

                <!-- Tab panes -->
                <div class="tab-content p-t-35">
                    <!-- for fetching the product form database -->

                    <div class="tab-pane fade show active" id="best-seller" role="tabpanel">

                        <div class="row">
                            <%
                                Connection con = DBConnection.getConnection();
                                ProductDAO pDAO = new ProductDAO();
                                List<Product> productlist = pDAO.fetchData();
                                for (Product p : productlist) {
                            %>
                            <div class="col-sm-6 col-md-4 col-lg-3 p-b-50">
                                <!-- Block2 -->
                                <div class="block2">
                                    <div class="block2-img wrap-pic-w of-hidden pos-relative block2-labelnew">
                                        <a href="productDetail.jsp?id=<%=p.getProductID()%>">
                                            <img src="images/<%=p.getImage()%>" alt="IMG-PRODUCT">
                                        </a>
                                        <div class="block2-overlay trans-0-4">
                                            <a href="#" class="block2-btn-addwishlist hov-pointer trans-0-4">
                                                <i class="icon-wishlist icon_heart_alt" aria-hidden="true"></i>
                                                <i class="icon-wishlist icon_heart dis-none" aria-hidden="true"></i>
                                            </a>

                                            <div class="block2-btn-addcart w-size1">
                                                <!-- Button -->
                                                <button class="flex-c-m size1 bg4 bo-rad-23 hov1 s-text1 trans-0-4">
                                                    <a href="productDetail.jsp?id=<%=p.getProductID()%>">
                                                        BUY
                                                    </a>  
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    </a>
                                    <div class="block2-txt p-t-20">
                                        <a href="productDetail.jsp?id=<%=p.getProductID()%>" class="block2-name dis-block s-text3 p-b-5">
                                            <%=p.getProductname()%> 
                                        </a>

                                        <span class="block2-price m-text6 p-r-5">
                                            <%=p.getNewprice()%> 
                                        </span>
                                        <span class="block2-price m-text6 p-r-5">
                                            <s>
                                                <%=p.getOldprice()%> 
                                            </s>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <%}%> 
                        </div>

                    </div>
                    <!--  For Sale products- -->
                </div>
            </div>
        </div>
    </section>


    <jsp:include page="layout2/footer.jsp"/>
</body>
</html>
