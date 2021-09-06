/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.onlinestore.controller;

import java.sql.*;
import org.onlinestore.model.Order;
import java.sql.Connection;
import org.onlinestore.util.DBConnection;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author CIT
 */
public class OrderDAO {
public static int saveOrder(Order ob) {
        int count = 0;
        try {
            Connection con = DBConnection.getConnection();
            String sql = "insert into tbl_order (customerID,productID,quantity,orderDate,area,city,location,postalCode,phone,freight) values (?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setInt(1, ob.getCustomerID());
            pst.setInt(2, ob.getProductID());
            pst.setInt(3, ob.getQuantity());
            pst.setDate(4, new java.sql.Date(ob.getDate().getTime()));
            pst.setString(5, ob.getArea());
            pst.setString(6, ob.getCity());
            pst.setString(7, ob.getLocation());
            pst.setInt(8, ob.getPostalCode());
            pst.setLong(9, ob.getPhone());
            pst.setInt(10, ob.getFreight());
            count = pst.executeUpdate();
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return count;
    } 

 public List<Order> viewOrders() {
        List<Order> orderlist = new ArrayList();
        try {
            Connection con = DBConnection.getConnection();
            String sql = "select * from tbl_order";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                Order ob = new Order();
                ob.setOrderID(rs.getInt("orderID"));
                ob.setCustomerID(rs.getInt("customerID"));
                ob.setProductID(rs.getInt("productID"));
                ob.setQuantity(rs.getInt("quantity"));
                ob.setDate(rs.getDate("orderDate"));
                ob.setArea(rs.getString("area"));
                ob.setCity(rs.getString("city"));
                ob.setLocation(rs.getString("location"));
                ob.setPostalCode(rs.getInt("postalCode"));
                ob.setPhone(rs.getLong("phone"));
                ob.setFreight(rs.getInt("freight"));
                orderlist.add(ob);

            }
            con.close();

        } catch (Exception ex) {
            System.out.println(ex);
        }
        return orderlist;
    }
}
