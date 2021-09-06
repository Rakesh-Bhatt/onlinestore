/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.onlinestore.view;

import com.sun.net.httpserver.Authenticator.Success;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.onlinestore.controller.CategoryDAO;
import org.onlinestore.model.Category;

/**
 *
 * @author CIT
 */

@WebServlet(name = "AddCategory", urlPatterns = {"/AddCategory"})
public class AddCategory extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        
        //Get The Value From Category From Web
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        int id = Integer.parseInt(request.getParameter("mid"));
        Category ob = new Category();
        ob.setName(name);
        ob.setDescription(description);    
        ob.setmID(id);
        CategoryDAO cDAO = new CategoryDAO();
        int val = cDAO.AddCategory(ob);
        
        //for updating 
        //CategoryDAO cDAO = new CategoryDAO();
        int update = cDAO.updateData(ob);
        
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
//            request.getRequestDispatcher("layout/head.jsp").include(request, response);
//            request.getRequestDispatcher("layout/navbar.jsp").include(request, response);
//            request.getRequestDispatcher("layout/footer.jsp").include(request, response);
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddCategory</title>");            
            out.println("</head>");
            out.println("<body>");
            if(val>0)
            {
//            out.println("<div class='sufee-alert alert with-close alert-primary alert-dismissible fade show'>"+
//                          "<span class='badge badge-pill badge-primary'>Success</span>"+
//                          "You successfully read this important alert."+
//                                        "<button type='button' class='close' data-dismiss='alert' aria-label='Close'>"+
//                                                "<span aria-hidden='true'>&times;</span>"+
//                                            "</button>"+
//                         "</div>");
            response.sendRedirect("viewCategory.jsp");
                out.println("<h1>Categroy inserted to the Database</h1>" ); 
            }
            else
            {
              out.println("<h1>Categroy can not inserted to the Database</h1>" );   
            }
            
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
