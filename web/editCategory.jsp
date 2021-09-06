<%-- 
    Document   : EditCategory
    Created on : Aug 6, 2019, 10:56:18 AM
    Author     : CIT
--%>
<%@page import="java.util.List"%>
<%@page import="org.onlinestore.model.Category"%>
<%@page import="org.onlinestore.controller.CategoryDAO"%>
<%@page import="org.onlinestore.util.DBConnection"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page import="java.sql.*"%>
<%
    int id= Integer.parseInt(request.getParameter("id"));
        Category ob =new Category();
//        ob.setBrandID(id);
    ob = CategoryDAO.fetchDataByID(id);
   
%>
<jsp:include page="layout/header.jsp"/>
<jsp:include page="layout/navbar.jsp"/>
<%
if(session.getAttribute("username")== null){  
             response.sendRedirect("loginform.jsp"); 
//request.getRequestDispatcher("loginform.jsp").include(request, response);
         }
%>
<head>
    <title> This is category</title>
    <script type="text/javascript">
        function validation()
        {
            var name = document.formvalid.name.value;
            var description = document.formvalid.description.value;
            var mid = document.formvalid.mid.value;
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

            /* start validation for description */
            if (description.trim() == '') {
                alert('Enter Description');
                document.formvalid.description.focus();
                return false;
            } else {
                if (description.length < 4) {
                    alert('Description should be minimum 4 character');
                    document.formvalid.description.focus();
                    return false;
                }
            }
            /* end validation for comment */
            /* Start validation for Product */ 
			if (document.formvalid.mid.selectedIndex == 0) {
				alert('Select Category');
				document.formvalid.mid.focus();
				return false;
			}
                        //End the validation for Product
        }
    </script>
</head>
<div class="col-lg-6">
    <div class="card">
        <div class="card-header">
            <strong>Edit Category Form</strong>
        </div>
        
        <div class="card-body card-block">
            <form method="post" class="form-horizontal" action="EditCategory" onsubmit="return validation()" name="formvalid">
                <div class="row form-group">
                    <!--<div class="col col-md-3"><label for="text-input" class=" form-control-label">Category ID</label></div>-->
                    <div class="col-12 col-md-9"><input type="hidden" id="text-input" name="id" class="form-control" value="<%=ob.getBrandID()%>"></div>
                </div>
                <div class="row form-group">
                    <div class="col col-md-3"><label for="text-input" class=" form-control-label">Category Name</label></div>
                    <div class="col-12 col-md-9"><input type="text" id="text-input" name="name" placeholder="Category name" class="form-control" value="<%=ob.getName()%>"></div>
                </div>

                <div class="row form-group">
                    <div class="col col-md-3"><label for="textarea-input" class=" form-control-label">Description</label></div>
                    <div class="col-12 col-md-9"><textarea name="description" id="textarea-input" rows="9" placeholder="Content..." class="form-control" ><%=ob.getDescription()%></textarea></div>
                </div>
                <div class="row form-group">
                    <div class="col col-md-3"><label for="select" class=" form-control-label">Select</label></div>
                    <div class="col-12 col-md-9">
                        <select name="mid" id="select" class="form-control">
                            <option disabled="" value="" selected="">Select Category</option>
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