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
import org.onlinestore.util.DBConnection;

public class CategoryDAO {

    public int AddCategory(Category ob) {
        int count = 0;

        try {
            Connection con = DBConnection.getConnection();
            String sql = "insert into tbl_category (name,description,mainID) values (?,?,?)";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, ob.getName());
            pst.setString(2, ob.getDescription());
            pst.setInt(3, ob.getmID());
            count = pst.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return count;
    }
    //view category
    public List<Category> fetchData()
    {
        List<Category> categorylist=new ArrayList();
        try
        {
           Connection con=DBConnection.getConnection();
           String sql="select * from tbl_category";
           Statement st=con.createStatement();
           ResultSet rs=st.executeQuery(sql);
           while(rs.next())
           {
               Category ob=new Category();
               ob.setBrandID(rs.getInt("categoryID"));
               ob.setName(rs.getString("name"));
               ob.setDescription(rs.getString("description"));
               ob.setmID(rs.getInt("mainID"));
               
               categorylist.add(ob);
               
           }
           con.close();
           
        }
        catch(Exception ex)
        {
            System.out.println(ex);
        } 
        return categorylist;
    }
    //fetch by ID
   public static Category fetchDataByID(int id)
    {
      Category ob=new Category();
        try
        {
           Connection con=DBConnection.getConnection();
           String sql="select * from tbl_category where categoryID=?";
           PreparedStatement st=con.prepareStatement(sql);
           st.setInt(1, id);
           ResultSet rs=st.executeQuery();
           if(rs.next())
           {    
               ob.setBrandID(rs.getInt("categoryID"));
               ob.setName(rs.getString("name"));
               ob.setDescription(rs.getString("description"));
               ob.setmID(rs.getInt("mainID"));
           }
           con.close(); 
        }
        catch(Exception ex)
        {
            System.out.println(ex);
        } 
        return ob;
    }
   //end of fetch by id
    public int updateData(Category ob)
    {
        int count=0;
        try
        {
           Connection con=DBConnection.getConnection();
           String sql="update tbl_category set name=?,description=?,mainID=? where categoryID=?";
           PreparedStatement st=con.prepareStatement(sql);
           st.setString(1,ob.getName());
           st.setString(2,ob.getDescription());
           st.setInt(3,ob.getmID());
           st.setInt(4,ob.getBrandID());
           
           count= st.executeUpdate();
           con.close();
           
        }
        catch(Exception ex)
        {
            System.out.println(ex);
        }
        return count;
    }
    //deleting category
    public int deleteData(Category ob)
    {
        int count=0;
        try
        {
           Connection con=DBConnection.getConnection();
           String sql="delete from tbl_category where categoryID=?";
           PreparedStatement st=con.prepareStatement(sql);
           st.setInt(1,ob.getBrandID());
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
