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
import org.onlinestore.controller.CustomerDAO;
import org.onlinestore.model.Customer;

/**
 *
 * @author CIT
 */
@WebServlet(name = "AddCustomer", urlPatterns = {"/AddCustomer"})
public class AddCustomer extends HttpServlet {

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
        //fetching the data from the customer.jsp lile
         String name = request.getParameter("name");
        String city = request.getParameter("city");
         String email = request.getParameter("email");
       Long  phone = Long.parseLong(request.getParameter("phone"));
       String country = request.getParameter("country");
         String address = request.getParameter("address");
        int postalcode = Integer.parseInt(request.getParameter("postalcode"));
        
        //creatting the Customer.java file of model class to set the value
        Customer ob = new Customer();
        ob.setName(name);
        ob.setCity(city);
        ob.setEmail(email);
        ob.setPhone(phone);
        ob.setCountry(country);
        ob.setAddress(address);
        ob.setPostalCode(postalcode);
        
        //setting the object of model class to the customerDAO in controller package
        CustomerDAO cDAO = new CustomerDAO();
        int val = cDAO.insertCustomer(ob);
        
        
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddCustomer</title>");            
            out.println("</head>");
            out.println("<body>");
            if(val>0)
            {
              out.println("<h1>Customer Added Successfully</h1>");  
            }else
            {
                out.println("<h1>Error Occured while adding customers</h1>");
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
