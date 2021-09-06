/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.onlinestore.controller;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import org.onlinestore.model.Cart;
import org.onlinestore.util.DBConnection;

/**
 *
 * @author CIT
 */
public class CartDAO {
    public int AddCart(Cart ob) {
        int count = 0;

        try {
            Connection con = DBConnection.getConnection();
            String sql = "insert into tbl_cart (productID,customerID,quantity,price) values (?,?,?,?)";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setInt(1, ob.getProductID());
            pst.setInt(2, ob.getCustomerID());
            pst.setInt(3, ob.getQuantity());
            pst.setDouble(4, ob.getPrice());
            count = pst.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return count;
    }
    public static int getQty(Cart ob) {
        int qty = 0;
        try {
            Connection con = DBConnection.getConnection();
            String sql = "select * from tbl_cart where productID = ? and customerID = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, ob.getProductID());
            st.setInt(2, ob.getCustomerID());
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                qty = rs.getInt("quantity");
            }
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return qty;
    }
     public static int updateCart(Cart ob) {
        int count = 0;
        try {
            Connection con = DBConnection.getConnection();
            String sql = "update tbl_cart set quantity = ? where productID = ? and customerID = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, ob.getQuantity());
            st.setInt(2, ob.getProductID());
            st.setInt(3, ob.getCustomerID());
            count = st.executeUpdate();
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return count;
    }
     public static List<Cart> cartByCustomer(int cid) {
        List<Cart> cList = new ArrayList();
        try {
            Connection con = DBConnection.getConnection();
            String sql = "SELECT p.image_path as image_path, p.productID as productID, p.product_name as name,p.new_price as price,c.quantity as quantity FROM tbl_cart as c INNER JOIN tbl_products as p ON p.productID=c.productID WHERE customerID=?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Cart ob = new Cart();
                ob.setProductName(rs.getString("name"));
                ob.setProductID(rs.getInt("productID"));
                ob.setQuantity(rs.getInt("quantity"));
                ob.setPrice(rs.getDouble("price"));
                ob.setImage(rs.getString("image_path"));
                cList.add(ob);
            }
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return cList;
    }
     //delete From cart
     public static int deleteFromCart(Cart ob)
    {
        int count=0;
        try
        {
           Connection con=DBConnection.getConnection();
           String sql="delete from tbl_cart where productID=? and customerID=?";
           PreparedStatement st=con.prepareStatement(sql);
           st.setInt(1,ob.getProductID());
           st.setInt(2, ob.getCustomerID());
          count= st.executeUpdate();
           con.close();
           
        }
        catch(Exception ex)
        {
            System.out.println(ex);
        }
        return count;
    }
      public static int removeCart(int cid)
    {
        int count=0;
        try
        {
           Connection con=DBConnection.getConnection();
           String sql="delete from tbl_cart where customerID=?";
           PreparedStatement st=con.prepareStatement(sql);
           st.setInt(2, cid);
          count= st.executeUpdate();
           con.close();
           
        }
        catch(Exception ex)
        {
            System.out.println(ex);
        }
        return count;
    }
    
}
