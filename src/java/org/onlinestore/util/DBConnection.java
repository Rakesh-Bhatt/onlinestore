/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.onlinestore.util;

import com.mysql.jdbc.Connection;
import java.sql.*;

public class DBConnection {
    public static Connection getConnection()
    {
        final String username="root";
        final String password="";
        final String url="jdbc:mysql://localhost:3306/onlinestore";
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=(Connection) DriverManager.getConnection(url,username,password);
            return con;
        }
        catch(Exception ex)
        {
            System.out.println(ex); 
        }
        return null;
    }
    
}
