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


@WebServlet("/ModelServlet")
public class ModelServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String brandId = request.getParameter("id");
        String modelName = request.getParameter("name");
        try (Connection conn = DB.getCon()) {
            String sql = "INSERT INTO model (name, brand_id) VALUES (?, ?)";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, modelName);
                stmt.setInt(2, Integer.parseInt(brandId));
                stmt.executeUpdate();
                response.sendRedirect("AdminDashboard.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
