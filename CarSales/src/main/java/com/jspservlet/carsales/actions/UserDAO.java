package com.jspservlet.carsales.actions;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.jspservlet.carsales.db.DB;

public class UserDAO {

    public static boolean registerUser(String name, String username, String email, String password, String role) {
        boolean isRegistered = false;
        try (Connection conn = DB.getCon()) {
            String query = "INSERT INTO member (name, username, email, password, role) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, username);
            ps.setString(3, email);
            ps.setString(4, password);
            ps.setString(5, role);

            int rowsInserted = ps.executeUpdate();
            isRegistered = rowsInserted > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isRegistered;
    }


    public static String[] validateUser(String username, String password) throws Exception {
        String[] user = null;
        

        Connection conn = DB.getCon();
        String sql = "SELECT id, role FROM member WHERE username = ? AND password = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, username);
        ps.setString(2, password);
        ResultSet rs = ps.executeQuery();
        
        if (rs.next()) {

            user = new String[2];
            user[0] = rs.getString("role");  
            user[1] = rs.getString("id");    
        }

        return user;
    }


}
