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
import org.onlinestore.controller.ShipperDAO;
import org.onlinestore.model.Shipper;

/**
 *
 * @author CIT
 */
@WebServlet(name = "AddShipper", urlPatterns = {"/AddShipper"})
public class AddShipper extends HttpServlet {

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
        
        String companyname = request.getParameter("companyname");
        Long  phone = Long.parseLong(request.getParameter("phone"));
        int id = Integer.parseInt(request.getParameter("productid"));
        
        Shipper ob = new Shipper();
        ob.setCompanyname(companyname);
        ob.setPhone(phone);
        ob.setProductID(id);
        //setting the object of shipper class to the insertShipper function of ShipperDAO in controller class
        ShipperDAO sDAO = new ShipperDAO();
        int val = sDAO.insertShipper(ob);
        
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddCategory</title>");            
            out.println("</head>");
            out.println("<body>");
           // out.println(id); //for checking the value of id
           //to check the insertion validity
            if(val>0)
            {
                response.sendRedirect("viewShipper.jsp");
             out.println("<h1>shipper inserted to the Database</h1>" );   
            }
            else
            {
              out.println("<h1>Shipper can not inserted to the Database</h1>" );   
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
