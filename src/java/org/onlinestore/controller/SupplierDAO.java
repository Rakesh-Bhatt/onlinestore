/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.onlinestore.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.onlinestore.model.Category;
import org.onlinestore.model.Supplier;
import org.onlinestore.util.DBConnection;

public class SupplierDAO {

    public int insertSupplier(Supplier ob) {
        int count = 0;

        try {
            Connection con = DBConnection.getConnection();
            String sql = "insert into tbl_supplier (supplier_name,company_name,productID) values (?,?,?)";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, ob.getSuppliername());
            pst.setString(2, ob.getCompanyname());
            pst.setInt(3,ob.getProductID());
            count = pst.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return count;
    }
    //view Suppliers
    public List<Supplier> fetchData()
    {
        List<Supplier> supplierlist=new ArrayList();
        try
        {
           Connection con=DBConnection.getConnection();
           String sql="select * from tbl_supplier";
           Statement st=con.createStatement();
           ResultSet rs=st.executeQuery(sql);
           while(rs.next())
           {
               Supplier ob=new Supplier();
               ob.setSupplierID(rs.getInt("supplierID"));
               ob.setSuppliername(rs.getString("supplier_name"));
               ob.setCompanyname(rs.getString("company_name"));
               ob.setProductID(rs.getInt("productID"));
               supplierlist.add(ob);
               
           }
           con.close();
           
        }
        catch(Exception ex)
        {
            System.out.println(ex);
        } 
        return supplierlist;
    }
     //fetch by ID
   public static Supplier fetchDataByID(int id)
    {
      Supplier ob=new Supplier();
        try
        {
           Connection con=DBConnection.getConnection();
           String sql="select * from tbl_supplier where supplierID=?";
           PreparedStatement st=con.prepareStatement(sql);
           st.setInt(1, id);
           ResultSet rs=st.executeQuery();
           if(rs.next())
           {    
               ob.setSupplierID(rs.getInt("supplierID"));
               ob.setSuppliername(rs.getString("supplier_name"));
               ob.setCompanyname(rs.getString("company_name"));
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
   //for update
    public int updateData(Supplier ob)
    {
        int count=0;
        try
        {
           Connection con=DBConnection.getConnection();
           String sql="update tbl_supplier set supplier_name=?,company_name=?,productID=? where supplierID=?";
           PreparedStatement st=con.prepareStatement(sql);
           st.setString(1,ob.getSuppliername());
           st.setString(2,ob.getCompanyname());
           st.setInt(3,ob.getProductID());
           st.setInt(4,ob.getSupplierID());
           count= st.executeUpdate();
           con.close();
           
        }
        catch(Exception ex)
        {
            System.out.println(ex);
        }
        return count;
    }
    //deleting Supplier
    public int deleteData(Supplier ob)
    {
        int count=0;
        try
        {
           Connection con=DBConnection.getConnection();
           String sql="delete from tbl_supplier where supplierID=?";
           PreparedStatement st=con.prepareStatement(sql);
           st.setInt(1,ob.getSupplierID());
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
