<%-- 
    Document   : test
    Created on : Nov 7, 2019, 9:19:23 PM
    Author     : CIT
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="org.onlinestore.util.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
           int a=10;
                    Connection con = DBConnection.getConnection();
                    String sql = "SELECT m.categoryName ,s.name FROM ((tbl_products as p INNER JOIN tbl_category as s ON p.subCategoryId = s.categoryID) INNER JOIN tbl_mcategory as m ON p.mainCategoryID = m.mID) WHERE p.productID=a";
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery(sql);
                %>
                <span class="s-text8">Categories:
                    <% while (rs.next()) {%>
                    <%=rs.getString(1)%> </span>
                <%}%>
    </body>
</html>
