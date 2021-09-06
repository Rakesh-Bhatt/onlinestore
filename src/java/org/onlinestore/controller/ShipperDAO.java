/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.onlinestore.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.onlinestore.model.Shipper;
import org.onlinestore.model.Supplier;
import org.onlinestore.util.DBConnection;

public class ShipperDAO {

    public int insertShipper(Shipper ob) {
        int count = 0;

        try {
            Connection con = DBConnection.getConnection();
            String sql = "insert into tbl_shipper (company_name,phone,productID) values (?,?,?)";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, ob.getCompanyname());
            pst.setLong(2, ob.getPhone());
            pst.setInt(3, ob.getProductID());
            count = pst.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return count;
    }
    //view Shipper
    public List<Shipper> fetchData()
    {
        List<Shipper> shipperlist=new ArrayList();
        try
        {
           Connection con=DBConnection.getConnection();
           String sql="select * from tbl_shipper";
           Statement st=con.createStatement();
           ResultSet rs=st.executeQuery(sql);
           while(rs.next())
           {
               Shipper ob=new Shipper();
               ob.setShippingID(rs.getInt("shippingID"));
               ob.setCompanyname(rs.getString("company_name"));
               ob.setPhone(rs.getLong("phone"));
               ob.setProductID(rs.getInt("productID"));
               shipperlist.add(ob);
               
           }
           con.close();
           
        }
        catch(Exception ex)
        {
            System.out.println(ex);
        } 
        return shipperlist;
    }
    //fetch by ID
   public static Shipper fetchDataByID(int id)
    {
      Shipper ob=new Shipper();
        try
        {
           Connection con=DBConnection.getConnection();
           String sql="select * from tbl_shipper where shippingID=?";
           PreparedStatement st=con.prepareStatement(sql);
           st.setInt(1, id);
           ResultSet rs=st.executeQuery();
           if(rs.next())
           {    
               ob.setShippingID(rs.getInt("shippingID"));
               ob.setCompanyname(rs.getString("company_name"));
               ob.setPhone(rs.getLong("phone"));
               ob.setProductID(rs.getInt("productID"));               
           }
           con.close(); 
        }
        catch(Exception ex)
        {
            System.out.println(ex);
        } 
        return ob;
    }
   public int updateData(Shipper ob)
    {
        int count=0;
        try
        {
           Connection con=DBConnection.getConnection();
           String sql="update tbl_shipper set company_name=?,phone=?,productID=? where shippingID=?";
           PreparedStatement st=con.prepareStatement(sql);
           st.setString(1,ob.getCompanyname());
           st.setLong(2,ob.getPhone());
           st.setInt(3,ob.getProductID());
           st.setInt(4,ob.getShippingID());
           count= st.executeUpdate();
           con.close();
           
        }
        catch(Exception ex)
        {
            System.out.println(ex);
        }
        return count;
    }
   //deleting Shipper
    public int deleteData(Shipper ob)
    {
        int count=0;
        try
        {
           Connection con=DBConnection.getConnection();
           String sql="delete from tbl_shipper where shippingID=?";
           PreparedStatement st=con.prepareStatement(sql);
           st.setInt(1,ob.getShippingID());
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
