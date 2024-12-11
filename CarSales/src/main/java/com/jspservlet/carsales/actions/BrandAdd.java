package com.jspservlet.carsales.actions;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspservlet.carsales.db.DB;


@WebServlet("/BrandAdd")
public class BrandAdd extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String brandname = request.getParameter("name");
        try (Connection conn = DB.getCon()) {
            String sql = "INSERT INTO brand (name) VALUES (?)";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, brandname);
                stmt.executeUpdate();
                response.sendRedirect("AdminDashboard.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
