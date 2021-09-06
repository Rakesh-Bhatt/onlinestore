/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.onlinestore.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import org.onlinestore.model.Comment;
import org.onlinestore.util.DBConnection;

/**
 *
 * @author CIT
 */
public class CommentDAO {

    public int insertComment(Comment ob) {
        int count = 0;
        try {
            Connection con = DBConnection.getConnection();
            String sql = "insert into tbl_comments (name,email,comment,productID) values (?,?,?,?)";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1,ob.getName());
            pst.setString(2,ob.getEmail());
            pst.setString(3,ob.getComment());
            pst.setInt(4,ob.getProductID());
            count = pst.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return count;
    }

}
