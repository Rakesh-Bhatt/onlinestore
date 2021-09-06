/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.onlinestore.view;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.onlinestore.controller.SupplierDAO;
import org.onlinestore.model.Supplier;

/**
 *
 * @author CIT
 */
@WebServlet(name = "AddSupplier", urlPatterns = {"/AddSupplier"})
public class AddSupplier extends HttpServlet {

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
        //fetching the data from the supplier.jsp file
        String sname = request.getParameter("sname");
        String cname = request.getParameter("cname");
        int id = Integer.parseInt(request.getParameter("productid"));
//passing the value too the model class
        Supplier ob = new Supplier();
        ob.setSuppliername(sname);
        ob.setCompanyname(cname);
        ob.setProductID(id);
//setting the value to the SupplierDAO class
        SupplierDAO sDAO = new SupplierDAO();
        int val = sDAO.insertSupplier(ob);

        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddSupplier</title>");
            out.println("</head>");
            out.println("<body>");
            if (val > 0) {
                 response.sendRedirect("viewSupplier.jsp");
                out.println("<h1>Supplier inserted to the Database</h1>");
            } else {
                out.println("<h1>Supplier can not inserted to the Database</h1>");
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
