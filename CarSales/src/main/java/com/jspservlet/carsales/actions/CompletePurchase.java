package com.jspservlet.carsales.actions;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jspservlet.carsales.db.DB;

@WebServlet("/CompletePurchase")
public class CompletePurchase extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("userId");

       
        System.out.println("User ID: " + userId);  
        if (userId == null) {
            response.sendRedirect("login.jsp");  
            return;
        }

        String carId = request.getParameter("carId");
        String price = request.getParameter("price");

        try {
            Connection conn = DB.getCon();
            String sql = "INSERT INTO purchase (user_id, car_id, price, purchase_date) VALUES (?, ?, ?, NOW())";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, userId);
            ps.setString(2, carId);
            ps.setString(3, price);
            ps.executeUpdate();

            response.sendRedirect("thankyou.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
