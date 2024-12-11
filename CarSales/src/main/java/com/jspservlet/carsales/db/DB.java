package com.jspservlet.carsales.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DB {
    private static Connection con = null;

    public static Connection getCon() throws Exception {
        if (con == null || con.isClosed()) { 
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/carsalesystem"; 
            String user = "root";
            String password = "Archer@1234";
            con = DriverManager.getConnection(url, user, password);
        }
        return con; 
    }
}
