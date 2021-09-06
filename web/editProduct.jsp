<%-- 
    Document   : EditProduct
    Created on : Aug 3, 2019, 8:06:42 PM
    Author     : CIT
--%>
<%@page import="org.onlinestore.controller.ProductDAO"%>
<%@page import="org.onlinestore.model.Product"%>
<%@page import="java.sql.*;"%>
<%@page import="org.onlinestore.util.DBConnection"%>
<jsp:include page="layout/header.jsp"/>
<jsp:include page="layout/navbar.jsp"/>
<%
    int id= Integer.parseInt(request.getParameter("id"));
        Product ob =new Product();
//        ob.setBrandID(id);
    ob = ProductDAO.fetchDataByID(id);
   
%>
<%
if(session.getAttribute("username")== null){  
             response.sendRedirect("loginform.jsp"); 
//request.getRequestDispatcher("loginform.jsp").include(request, response);
         }
%>
<head>
    <script type="text/javascript">
        function validation()
        {
            var productname = document.signup.productname.value;
            var oldprice = document.signup.oldprice.value;
            var newprice = document.signup.newprice.value;
            var unit = document.signup.unit.value;
            var description = document.signup.description.value;
            var maincategory = document.signup.maincategory.value;
            var subcategory = document.signup.maincategory.value;
            var image = document.signup.image.value;

            //validation for supplier  name
            var namepattern = /^([a-z A-Z])+$/;
            if (productname.trim() == '') {
                alert('Enter product name');
                document.signup.productname.focus();
                return false;
            } else if (!namepattern.test(productname)) {
                alert('product name Must be in character Format');
                document.signup.productname.focus();
                return false;
            } else if (productname.length < 3) {
                alert('product name should be minimum 3 character');
                document.signup.productname.focus();
                return false;
            }
            /* end validation for name */
            /* validation for old price */
            var oldpriceparttern = /^([0-9])+$/;
            if (oldprice.trim() == '') {
                alert('Enter old price');
                document.signup.oldprice.focus();
                return false;
            } else if (oldprice < 0) {
                alert(' oldprice should positive');
                document.signup.oldprice.focus();
                return false;
            } else if (!oldpriceparttern.test(oldprice)) {
                alert('oldprice Must be Number in number');
                document.signup.oldprice.focus();
                return false;
            }
            /* validation for new price */
            var newpriceparttern = /^([0-9])+$/;
            if (newprice.trim() == '') {
                alert('Enter new price ');
                document.signup.newprice.focus();
                return false;
            } else if (newprice < 0) {
                alert(' newprice should positive');
                document.signup.newprice.focus();
                return false;
            } else if (!newpriceparttern.test(newprice)) {
                alert('newprice Must be Number in number');
                document.signup.newprice.focus();
                return false;
            }
            /* validation for unit */
            var unitPattern = /^([0-9])+$/;
            if (unit.trim() == '') {
                alert('Enter unit ');
                document.signup.unit.focus();
                return false;
            } else if (unit < 0) {
                alert(' unit should positive');
                document.signup.unit.focus();
                return false;
            } else if (!unitPattern.test(unit)) {
                alert('unit Must be Number in number');
                document.signup.unit.focus();
                return false;
            }

            //validation for description
            var descriptionpattern = /^([a-z A-Z])+$/;
            if (description.trim() == '') {
                alert('Enter description name');
                document.signup.description.focus();
                return false;
            } else if (!descriptionpattern.test(description)) {
                alert('Company name Must be in character Format');
                document.signup.description.focus();
                return false;
            } else if (description.length < 3) {
                alert('Company name should be minimum 3 character');
                document.signup.description.focus();
                return false;
            }
            /* Start validation for maincategory */
            if (document.signup.maincategory.selectedIndex == 0) {
                alert('Select main category');
                document.signup.maincategory.focus();
                return false;
            }
            //End the validation for Product
//             Start validation for subcategory * /
                    if (document.signup.subcategory.selectedIndex == 0) {
                alert('Select sub category');
                document.signup.subcategory.focus();
                return false;
            }
            //End the validation for Product
            var formData = new FormData();

            var file = document.getElementById("file-input").files[0];

            formData.append("Filedata", file);
            var t = file.type.split('/').pop().toLowerCase();
            if (t != "jpeg" && t != "jpg" && t != "png" && t != "bmp" && t != "gif") {
                alert('Please select a valid image file');
                document.getElementById("file-input").value = '';
                return false;
            }
            if (file.size > 1024000) {
                alert('Max Upload size is 1MB only');
                document.getElementById("file-input").value = '';
                return false;
            }
        }
    </script>

