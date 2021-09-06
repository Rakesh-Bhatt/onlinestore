<%-- 
    Document   : navbar
    Created on : Sep 1, 2019, 2:18:02 PM
    Author     : CIT
--%>
<body class="animsition">

    <!-- header fixed -->
    <!--This is for fixed shown header-->
    <div class="wrap_header fixed-header2 trans-0-4">
        <!-- Logo -->
        <a href="home.jsp" class="logo">
            <img src="images/logo.png" alt="IMG-LOGO" height="500" width="500">
        </a>

        <!-- Menu -->
        <div class="wrap_menu">
            <nav class="menu">
                <ul class="main_menu">
                    <li>
                        <a href="home.jsp">Home</a>
                    </li>

                    <li>
                        <a href="shop.jsp">Shop</a>
                    </li>

                    <li>
                        <a href="about.jsp">About</a>
                    </li>

                    <li>
                        <a href="contact.jsp">Contact</a>
                    </li>
                </ul>
            </nav>
        </div>

        <!-- Header Icon -->
        <!--This is when we scroll down-->
        <div class="header-icons">
            <a href="#" class="header-wrapicon1 dis-block">
                <img src="images/icons/icon-header-01.png" class="header-icon1" alt="ICON">
            </a>

            <span class="linedivide1"></span>

            <div class="header-wrapicon2">
                <%
                    if (session.getAttribute("custUser") != null) {
                %>
                <a href="cart.jsp"><img src="images/icons/icon-header-02.png" class="header-icon1 js-show-header-dropdown" alt="ICON">
                    <span class="header-icons-noti">0</span>
                </a>
                <%} else {%>
                <a href="emptyCart.jsp"><img src="images/icons/icon-header-02.png" class="header-icon1 js-show-header-dropdown" alt="ICON">
                    <span class="header-icons-noti">0</span>
                </a>
                <%}%>
                <!-- Header cart noti -->
            </div>
        </div>
    </div>

    <!-- Header -->
    <header class="header2">
        <!-- Header desktop -->
        <div class="container-menu-header-v2 p-t-26">
            <div class="topbar2">
                <div class="topbar-social">
                    <a href="#" class="topbar-social-item fa fa-facebook"></a>
                    <a href="#" class="topbar-social-item fa fa-instagram"></a>
                    <a href="#" class="topbar-social-item fa fa-pinterest-p"></a>
                    <a href="#" class="topbar-social-item fa fa-snapchat-ghost"></a>
                    <a href="#" class="topbar-social-item fa fa-youtube-play"></a>
                </div>

                <!-- Logo2 -->
                <a href="home.jsp" class="logo2">
                    <img src="images/icons/logo.png" alt="IMG-LOGO">
                </a>

                <div class="topbar-child2">
                    <div
                        <span class="topbar-email">
                            <% if (session.getAttribute("custUser") != null) {
                                    out.println(session.getAttribute("custUser") + "'s account");
                            %></span>
                        <span><a href="logoutHome.jsp">Logout</a></span>

                        <% } else {%>

                        <!--                                            <span class="topbar-email">-->
                        <a href="customerLogin.jsp">Login</a>
                        <a href="signup.jsp">Register</a>
                        <!--</span>-->
                        <%}%>
                    </div>
                    <!--  -->
                    <a href="#" class="header-wrapicon1 dis-block m-l-30">
                        <img src="images/icons/icon-header-01.png" class="header-icon1" alt="ICON">
                    </a>

                    <span class="linedivide1"></span>

                    <div class="header-wrapicon2 m-r-13">
                        <a href="cart.jsp"><img src="images/icons/icon-header-02.png" class="header-icon1 js-show-header-dropdown" alt="ICON">

                            <span class="header-icons-noti">0</span>
                        </a>
                        <!-- Header cart noti -->
                        <!--							<div class="header-cart header-dropdown">
                                                                                        <ul class="header-cart-wrapitem">
                                                                                                <li class="header-cart-item">
                                                                                                        <div class="header-cart-item-img">
                                                                                                                <img src="images/item-cart-01.jpg" alt="IMG">
                                                                                                        </div>
                        
                                                                                                </li>
                        
                                                                                                <li class="header-cart-item">
                                                                                                        <div class="header-cart-item-img">
                                                                                                                <img src="images/item-cart-02.jpg" alt="IMG">
                                                                                                        </div>
                        
                                                                                                </li>
                        
                                                                                                <li class="header-cart-item">
                                                                                                        <div class="header-cart-item-img">
                                                                                                                <img src="images/item-cart-03.jpg" alt="IMG">
                                                                                                        </div>
                        
                                                                                                </li>
                                                                                        </ul>
                        
                                                                                        <div class="header-cart-total">
                                                                                                Total: $75.00
                                                                                        </div>
                        
                                                                                        <div class="header-cart-buttons">
                                                                                                <div class="header-cart-wrapbtn">
                                                                                                         Button 
                                                                                                        <a href="cart.jsp" class="flex-c-m size1 bg1 bo-rad-20 hov1 s-text1 trans-0-4">
                                                                                                                View Cart
                                                                                                        </a>
                                                                                                </div>
                        
                                                                                                <div class="header-cart-wrapbtn">
                                                                                                         Button 
                                                                                                        <a href="#" class="flex-c-m size1 bg1 bo-rad-20 hov1 s-text1 trans-0-4">
                                                                                                                Check Out
                                                                                                        </a>
                                                                                                </div>
                                                                                        </div>
                                                                                </div>-->
                    </div>
                </div>
            </div>

            <div class="wrap_header">

                <!-- Menu -->
                <div class="wrap_menu">
                    <nav class="menu">
                        <ul class="main_menu">
                            <li>
                                <a href="home.jsp">Home</a>

                            </li>

                            <li>
                                <a href="shop.jsp">Shop</a>
                            </li>

                            <li>
                                <a href="about.jsp">About</a>
                            </li>

                            <li>
                                <a href="contact.jsp">Contact</a>
                            </li>
                        </ul>
                    </nav>
                </div>

                <!-- Header Icon -->
                <div class="header-icons">

                </div>
            </div>
        </div>

        <!-- Header Mobile -->
        <div class="wrap_header_mobile">
            <!-- Logo moblie -->
            <a href="home.jsp" class="logo-mobile">
                <img src="images/icons/logo.png" alt="IMG-LOGO">
            </a>

            <!-- Button show menu -->
            <div class="btn-show-menu">
                <!-- Header Icon mobile -->
                <div class="header-icons-mobile">
                    <a href="#" class="header-wrapicon1 dis-block">
                        <img src="images/icons/icon-header-01.png" class="header-icon1" alt="ICON">
                    </a>

                    <span class="linedivide2"></span>

                    <div class="header-wrapicon2">
                        <a href="cart.jsp"><img src="images/icons/icon-header-02.png" class="header-icon1 js-show-header-dropdown" alt="ICON">
                            <span class="header-icons-noti">0</span>
                        </a>
                        <!-- Header cart noti -->
                    </div>
                </div>

                <div class="btn-show-menu-mobile hamburger hamburger--squeeze">
                    <span class="hamburger-box">
                        <span class="hamburger-inner"></span>
                    </span>
                </div>
            </div>
        </div>

        <!-- Menu Mobile -->
        <!--This is for mobile menu when the size of the browser is reduced-->
        <div class="wrap-side-menu" >
            <nav class="side-menu">
                <ul class="main-menu">
                    <!-- <li class="item-topbar-mobile p-l-20 p-t-8 p-b-8">
                            <span class="topbar-child1">
                                    Free shipping for standard order over $100
                            </span>
                    </li> -->

                    <!-- <li class="item-topbar-mobile p-l-20 p-t-8 p-b-8">
                            <div class="topbar-child2-mobile">
                                    <span class="topbar-email">
                                            fashe@example.com
                                    </span>

                                    <div class="topbar-language rs1-select2">
                                            <select class="selection-1" name="time">
                                                    <option>USD</option>
                                                    <option>EUR</option>
                                            </select>
                                    </div>
                            </div>
                    </li> -->

                    <li class="item-topbar-mobile p-l-10">
                        <div class="topbar-social-mobile">
                            <a href="#" class="topbar-social-item fa fa-facebook"></a>
                            <a href="#" class="topbar-social-item fa fa-instagram"></a>
                            <a href="#" class="topbar-social-item fa fa-pinterest-p"></a>
                            <a href="#" class="topbar-social-item fa fa-snapchat-ghost"></a>
                            <a href="#" class="topbar-social-item fa fa-youtube-play"></a>
                        </div>
                    </li>

                    <li class="item-menu-mobile">
                        <a href="index.html">Home</a>

                    </li>

                    <li class="item-menu-mobile">
                        <a href="product.jsp">Shop</a>
                    </li>

                    <li class="item-menu-mobile">
                        <a href="about.jsp">About</a>
                    </li>

                    <li class="item-menu-mobile">
                        <a href="contact.jsp">Contact</a>
                    </li>
                </ul>
            </nav>
        </div>
    </header>
    <div class="col-sm-6 col-md-4 col-lg-3 p-b-50">
        <div class="leftbar p-r-20 p-r-0-sm">
            <form action="shop.jsp" method="get">
                <!--        <div class="row form-group">
                            <div class="col col-md-3"><label for="text-input" class=" form-control-label">Search</label></div>
                            <div class="search-form" color="red"><input type="text" id="text-input" name="search" placeholder="   search product" class="form-control mr-sm-2"></div>
                            <div class="search-form"><button><i class="fa fa-search"></i></button></div>
                        </div>-->

                <div class="search-product pos-relative bo4 of-hidden">
                    <input class="s-text7 size6 p-l-23 p-r-50" type="text" name="search-product" placeholder="Search Products...">

                    <button class="flex-c-m size5 ab-r-m color2 color0-hov trans-0-4">
                        <i class="fs-12 fa fa-search" aria-hidden="true"></i>
                    </button>
                </div>

            </form>
        </div>
    </div>