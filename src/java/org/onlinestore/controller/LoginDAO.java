/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.onlinestore.controller;

import java.sql.*;
//import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

//import org.sales.model.Product;
import java.sql.*;
import org.onlinestore.model.Login;
import org.onlinestore.util.DBConnection;

public class LoginDAO {

    public int verifyUser(Login ob) {

        int count = 0;
        try {
            Connection con = DBConnection.getConnection();
            String sql = "select * from tbl_admin where username=? and password=?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, ob.getUsername());
            st.setString(2, ob.getPassword());
            ResultSet rs = st.executeQuery();
            if (rs.next()) {

                count = rs.getInt("id");
            }

            con.close();
        } catch (SQLException ex) {
            System.out.println(ex);

        }
        return count;
    }
}
