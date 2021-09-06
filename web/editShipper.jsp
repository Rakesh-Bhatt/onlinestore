<%-- 
    Document   : editShipper
    Created on : Aug 10, 2019, 8:50:41 PM
    Author     : CIT
--%>
<%@page import="org.onlinestore.controller.ShipperDAO"%>
<%@page import="org.onlinestore.model.Shipper"%>
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
        Shipper ob =new Shipper();
//        ob.setBrandID(id);
    ob = ShipperDAO.fetchDataByID(id);
   
%>
<head>
    <script type="text/javascript">
            function validation()
            {
                var companyname = document.addshipper.companyname.value;
                var phone = document.addshipper.phone.value;
                var productid = document.addshipper.productid.value;
                
                //validation for company name
                if (companyname.trim() == "")
                {
                    alert('Enter  company name');
                    document.addshipper.companyname.focus();
                    return false;
                } else
                {
                    if (companyname.length < 8) {
                        alert('Company name should be minimum 8 character');
                        document.addshipper.companyname.focus();
                        return false;
                    }
                }
                /* Start validation for phone */
                var phonepattern = /^([0-9]{10})$/;
                if (phone.trim() == '') {
                    alert('Enter Phone');
                    document.addshipper.phone.focus();
                    return false;
                } else if (phone.length < 10) {
                    alert(' Phone should be 10 character');
                    document.addshipper.phone.focus();
                    return false;
                } else if (!phonepattern.test(phone)) {
                    alert('Phone Must be Number with 10 Digit');
                    document.addshipper.phone.focus();
                    return false;
                }
                //End the validation for phone
                /* Start validation for Product */ 
			if (document.addshipper.productid.selectedIndex == 0) {
				alert('Select Product');
				document.addshipper.productid.focus();
				return false;
			}
                        //End the validation for Product
            }
        </script>
</head>
<div class="col-lg-6">
    <div class="card">
        <div class="card-header">
            <strong>Add Shipper Form</strong>
        </div>
        <div class="card-body card-block">
            <form method="post" class="form-horizontal" action="UpdateShipper" onsubmit="return validation()" name="addshipper">
                <div class="row form-group">
                    <div class="col-12 col-md-9"><input type="hidden" id="text-input" name="id" placeholder="Company name" class="form-control" value="<%=ob.getShippingID()%>"></div>
                </div>
                <div class="row form-group">
                    <div class="col col-md-3"><label for="text-input" class=" form-control-label">Company Name</label></div>
                    <div class="col-12 col-md-9"><input type="text" id="text-input" name="companyname" placeholder="Company name" class="form-control" value="<%=ob.getCompanyname()%>"></div>
                </div>
                <div class="row form-group">
                    <div class="col col-md-3"><label for="text-input" class=" form-control-label">Phone</label></div>
                    <div class="col-12 col-md-9"><input type="text" id="text-input" name="phone" placeholder="phone number" class="form-control" value="<%=ob.getPhone()%>"></div>
                </div>
                <div class="row form-group">
                    <div class="col col-md-3"><label for="select" class=" form-control-label">Select</label></div>
                    <div class="col-12 col-md-9">
                        <select name="productid" id="select" class="form-control" value="<%=ob.getProductID()%>">
                            <option disabled=""  selected="">Select product</option>
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
