package org.onlinestore.controller;

import java.sql.Connection;
import java.sql.*;
import org.onlinestore.model.Product;
import org.onlinestore.util.DBConnection;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Nabin
 */
public class ProductDAO {

    public int insertProduct(Product ob) {
        int count = 0;
        try {
            Connection con = DBConnection.getConnection();
            String sql = "insert into tbl_products(product_name,old_price,new_price,unitsInStock,description,mainCategoryID,subCategoryId,image_path)values(?,?,?,?,?,?,?,?)";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, ob.getProductname());
             pst.setDouble(2, ob.getOldprice());
            pst.setDouble(3, ob.getNewprice());
            pst.setInt(4, ob.getUnit());
            pst.setString(5, ob.getDescription());
            pst.setInt(6, ob.getMainCategoryID());
            pst.setInt(7, ob.getCategoryID());
            pst.setString(8, ob.getImage());
            count = pst.executeUpdate();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    //view Product
    public List<Product> fetchData() {
        List<Product> productlist = new ArrayList();
        try {
            Connection con = DBConnection.getConnection();
            String sql = "select * from tbl_products";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                Product ob = new Product();
                ob.setProductID(rs.getInt("productID"));
                ob.setProductname(rs.getString("product_name"));
                ob.setOldprice(rs.getDouble("old_price"));
                ob.setNewprice(rs.getDouble("new_price"));
                ob.setUnit(rs.getInt("unitsInStock"));
                ob.setDescription(rs.getString("description"));
                ob.setMainCategoryID(rs.getInt("mainCategoryID"));
                ob.setCategoryID(rs.getInt("subCategoryId"));
                ob.setImage(rs.getString("image_path"));

                productlist.add(ob);

            }
            con.close();

        } catch (Exception ex) {
            System.out.println(ex);
        }
        return productlist;
    }
    //fetch by ID

    public static Product fetchDataByID(int id) {
        Product ob = new Product();
        try {
            Connection con = DBConnection.getConnection();
            String sql = "select * from tbl_products where productID=?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                ob.setProductID(rs.getInt("productID"));
                ob.setProductname(rs.getString("product_name"));
                ob.setOldprice(rs.getDouble("old_price"));
                ob.setNewprice(rs.getDouble("new_price"));
                ob.setUnit(rs.getInt("unitsInStock"));
                ob.setDescription(rs.getString("description"));
                ob.setMainCategoryID(rs.getInt("mainCategoryID"));
                ob.setCategoryID(rs.getInt("subCategoryId"));
                ob.setImage(rs.getString("image_path"));
            }
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return ob;
    }
    public int updateData(Product ob)
    {
        int count=0;
        try
        {
           Connection con=DBConnection.getConnection();
           String sql="update tbl_products set product_name=?,old_price=?,new_price=?,unitsInStock=?,description=?,image_path=? where productID=?";
           PreparedStatement st=con.prepareStatement(sql);
                  
          
            st.setString(1, ob.getProductname());
            st.setDouble(2, ob.getOldprice());
            st.setDouble(3,ob.getNewprice());
            st.setInt(4, ob.getUnit());
            st.setString(5, ob.getDescription());
            st.setString(6, ob.getImage());
            st.setInt(7, ob.getProductID());
           count= st.executeUpdate();
           con.close();
           
        }
        catch(Exception ex)
        {
            System.out.println(ex);
        }
        return count;
    }
    //deleting product
    public static int deleteData(Product ob)
    {
        int count=0;
        try
        {
           Connection con=DBConnection.getConnection();
           String sql="delete from tbl_products where productID=?";
           PreparedStatement st=con.prepareStatement(sql);
           st.setInt(1,ob.getProductID());
          count= st.executeUpdate();
           con.close();
           
        }
        catch(Exception ex)
        {
            System.out.println(ex);
        }
        return count;
    }
    //for searching
    public List<Product> SearchByName(String name) {
        List<Product> searchlist = new ArrayList();
        try {
            Connection con = DBConnection.getConnection();
            String sql = "select * from tbl_products where product_name LIKE ? ";
            PreparedStatement pst = con.prepareStatement(sql);
             pst.setString(1, "%" + name + "%");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Product ob = new Product();
                ob.setProductID(rs.getInt("productID"));
                ob.setProductname(rs.getString("product_name"));
                ob.setOldprice(rs.getDouble("old_price"));
                ob.setNewprice(rs.getDouble("new_price"));
                ob.setUnit(rs.getInt("unitsInStock"));
                ob.setDescription(rs.getString("description"));
                ob.setMainCategoryID(rs.getInt("mainCategoryID"));
                ob.setCategoryID(rs.getInt("subCategoryId"));
                ob.setImage(rs.getString("image_path"));

                searchlist.add(ob);

            }
            con.close();

        } catch (Exception ex) {
            System.out.println(ex);
        }
        return searchlist;
    }
    //for quantity count
    public static int countQuantity()
    {
        int count=0;
        try
        {
           Connection con=DBConnection.getConnection();
           String sql="select count(*) from tbl_products where unitsInStock <=10";
          Statement st= con.createStatement();
          ResultSet rs = st.executeQuery(sql);
         while(rs.next()){
                count=rs.getInt("count(*)");
            }
           con.close();
           
        }
        catch(Exception ex)
        {
            System.out.println(ex);
        }
        return count;
    }
    //for quantity of the product <10
    public List<Product> fetchDataWithQuantity() {
        List<Product> productlist = new ArrayList();
        try {
            Connection con = DBConnection.getConnection();
            String sql = "select * from tbl_products where unitsInStock <=10";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                Product ob = new Product();
                ob.setProductID(rs.getInt("productID"));
                ob.setProductname(rs.getString("product_name"));
                ob.setOldprice(rs.getDouble("old_price"));
                ob.setNewprice(rs.getDouble("new_price"));
                ob.setUnit(rs.getInt("unitsInStock"));
                ob.setDescription(rs.getString("description"));
                ob.setMainCategoryID(rs.getInt("mainCategoryID"));
                ob.setCategoryID(rs.getInt("subCategoryId"));
                ob.setImage(rs.getString("image_path"));

                productlist.add(ob);

            }
            con.close();

        } catch (Exception ex) {
            System.out.println(ex);
        }
        return productlist;
    }
    public static int getQty(int pid) {
        int qty = 0;
        try {
            Connection con = DBConnection.getConnection();
            String sql = "select unitsInStock from tbl_products where productID = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, pid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                qty = rs.getInt("unitsInStock");
            }
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return qty;
    }
    public static int updateQuantity(int pid, int qty) {
        int count = 0;
        try {
            Connection con = DBConnection.getConnection();
            String sql = "update tbl_products set unitsInStock = ? where productID = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, qty);
            st.setInt(2, pid);
            count = st.executeUpdate();
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return count;
    }
    
}