</head>
<div class="col-lg-6">
    <div class="card">
        <div class="card-header">
            <strong>Edit Product Form</strong>
        </div>
        <div class="card-body card-block">
            <form class="form-horizontal" action="UpdateProduct" method="post" enctype="multipart/form-data" onsubmit="return validation()" name="signup">
                <div class="row form-group">
                    <!--<div class="col col-md-3"><label for="text-input" class=" form-control-label">Category ID</label></div>-->
                    <div class="col-12 col-md-9"><input type="hidden" id="text-input" name="id" class="form-control" value="<%=ob.getProductID()%>"></div>
                </div>
                <div class="row form-group">
                    <div class="col col-md-3"><label for="text-input" class=" form-control-label">Product Name</label></div>
                    <div class="col-12 col-md-9"><input type="text" id="text-input" name="productname" placeholder="Product name" value="<%=ob.getProductname()%>" class="form-control"></div>
                </div>
                <div class="row form-group">
                    <div class="col col-md-3"><label for="text-input" class=" form-control-label">Old Price</label></div>
                    <div class="col-12 col-md-9"><input type="text" id="text-input" name="oldprice" placeholder="old price here" value="<%=ob.getOldprice()%>" class="form-control"></div>
                </div>
                <div class="row form-group">
                    <div class="col col-md-3"><label for="text-input" class=" form-control-label">New Price</label></div>
                    <div class="col-12 col-md-9"><input type="text" id="text-input" name="newprice" placeholder="new price here " value="<%=ob.getNewprice()%>" class="form-control"></div>
                </div>
                <div class="row form-group">
                    <div class="col col-md-3"><label for="text-input" class=" form-control-label">Unit In Stock</label></div>
                    <div class="col-12 col-md-9"><input type="text" id="text-input" name="unit" placeholder="Unit In Stock" value="<%=ob.getUnit()%>" class="form-control"></div>
                </div>
                <div class="row form-group">
                    <div class="col col-md-3"><label for="text-input" class=" form-control-label">Description</label></div>
                    <div class="col-12 col-md-9"><input type="text" id="text-input" name="description" placeholder="description" value="<%=ob.getDescription()%>" class="form-control"></div>
                </div>

                <div class="row form-group">
                    <div class="col col-md-3"><label for="select" class=" form-control-label">Main Category</label></div>
                    <div class="col-12 col-md-9">
                        <select name="maincategory" id="select" class="form-control">
                            <option disabled="" value="" selected="">Select Main-Category</option>
                            <%
                                Connection con = DBConnection.getConnection();
                                String sql = "select * from tbl_mcategory";
                                Statement st = con.createStatement();
                                ResultSet rs = st.executeQuery(sql);
                                while (rs.next()) {
                            %>
                            <option value="<%=rs.getInt("mID")%>"><%=rs.getString("categoryName")%></option>
                            <%}%>
                        </select>
                    </div>
                </div>    


                <div class="row form-group">
                    <div class="col col-md-3"><label for="select" class=" form-control-label">Sub Category</label></div>
                    <div class="col-12 col-md-9">
                        <select name="subcategory" id="select" class="form-control">
                            <option disabled="" value="" selected="">Select Sub-Category</option>
                            <%
                                String sql1 = "select * from tbl_category";
                                Statement st1 = con.createStatement();
                                ResultSet rs1 = st1.executeQuery(sql1);
                                while (rs1.next()) {
                            %>
                            <option value="<%=rs1.getInt("categoryID")%>"><%=rs1.getString("name")%></option>
                            <%}%>
                        </select>
                    </div>
                </div>       
                <div class="row form-group">
                    <div class="col col-md-3"><label for="file-input" class=" form-control-label">Image</label></div>
                    <div class="col-12 col-md-9"><input type="file" id="file-input" name="image" value="images/<%=ob.getImage()%>" class="form-control-file"></div>
                </div>     

                <div class="card-footer">
                    <button type="submit" class="btn btn-primary btn-sm" name="submit">
                        <i class="fa fa-dot-circle-o"></i> Update
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