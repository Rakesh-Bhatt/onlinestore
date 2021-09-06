package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.Connection;
import org.onlinestore.util.DBConnection;
import java.util.List;
import org.onlinestore.model.Cart;
import org.onlinestore.controller.CartDAO;

public final class cart_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "layout2/header.jsp", out, false);
      out.write('\n');
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "layout2/navbar.jsp", out, false);
      out.write('\n');

    if (session.getAttribute("custUser") == null) {
        response.sendRedirect("emptyCart.jsp");
//request.getRequestDispatcher("loginform.jsp").include(request, response);
    }
    if (session.getAttribute("deleteSuccess") != null) {
        out.println(session.getAttribute("deleteSuccess"));
        session.removeAttribute("deleteSuccess");
    }

      out.write("\n");
      out.write("<!--session.getAttribute(\"successCart\")%>-->\n");
      out.write("\n");
      out.write("<!-- Cart -->\n");
      out.write("<section class=\"cart bgwhite p-t-70 p-b-100\">\n");
      out.write("    <form action=\"checkOut.jsp\" method=\"get\">\n");
      out.write("        <div class=\"container\">\n");
      out.write("\n");
      out.write("            <!-- Cart item -->\n");
      out.write("            ");

                String cid = "";
                int cust_id = 0;
                if (session.getAttribute("custID") != null) {
                    cid = session.getAttribute("custID").toString();
                    cust_id = Integer.parseInt(cid);
//                    out.println(cust_id);
                }
            
      out.write("\n");
      out.write("            <div class=\"container-table-cart pos-relative\">\n");
      out.write("                <div class=\"wrap-table-shopping-cart bgwhite\">\n");
      out.write("                    <table class=\"table-shopping-cart\">\n");
      out.write("                        <tr class=\"table-head\">\n");
      out.write("                            <th class=\"column-1\">Image</th>\n");
      out.write("                            <th class=\"column-2\">Product</th>\n");
      out.write("                            <th class=\"column-3\">Price</th>\n");
      out.write("                            <th class=\"column-4 p-l-70\">Quantity</th>\n");
      out.write("                            <th class=\"column-5\">Total</th>\n");
      out.write("                            <th class=\"column-6\">Remove</th>\n");
      out.write("                        </tr>\n");
      out.write("                        <tbody>\n");
      out.write("                            <!--<input type=\"hidden\" name=\"productName\" value=\"\">-->\n");
      out.write("\n");
      out.write("                            ");

                                double totalPrice = 0;
                                int i = 1;
                                CartDAO cDAO = new CartDAO();
                                List<Cart> cList = cDAO.cartByCustomer(cust_id);
                                for (Cart c : cList) {
                            
      out.write("\n");
      out.write("                        <input type=\"hidden\" name=\"productName");
      out.print(i);
      out.write("\" value=\"");
      out.print(c.getProductName());
      out.write("\">\n");
      out.write("                        <input type=\"hidden\" name=\"productID");
      out.print(i);
      out.write("\" value=\"");
      out.print(c.getProductID());
      out.write("\">\n");
      out.write("                        <input type=\"hidden\" name=\"quantity");
      out.print(i);
      out.write("\" value=\"");
      out.print(c.getQuantity());
      out.write("\">\n");
      out.write("                        <input type=\"hidden\" name=\"price");
      out.print(i);
      out.write("\" value=\"");
      out.print(c.getPrice());
      out.write("\">\n");
      out.write("                        <tr class=\"table-row\">\n");
      out.write("                            <td class=\"column-1\">\n");
      out.write("\n");
      out.write("                                <img src=\"images/");
      out.print(c.getImage());
      out.write("\" alt=\"IMG-PRODUCT\" height=\"100\" width=\"100\">\n");
      out.write("\n");
      out.write("                            </td>\n");
      out.write("                            <td class=\"column-2\">");
      out.print(c.getProductName());
      out.write("</td>\n");
      out.write("                            <td class=\"column-3\">");
      out.print(c.getPrice());
      out.write("</td>\n");
      out.write("                            <td class=\"column-4\">");
      out.print(c.getQuantity());
      out.write("</td>\n");
      out.write("                            <td class=\"column-5\">Rs.");
      out.print((c.getPrice() * c.getQuantity()));
      out.write("</td>\n");
      out.write("                            ");
 totalPrice += (c.getPrice() * c.getQuantity());
      out.write("\n");
      out.write("                            <td class=\"column-6\">\n");
      out.write("                                <a href=\"deleteFromCart.jsp?productID=");
      out.print(c.getProductID());
      out.write("&custID=");
      out.print(cust_id);
      out.write("\"><i class=\"fa fa-trash fa-2x\" aria-hidden=\"true\"></i></a>\n");
      out.write("                            </td>\n");
      out.write("                        </tr>\n");
      out.write("                        ");
i++;
                            }
      out.write("\n");
      out.write("                        </tbody>\n");
      out.write("                    </table>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <!--        <div class=\"flex-w flex-sb-m p-t-25 p-b-25 bo8 p-l-35 p-r-60 p-lr-15-sm\">\n");
      out.write("                        <div class=\"size10 trans-0-4 m-t-10 m-b-10\">\n");
      out.write("                             Button \n");
      out.write("                            <button class=\"flex-c-m sizefull bg1 bo-rad-23 hov1 s-text1 trans-0-4\">\n");
      out.write("                                Update Cart\n");
      out.write("                            </button>\n");
      out.write("                        </div>\n");
      out.write("                    </div>-->\n");
      out.write("\n");
      out.write("            <!-- Total -->\n");
      out.write("            <div class=\"bo9 w-size18 p-l-40 p-r-40 p-t-30 p-b-38 m-t-30 m-r-0 m-l-auto p-lr-15-sm\">\n");
      out.write("                <h5 class=\"m-text20 p-b-24\">\n");
      out.write("                    Order Summary\n");
      out.write("                </h5>\n");
      out.write("                ");

                    List<Cart> List = cDAO.cartByCustomer(cust_id);
                    for (Cart c : List) {
                
      out.write("\n");
      out.write("                <h3 class=\"m-text20 p-b-20\">\n");
      out.write("                    ");
      out.print(c.getProductName());
      out.write(" :  ");
      out.print(c.getQuantity());
      out.write(" * ");
      out.print(c.getPrice());
      out.write("\n");
      out.write("                    ");
}
      out.write("\n");
      out.write("                </h3>\n");
      out.write("                <!--  -->\n");
      out.write("                <div class=\"flex-w flex-sb-m p-b-12\">\n");
      out.write("                    <span class=\"s-text18 w-size19 w-full-sm\">\n");
      out.write("                        Subtotal:\n");
      out.write("                    </span>\n");
      out.write("                    <span class=\"m-text21 w-size20 w-full-sm\">\n");
      out.write("                        Rs.");
      out.print(totalPrice);
      out.write("\n");
      out.write("                    </span>\n");
      out.write("                </div>\n");
      out.write("                    <div class=\"flex-w flex-sb-m p-b-12\">\n");
      out.write("                    <span class=\"s-text18 w-size19 w-full-sm\">\n");
      out.write("                        Delivery:\n");
      out.write("                    </span>\n");
      out.write("                    <span class=\"m-text21 w-size20 w-full-sm\">\n");
      out.write("                        Rs.100\n");
      out.write("                    </span>\n");
      out.write("                </div>\n");
      out.write("                    <div class=\"flex-w flex-sb-m p-b-12\">\n");
      out.write("                    <span class=\"s-text18 w-size19 w-full-sm\">\n");
      out.write("                        Total:\n");
      out.write("                    </span>\n");
      out.write("                    <span class=\"m-text21 w-size20 w-full-sm\">\n");
      out.write("                        Rs.");
      out.print(totalPrice+100);
      out.write("\n");
      out.write("                    </span>\n");
      out.write("                </div>\n");
      out.write("   \n");
      out.write("\n");
      out.write("                <!--  -->\n");
      out.write("                <div class=\"flex-w flex-sb bo10 p-t-15 p-b-20\">\n");
      out.write("                    <!--                <span class=\"s-text18 w-size19 w-full-sm\">\n");
      out.write("                                        Shipping:\n");
      out.write("                                    </span>-->\n");
      out.write("\n");
      out.write("                    <div class=\"w-size20 w-full-sm\">\n");
      out.write("                        <!--                    <p class=\"s-text8 p-b-23\">\n");
      out.write("                                                There are no shipping methods available. Please double check your address, or contact us if you need any help.\n");
      out.write("                                            </p>-->\n");
      out.write("\n");
      out.write("                        <span class=\"s-text19\">\n");
      out.write("                            Delivery Information\n");
      out.write("                        </span>\n");
      out.write("                        <!--<div class=\"size13 bo4 m-b-12\">-->\n");
      out.write("                            <input class=\"sizefull s-text7 p-l-15 p-r-15\" type=\"hidden\" name=\"freight\" placeholder=\"Feight\" value=\"100\">\n");
      out.write("                        <!--</div>-->\n");
      out.write("                        <div class=\"size13 bo4 m-b-12\">\n");
      out.write("                            <input class=\"sizefull s-text7 p-l-15 p-r-15\" type=\"text\" name=\"area\" placeholder=\"Area\">\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"size13 bo4 m-b-12\">\n");
      out.write("                            <input class=\"sizefull s-text7 p-l-15 p-r-15\" type=\"text\" name=\"city\" placeholder=\"city\">\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"size13 bo4 m-b-12\">\n");
      out.write("                            <input class=\"sizefull s-text7 p-l-15 p-r-15\" type=\"text\" name=\"currentlocation\" placeholder=\"Enter your Current Location\">\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <div class=\"size13 bo4 m-b-22\">\n");
      out.write("                            <input class=\"sizefull s-text7 p-l-15 p-r-15\" type=\"text\" name=\"postcode\" placeholder=\"Postcode / Zip\">\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"size13 bo4 m-b-22\">\n");
      out.write("                            <input class=\"sizefull s-text7 p-l-15 p-r-15\" type=\"text\" name=\"phone\" placeholder=\"Phone number\">\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <!--                    <div class=\"size14 trans-0-4 m-b-10\">\n");
      out.write("                                                 Button \n");
      out.write("                                                <button class=\"flex-c-m sizefull bg1 bo-rad-23 hov1 s-text1 trans-0-4\">\n");
      out.write("                                                    Update Totals\n");
      out.write("                                                </button>\n");
      out.write("                                            </div>-->\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <!--  -->\n");
      out.write("                <div class=\"flex-w flex-sb-m p-t-26 p-b-30\">\n");
      out.write("                    <span class=\"m-text22 w-size19 w-full-sm\">\n");
      out.write("                        Total:\n");
      out.write("                    </span>\n");
      out.write("\n");
      out.write("                    <span class=\"m-text21 w-size20 w-full-sm\">\n");
      out.write("                        Rs.");
      out.print(totalPrice+100);
      out.write("\n");
      out.write("                    </span>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"size15 trans-0-4\">\n");
      out.write("                    <input type=\"hidden\" name=\"totalItem\" value=\"");
      out.print(i-1);
      out.write("\">\n");
      out.write("                    <!-- Button -->\n");
      out.write("                    <button type=\"submit\" class=\"flex-c-m sizefull bg1 bo-rad-23 hov1 s-text1 trans-0-4\">\n");
      out.write("                        Proceed to Checkout\n");
      out.write("                    </button>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </form>\n");
      out.write("</section>\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "layout2/footer.jsp", out, false);
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
