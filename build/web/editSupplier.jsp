<%-- 
    Document   : editSupplier
    Created on : Aug 11, 2019, 10:43:02 AM
    Author     : CIT
--%>
<%@page import="org.onlinestore.controller.SupplierDAO"%>
<%@page import="org.onlinestore.model.Supplier"%>
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
<%
    int id= Integer.parseInt(request.getParameter("id"));
        Supplier ob =new Supplier();
    ob = SupplierDAO.fetchDataByID(id);
   
%>
<!--for value testing--> 
<%--<%=ob.getSupplierID()%>
<%=ob.getSuppliername()%>
<%=ob.getCompanyname()%>
<%=ob.getProductID()%>--%>
<head>
    <script type="text/javascript">
        function validation()
        {
            var sname = document.addsupplier.sname.value;
            var cname = document.addsupplier.cname.value;
            var productid = document.addsupplier.productid.value;
            //validation for supplier  name
            var namepattern = /^([a-z A-Z])+$/;
            if (sname.trim() == '') {
                alert('Enter Supplier name');
                document.addsupplier.sname.focus();
                return false;
            } else if (!namepattern.test(sname)) {
                alert('supplier name Must be in character Format');
                document.addsupplier.sname.focus();
                return false;
            } else if (sname.length < 3) {
                alert('supplier name should be minimum 3 character');
                document.addsupplier.sname.focus();
                return false;
            }
            /* end validation for name */
            //validation for company name
            var cnamepattern = /^([a-z A-Z])+$/;
            if (cname.trim() == '') {
                alert('Enter Company name');
                document.addsupplier.cname.focus();
                return false;
            } else if (!cnamepattern.test(cname)) {
                alert('Company name Must be in character Format');
                document.addsupplier.cname.focus();
                return false;
            } else if (cname.length < 3) {
                alert('Company name should be minimum 3 character');
                document.addsupplier.cname.focus();
                return false;
            }
                /* Start validation for Product */
                if (document.addsupplier.productid.selectedIndex == 0) {
                    alert('Select Product');
                    document.addsupplier.productid.focus();
                    return false;
                }
                //End the validation for Product

            }
    </script>

</head>
<div class="col-lg-6">
    <div class="card">
        <div class="card-header">
            <strong>Edit Supplier Form</strong>
        </div>
        <div class="card-body card-block">
            <form method="post" class="form-horizontal" action="UpdateSupplier" onsubmit="return validation()" name="addsupplier">
                 <div class="row form-group">
                    <div class="col-12 col-md-9"><input type="hidden" id="text-input" name="id" class="form-control" value="<%=ob.getSupplierID()%>"></div>
                </div>
                <div class="row form-group">
                    <div class="col col-md-3"><label for="text-input" class=" form-control-label">Supplier Name</label></div>
                    <div class="col-12 col-md-9"><input type="text" id="text-input" name="sname" placeholder="Supplier name" class="form-control" value="<%=ob.getSuppliername()%>"></div>
                </div>
                <div class="row form-group">
                    <div class="col col-md-3"><label for="text-input" class=" form-control-label">Company Name</label></div>
                    <div class="col-12 col-md-9"><input type="text" id="text-input" name="cname" placeholder="Company name" class="form-control" value="<%=ob.getCompanyname()%>"></div>
                </div>
                <div class="row form-group">
                    <div class="col col-md-3"><label for="select" class=" form-control-label">Select</label></div>
                    <div class="col-12 col-md-9">
                        <select name="productid" id="select" class="form-control">
                            <option disabled="" value="" selected="" value="<%=ob.getProductID()%>">Select product</option>
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
                    </div>
                </div>       

                <div class="card-footer">
                    <button type="submit" class="btn btn-primary btn-sm" name="submit">
                        <i class="fa fa-dot-circle-o"></i> Submit
                    </button>
                    <button type="reset" class="btn btn-danger btn-sm">
                        <i class="fa fa-ban"></i> Reset
                    </button>

                </div>
            </form>
        </div>
    </div>
</div>
<jsp:include page="layout/footer.jsp"/>