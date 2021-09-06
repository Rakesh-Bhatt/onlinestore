package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.List;
import org.onlinestore.model.Product;
import org.onlinestore.controller.ProductDAO;
import org.onlinestore.util.DBConnection;
import java.sql.*;

public final class home_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "layout2/header.jsp", out, false);
      out.write('\n');
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "layout2/navbar.jsp", out, false);
      out.write("\n");
      out.write("<head>\n");
      out.write("    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("\n");
      out.write("\n");
      out.write("    <!-- Slide1 -->\n");
      out.write("    <!-- slide for the home page -->\n");
      out.write("    <!-- Our product -->\n");
      out.write("    <section class=\"bgwhite p-t-45 p-b-58\">\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <div class=\"sec-title p-b-22\">\n");
      out.write("                <h3 class=\"m-text5 t-center\">\n");
      out.write("                    Our Products\n");
      out.write("                </h3>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <!-- Tab01 -->\n");
      out.write("            <div class=\"tab01\">\n");
      out.write("                <!-- Nav tabs -->\n");
      out.write("                <ul class=\"nav nav-tabs\" role=\"tablist\">\n");
      out.write("                    <li class=\"nav-item\">\n");
      out.write("                        <a class=\"nav-link active\" data-toggle=\"tab\" href=\"#best-seller\" role=\"tab\">Best Seller</a>\n");
      out.write("                    </li>\n");
      out.write("                    <li class=\"nav-item\">\n");
      out.write("                        <a class=\"nav-link\" data-toggle=\"tab\" href=\"#featured\" role=\"tab\">Featured</a>\n");
      out.write("                    </li>\n");
      out.write("                    <li class=\"nav-item\">\n");
      out.write("                        <a class=\"nav-link\" data-toggle=\"tab\" href=\"#sale\" role=\"tab\">Sale</a>\n");
      out.write("                    </li>\n");
      out.write("                    <li class=\"nav-item\">\n");
      out.write("                        <a class=\"nav-link\" data-toggle=\"tab\" href=\"#top-rate\" role=\"tab\">Top Rate</a>\n");
      out.write("                    </li>\n");
      out.write("                </ul>\n");
      out.write("\n");
      out.write("                <!-- Tab panes -->\n");
      out.write("                <div class=\"tab-content p-t-35\">\n");
      out.write("                    <!-- for fetching the product form database -->\n");
      out.write("\n");
      out.write("                    <div class=\"tab-pane fade show active\" id=\"best-seller\" role=\"tabpanel\">\n");
      out.write("\n");
      out.write("                        <div class=\"row\">\n");
      out.write("                            ");

                                Connection con = DBConnection.getConnection();
                                ProductDAO pDAO = new ProductDAO();
                                List<Product> productlist = pDAO.fetchData();
                                for (Product p : productlist) {
                            
      out.write("\n");
      out.write("                            <div class=\"col-sm-6 col-md-4 col-lg-3 p-b-50\">\n");
      out.write("                                <!-- Block2 -->\n");
      out.write("                                <div class=\"block2\">\n");
      out.write("                                    <div class=\"block2-img wrap-pic-w of-hidden pos-relative block2-labelnew\">\n");
      out.write("                                        <a href=\"productDetail.jsp?id=");
      out.print(p.getProductID());
      out.write("\">\n");
      out.write("                                            <img src=\"images/");
      out.print(p.getImage());
      out.write("\" alt=\"IMG-PRODUCT\">\n");
      out.write("                                        </a>\n");
      out.write("                                        <div class=\"block2-overlay trans-0-4\">\n");
      out.write("                                            <a href=\"#\" class=\"block2-btn-addwishlist hov-pointer trans-0-4\">\n");
      out.write("                                                <i class=\"icon-wishlist icon_heart_alt\" aria-hidden=\"true\"></i>\n");
      out.write("                                                <i class=\"icon-wishlist icon_heart dis-none\" aria-hidden=\"true\"></i>\n");
      out.write("                                            </a>\n");
      out.write("\n");
      out.write("                                            <div class=\"block2-btn-addcart w-size1\">\n");
      out.write("                                                <!-- Button -->\n");
      out.write("                                                <button class=\"flex-c-m size1 bg4 bo-rad-23 hov1 s-text1 trans-0-4\">\n");
      out.write("                                                    <a href=\"productDetail.jsp?id=");
      out.print(p.getProductID());
      out.write("\">\n");
      out.write("                                                        BUY\n");
      out.write("                                                    </a>  \n");
      out.write("                                                </button>\n");
      out.write("                                            </div>\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                    </a>\n");
      out.write("                                    <div class=\"block2-txt p-t-20\">\n");
      out.write("                                        <a href=\"productDetail.jsp?id=");
      out.print(p.getProductID());
      out.write("\" class=\"block2-name dis-block s-text3 p-b-5\">\n");
      out.write("                                            ");
      out.print(p.getProductname());
      out.write(" \n");
      out.write("                                        </a>\n");
      out.write("\n");
      out.write("                                        <span class=\"block2-price m-text6 p-r-5\">\n");
      out.write("                                            ");
      out.print(p.getNewprice());
      out.write(" \n");
      out.write("                                        </span>\n");
      out.write("                                        <span class=\"block2-price m-text6 p-r-5\">\n");
      out.write("                                            <s>\n");
      out.write("                                                ");
      out.print(p.getOldprice());
      out.write(" \n");
      out.write("                                            </s>\n");
      out.write("                                        </span>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                            ");
}
      out.write(" \n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                    </div>\n");
      out.write("                    <!--  For Sale products- -->\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </section>\n");
      out.write("\n");
      out.write("\n");
      out.write("    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "layout2/footer.jsp", out, false);
      out.write("\n");
      out.write("</body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
