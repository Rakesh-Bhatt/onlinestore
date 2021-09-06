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
@WebServlet(name = "UpdateSupplier", urlPatterns = {"/UpdateSupplier"})
public class UpdateSupplier extends HttpServlet {

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
        
        int id=Integer.parseInt(request.getParameter("id"));
         String companyname = request.getParameter("cname");
         String suppliername = request.getParameter("sname");
          int id1=Integer.parseInt(request.getParameter("productid"));
         
        
        Supplier ob = new Supplier();
        ob.setSupplierID(id);
        ob.setCompanyname(companyname);
        ob.setSuppliername(suppliername);
        ob.setProductID(id1);
         
        SupplierDAO sDAO = new SupplierDAO();
        int val = sDAO.updateData(ob);
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateSupplier</title>");            
            out.println("</head>");
            out.println("<body>");
            out.print(ob.getSupplierID());
            out.print(ob.getCompanyname());
            out.print(ob.getSuppliername());
            out.print(ob.getProductID());
            out.print(val);
            if(val>0)
            {
                response.sendRedirect("viewSupplier.jsp");
            }else
            {
                out.println("<h1> Value can not updated</h1>");
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
