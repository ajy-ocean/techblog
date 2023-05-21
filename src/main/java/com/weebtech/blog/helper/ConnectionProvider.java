package com.weebtech.blog.helper;

// import statment
import java.sql.*;

public class ConnectionProvider {
    private static Connection con;

    public static Connection getConnection() {
        try {
            if (con == null) {
                // Driver Class loading.........
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Creating connection..........
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/weebtech", "blankocean", "blankocean@root");
            }
        }catch (Exception e) {
            e.printStackTrace();
        } 
        return con;
    }

}
