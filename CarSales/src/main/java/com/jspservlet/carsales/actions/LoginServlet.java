package com.jspservlet.carsales.actions;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        try {
            UserDAO userDAO = new UserDAO();
            String[] user = UserDAO.validateUser(username, password); 
            
            if (user != null && user[0].equals(role)) {
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                session.setAttribute("role", user[0]);  
                session.setAttribute("userId", user[1]);  

                if ("admin".equals(user[0])) {
                    response.sendRedirect(request.getContextPath() + "/AdminDashboard.jsp");
                } else if ("user".equals(user[0])) {
                    response.sendRedirect(request.getContextPath() + "/index.jsp");
                }
            } else {

                request.setAttribute("errorMessage", "Invalid username, password, or role.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("errorMessage", "An error occurred. Please try again.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            e.printStackTrace();
        }
    }
}