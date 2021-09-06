<%-- 
    Document   : test1
    Created on : Nov 17, 2019, 5:33:19 PM
    Author     : CIT
--%>

<form method="get">
    <input type="number" name="qty"/>
    <%=request.getParameter("qty")%>
    <button type="submit">submit</button>
</form>
