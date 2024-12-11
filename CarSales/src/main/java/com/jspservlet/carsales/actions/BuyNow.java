package com.jspservlet.carsales.actions;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspservlet.carsales.db.DB;

@WebServlet("/BuyNow")
public class BuyNow extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String carId = request.getParameter("carId");

        try {
            Connection conn = DB.getCon();

            String updateSql = "UPDATE car SET is_sold = TRUE WHERE id = ?";
            PreparedStatement psUpdate = conn.prepareStatement(updateSql);
            psUpdate.setString(1, carId);

            int rowsAffected = psUpdate.executeUpdate();
            if (rowsAffected > 0) {
                String selectSql = "SELECT id, title, description, year, price, image_path FROM car WHERE id = ?";
                PreparedStatement psSelect = conn.prepareStatement(selectSql);
                psSelect.setString(1, carId);
                ResultSet rs = psSelect.executeQuery();

                if (rs.next()) {
                    request.setAttribute("carId", rs.getInt("id"));
                    request.setAttribute("carTitle", rs.getString("title"));
                    request.setAttribute("carPrice", rs.getString("price"));
                    request.setAttribute("carDescription", rs.getString("description"));
                    request.setAttribute("carImage", rs.getString("image_path"));


                    request.getRequestDispatcher("Payment.jsp").forward(request, response);
                }
            } else {
                response.sendRedirect("index.jsp?error=Car not found or already sold");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
