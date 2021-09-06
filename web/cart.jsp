<%-- 
    Document   : cart
    Created on : Oct 14, 2019, 8:38:53 PM
    Author     : CIT
--%>
<%@page import="java.sql.Connection"%>
<%@page import="org.onlinestore.util.DBConnection"%>
<%@page import="java.util.List"%>
<%@page import="org.onlinestore.model.Cart"%>
<%@page import="org.onlinestore.controller.CartDAO"%>
<jsp:include page="layout2/header.jsp"/>
<jsp:include page="layout2/navbar.jsp"/>

<script type="text/javascript">
    function validation() {
        var area = document.signup.area.value;
        var city = document.signup.city.value;
        var currentlocation = document.signup.currentlocation.value;
        var postcode = document.signup.postcode.value;
        var phone = document.signup.phone.value;
        /* start validation for area */
        var namepattern = /^([a-z A-Z])+$/;
        if (area.trim() == '') {
            alert('Enter Area');
            document.signup.area.focus();
            return false;
        } else if (!namepattern.test(area)) {
            alert('Area name Must be in character Format');
            document.signup.area.focus();
            return false;
        } else if (area.length < 3) {
            alert('Area should be minimum 3 character');
            document.signup.area.focus();
            return false;
        }
        //city
         var namepattern1 = /^([a-z A-Z])+$/;
        if (city.trim() == '') {
            alert('Enter city');
            document.signup.city.focus();
            return false;
        } else if (!namepattern1.test(city)) {
            alert('city name Must be in character Format');
            document.signup.city.focus();
            return false;
        } else if (city.length < 3) {
            alert('city should be minimum 3 character');
            document.signup.city.focus();
            return false;
        }
        //location
        var namepattern2 = /^([a-z A-Z 0-9])+$/;
        if (currentlocation.trim() == '') {
            alert('Enter currentlocation');
            document.signup.currentlocation.focus();
            return false;
        } else if (!namepattern2.test(currentlocation)) {
            alert('currentlocation name Must be in character Format');
            document.signup.currentlocation.focus();
            return false;
        } else if (currentlocation.length < 3) {
            alert('currentlocation should be minimum 3 character');
            document.signup.currentlocation.focus();
            return false;
        }
        //postalcode
         /* Start validation for phone */
        var postalpattern = /^([0-9])+$/;
        if (postcode.trim() == '') {
            alert('Enter postcode');
            document.signup.postcode.focus();
            return false;
        } else if (postcode.length < 3) {
            alert(' postcode should be more than 2');
            document.signup.postcode.focus();
            return false;
        } else if (!postalpattern.test(postcode)) {
            alert('postcode Must in number format');
            document.signup.postcode.focus();
            return false;
        }
        
        /* Start validation for phone */
        var phonepattern = /^([0-9]{10})$/;
        if (phone.trim() == '') {
            alert('Enter Phone');
            document.signup.phone.focus();
            return false;
        } else if (phone.length < 10) {
            alert(' Phone should be 10 character');
            document.signup.phone.focus();
            return false;
        } else if (!phonepattern.test(phone)) {
            alert('Phone Must be Number with 10 Digit');
            document.signup.phone.focus();
            return false;
        }
        /* end validation for Phone */
    }

</script>
<%
    if (session.getAttribute("custUser") == null) {
        response.sendRedirect("emptyCart.jsp");
//request.getRequestDispatcher("loginform.jsp").include(request, response);
    }
    if (session.getAttribute("deleteSuccess") != null) {
        out.println(session.getAttribute("deleteSuccess"));
        session.removeAttribute("deleteSuccess");
    }
%>
<!--session.getAttribute("successCart")%>-->

