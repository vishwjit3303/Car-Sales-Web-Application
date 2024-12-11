<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="com.jspservlet.carsales.db.DB" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .profile-card {
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        .profile-header {
            background-color: #007bff;
            color: white;
            padding: 30px 20px;
            text-align: center;
        }
        .profile-header h3 {
            margin-bottom: 0;
        }
        .profile-body {
            padding: 30px;
            background-color: white;
        }
        .profile-info p {
            font-size: 1.1rem;
            line-height: 1.6;
        }
        .btn-custom {
            background-color: #007bff;
            color: white;
        }
        .btn-custom:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<div class="container my-5">
    <div class="card profile-card">
        <div class="card-header profile-header">
            <h3>User Profile</h3>
        </div>

        <div class="card-body profile-body">
            <a href="index.jsp" class="btn btn-custom mb-3">Home</a>

            <% 
                HttpSession Session = request.getSession();
                String userId = (String) session.getAttribute("userId");

                if (userId == null || userId.isEmpty()) {
                    response.sendRedirect("login.jsp"); 
                    return;
                }

                try {
                    // Database connection
                    Connection conn = DB.getCon();
                    String sql = "SELECT * FROM member WHERE id = ?";
                    PreparedStatement ps = conn.prepareStatement(sql);
                    ps.setString(1, userId);  
                    ResultSet rs = ps.executeQuery();

                    if (rs.next()) {
            %>
                        <div class="profile-info">
                            <h5>Name: <strong><%= rs.getString("name") %></strong></h5>
                            <p><strong>Username:</strong> <%= rs.getString("username") %></p>
                            <p><strong>Email:</strong> <%= rs.getString("email") %></p>
                            <p><strong>Role:</strong> <%= rs.getString("role") %></p>
                        </div>
            <% 
                    } else {
                        out.println("<p>No profile found for this user.</p>");
                    }
                } catch (Exception e) {
                    out.println("<p>Error occurred: " + e.getMessage() + "</p>");
                    e.printStackTrace();
                }
            %>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
