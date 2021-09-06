<%-- 
    Document   : shipper
    Created on : Jul 24, 2019, 1:17:18 PM
    Author     : CIT
--%>
<%@page import="org.onlinestore.util.DBConnection"%>
<%@page import="java.sql.*;"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Information of commentor</title>
        <script type="text/javascript">
            function validation()
            {
                var name = document.formvalid.name.value;
                var email = document.formvalid.email.value;
                var comment = document.formvalid.comment.value;
                /* start validation for name */
                var namepattern = /^([a-z A-Z])+$/;
                if (name.trim() == '') {
                    alert('Enter name');
                    document.formvalid.name.focus();
                    return false;
                } else if (!namepattern.test(name)) {
                    alert('Name Must be in character Format');
                    document.formvalid.name.focus();
                    return false;
                } else if (name.length < 3) {
                    alert('Name should be minimum 3 character');
                    document.formvalid.name.focus();
                    return false;
                }
                /* end validation for name */
                /* Start validation for Email */
                var emailpattern = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
                if (email.trim() == '') {
                    alert('Enter Email');
                    document.formvalid.email.focus();
                    return false;
                } else if (!emailpattern.test(email)) {
                    alert('Email Must be Email Format');
                    document.formvalid.email.focus();
                    return false;
                }
                /* end validation for Email */
                
               
                /* start validation for comment */
                if (comment.trim() == '') {
                    alert('Enter comment');
                    document.formvalid.comment.focus();
                    return false;
                } else {
                    if (comment.length < 4) {
                        alert('comment should be minimum 4 character');
                        document.formvalid.comment.focus();
                        return false;
                    }
                }
                /* end validation for comment */
                
            }
        </script>
    </head>
    <body>
        <form action="AddComment" onsubmit="return validation()" name="formvalid">
            <label>Name</label>
            <input type="Text" name="name"/>
            <br>
            <label>Email</label>
            <input type="text" name="email">
            </br>
            <label>Comment</label>
            <input type="text" name="comment">
            </br>
            <label>Product</label>
            <select name="productid">
                <option disabled="" value="" selected="">Select product</option>
                <%
                    Connection con = DBConnection.getConnection();
                    String sql = "select * from tbl_products";
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery(sql);
                    while (rs.next()) {
                %>
                <option value="<%=rs.getInt("productID")%>"><%=rs.getString("product_name")%></option>
                <%}%>
            </select>
            <br>
            <input type="submit" name="submit" value="Save Data">		
        </form>
    </body>
</html>