<!-- Cart -->
<section class="cart bgwhite p-t-70 p-b-100">
    <form action="checkOut.jsp" method="get" onsubmit="return validation()" name="signup" >
        <div class="container">

            <!-- Cart item -->
            <%
                String cid = "";
                int cust_id = 0;
                if (session.getAttribute("custID") != null) {
                    cid = session.getAttribute("custID").toString();
                    cust_id = Integer.parseInt(cid);
//                    out.println(cust_id);
                }
            %>
            <div class="container-table-cart pos-relative">
                <div class="wrap-table-shopping-cart bgwhite">
                    <table class="table-shopping-cart">
                        <tr class="table-head">
                            <th class="column-1">Image</th>
                            <th class="column-2">Product</th>
                            <th class="column-3">Price</th>
                            <th class="column-4 p-l-70">Quantity</th>
                            <th class="column-5">Total</th>
                            <th class="column-6">Remove</th>
                        </tr>
                        <tbody>
                            <!--<input type="hidden" name="productName" value="">-->

                            <%
                                double totalPrice = 0;
                                int i = 1;
                                CartDAO cDAO = new CartDAO();
                                List<Cart> cList = cDAO.cartByCustomer(cust_id);
                                for (Cart c : cList) {
                            %>
                        <input type="hidden" name="productName<%=i%>" value="<%=c.getProductName()%>">
                        <input type="hidden" name="productID<%=i%>" value="<%=c.getProductID()%>">
                        <input type="hidden" name="quantity<%=i%>" value="<%=c.getQuantity()%>">
                        <input type="hidden" name="price<%=i%>" value="<%=c.getPrice()%>">
                        <tr class="table-row">
                            <td class="column-1">

                                <img src="images/<%=c.getImage()%>" alt="IMG-PRODUCT" height="100" width="100">

                            </td>
                            <td class="column-2"><%=c.getProductName()%></td>
                            <td class="column-3"><%=c.getPrice()%></td>
                            <td class="column-4"><%=c.getQuantity()%></td>
                            <td class="column-5">Rs.<%=(c.getPrice() * c.getQuantity())%></td>
                            <% totalPrice += (c.getPrice() * c.getQuantity());%>
                            <td class="column-6">
                                <a href="deleteFromCart.jsp?productID=<%=c.getProductID()%>&custID=<%=cust_id%>"><i class="fa fa-trash fa-2x" aria-hidden="true"></i></a>
                            </td>
                        </tr>
                        <%i++;
                            }%>
                        </tbody>
                    </table>
                </div>
            </div>
            <!--        <div class="flex-w flex-sb-m p-t-25 p-b-25 bo8 p-l-35 p-r-60 p-lr-15-sm">
                        <div class="size10 trans-0-4 m-t-10 m-b-10">
                             Button 
                            <button class="flex-c-m sizefull bg1 bo-rad-23 hov1 s-text1 trans-0-4">
                                Update Cart
                            </button>
                        </div>
                    </div>-->

            <!-- Total -->
            <div class="bo9 w-size18 p-l-40 p-r-40 p-t-30 p-b-38 m-t-30 m-r-0 m-l-auto p-lr-15-sm">
                <h5 class="m-text20 p-b-24">
                    Order Summary
                </h5>
                <%
                    List<Cart> List = cDAO.cartByCustomer(cust_id);
                    for (Cart c : List) {
                %>
                <h3 class="m-text20 p-b-20">
                    <%=c.getProductName()%> :  <%=c.getQuantity()%> * <%=c.getPrice()%>
                    <%}%>
                </h3>
                <!--  -->
                <div class="flex-w flex-sb-m p-b-12">
                    <span class="s-text18 w-size19 w-full-sm">
                        Subtotal:
                    </span>
                    <span class="m-text21 w-size20 w-full-sm">
                        Rs.<%=totalPrice%>
                    </span>
                </div>
                    <div class="flex-w flex-sb-m p-b-12">
                    <span class="s-text18 w-size19 w-full-sm">
                        Delivery:
                    </span>
                    <span class="m-text21 w-size20 w-full-sm">
                        Rs.100
                    </span>
                </div>
                    <div class="flex-w flex-sb-m p-b-12">
                    <span class="s-text18 w-size19 w-full-sm">
                        Total:
                    </span>
                    <span class="m-text21 w-size20 w-full-sm">
                        Rs.<%=totalPrice+100%>
                    </span>
                </div>
   

                <!--  -->
                <div class="flex-w flex-sb bo10 p-t-15 p-b-20">
                    <!--                <span class="s-text18 w-size19 w-full-sm">
                                        Shipping:
                                    </span>-->

                    <div class="w-size20 w-full-sm">
                        <!--                    <p class="s-text8 p-b-23">
                                                There are no shipping methods available. Please double check your address, or contact us if you need any help.
                                            </p>-->

                        <span class="s-text19">
                            Delivery Information
                        </span>
                        <!--<div class="size13 bo4 m-b-12">-->
                            <input class="sizefull s-text7 p-l-15 p-r-15" type="hidden" name="freight" placeholder="Feight" value="100">
                        <!--</div>-->
                        <div class="size13 bo4 m-b-12">
                            <input class="sizefull s-text7 p-l-15 p-r-15" type="text" name="area" placeholder="Area">
                        </div>
                        <div class="size13 bo4 m-b-12">
                            <input class="sizefull s-text7 p-l-15 p-r-15" type="text" name="city" placeholder="city">
                        </div>
                        <div class="size13 bo4 m-b-12">
                            <input class="sizefull s-text7 p-l-15 p-r-15" type="text" name="currentlocation" placeholder="Enter your Current Location">
                        </div>

                        <div class="size13 bo4 m-b-22">
                            <input class="sizefull s-text7 p-l-15 p-r-15" type="text" name="postcode" placeholder="Postcode / Zip">
                        </div>
                        <div class="size13 bo4 m-b-22">
                            <input class="sizefull s-text7 p-l-15 p-r-15" type="text" name="phone" placeholder="Phone number">
                        </div>

                        <!--                    <div class="size14 trans-0-4 m-b-10">
                                                 Button 
                                                <button class="flex-c-m sizefull bg1 bo-rad-23 hov1 s-text1 trans-0-4">
                                                    Update Totals
                                                </button>
                                            </div>-->
                    </div>
                </div>

                <!--  -->
                <div class="flex-w flex-sb-m p-t-26 p-b-30">
                    <span class="m-text22 w-size19 w-full-sm">
                        Total:
                    </span>

                    <span class="m-text21 w-size20 w-full-sm">
                        Rs.<%=totalPrice+100%>
                    </span>
                </div>

                <div class="size15 trans-0-4">
                    <input type="hidden" name="totalItem" value="<%=i-1%>">
                    <!-- Button -->
                    <button type="submit" class="flex-c-m sizefull bg1 bo-rad-23 hov1 s-text1 trans-0-4">
                        Proceed to Checkout
                    </button>
                </div>
            </div>
        </div>
    </form>
</section>
<jsp:include page="layout2/footer.jsp"/>