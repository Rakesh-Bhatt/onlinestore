/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.onlinestore.controller;

import java.sql.*;
import java.util.ArrayList;
import org.onlinestore.model.SignUp;
import org.onlinestore.util.DBConnection;

/**
 *
 * @author CIT
 */
public class SignUpDAO {

    public int AddCustomer(SignUp ob) {
        int count = 0;

        try {
            Connection con = DBConnection.getConnection();
            String sql = "insert into tbl_register (username,phone,email,password) values (?,?,?,?)";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, ob.getUsername());
            pst.setLong(2, ob.getPhone());
            pst.setString(3, ob.getEmail());
            pst.setString(4, ob.getPassword());

            count = pst.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return count;
    }

       public static int verifyUser(SignUp ob) {

        int count = 0;
        try {
            Connection con = DBConnection.getConnection();
            String sql = "select id, username, password from tbl_register where username=? and password=?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, ob.getUsername());
            st.setString(2, ob.getPassword());
            ResultSet rs = st.executeQuery();
            if (rs.next()) {

                count = 1;
                ob.setId(rs.getInt("id"));
            }

            con.close();
        } catch (Exception ex) {
            System.out.println(ex);

        }
        return count;
    }
}
