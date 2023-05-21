package com.weebtech.blog.dao;

import java.sql.*;

import com.weebtech.blog.entities.User;

public class UserDao {
    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }

    // Method for inserting user data to db
    public boolean saveUser(User user) {
        boolean flag = false;
        try {

            // user ----> db
            String query = "insert into user(name,email,password,gender,about) value(?,?,?,?,?)";

            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getGender());
            pstmt.setString(5, user.getAbout());

            pstmt.executeUpdate();
            flag = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }

}
