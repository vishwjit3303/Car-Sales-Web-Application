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


@WebServlet("/RegServlet")
public class RegServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        // Attempt to register user
        if (UserDAO.registerUser(name, username, email, password, role)) {
            response.sendRedirect("login.jsp");
        } else {
            request.setAttribute("errorMessage", "Registration failed. Username or email might already exist.");
            request.getRequestDispatcher("registration.jsp").forward(request, response);
        }
    }
}
