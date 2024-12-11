<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.jspservlet.carsales.db.DB" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Car List - Car Sales System</title>
    <!-- Bootstrap 5.3.0 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: url('<%= request.getContextPath() %>/images/bg.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: 'Arial', sans-serif;
	}
        .container {
            margin-top: 50px;
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.2);
        }

        h2 {
            font-weight: bold;
            color: #007bff;
            text-align: center;
            margin-bottom: 20px;
        }

        table {
            margin-top: 20px;
            border-radius: 10px;
            overflow: hidden;
            background: #f9f9f9;
        }

        th {
            background-color: #007bff;
            color: #fff;
            text-align: center;
        }

        td, th {
            padding: 12px;
            text-align: center;
            vertical-align: middle;
        }

        tbody tr:hover {
            background-color: #f1f1f1;
        }

        img {
            border-radius: 8px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        .btn-view {
            background-color: #007bff;
            color: #fff;
            font-weight: bold;
            border: none;
            padding: 5px 10px;
            border-radius: 5px;
            transition: all 0.3s ease-in-out;
        }

        .btn-view:hover {
            background-color: #0056b3;
            color: #fff;
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.3);
        }
        }
    </style>
</head>
<body>
    <div class="container">
    
    	<div class="text-end">
            <a href="AdminDashboard.jsp" class="btn btn-dashboard">Admin Dashboard</a>
        </div>
        
        <h2>Car Sales Inventory</h2>
        <table class="table table-bordered table-hover align-middle">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Title</th>
                    <th>Description</th>
                    <th>Year</th>
                    <th>Price</th>
                    <th>Image</th>
                    <th>Sold Or Not(1/0)</th>
                    
                </tr>
            </thead>
            <tbody>
                <% 
                    try {
                        String sql = "SELECT id, title, description, year, price, image_path, is_sold FROM car";
                        Connection conn = DB.getCon();
                        Statement stmt = conn.createStatement();
                        ResultSet rs = stmt.executeQuery(sql);

                        while (rs.next()) {
                            int id = rs.getInt("id");
                            String title = rs.getString("title");
                            String description = rs.getString("description");
                            String year = rs.getString("year");
                            String price = rs.getString("price");
                            String imagePath = rs.getString("image_path");
                            
                %>
                <tr>
                    <td><%= id %></td>
                    <td><%= title %></td>
                    <td><%= description %></td>
                    <td><%= year %></td>
                    <td>₹<%= price %></td>
                    <td>
                        <% if (imagePath != null && !imagePath.trim().isEmpty()) { %>
                            <img src="<%= request.getContextPath() %>/<%= imagePath %>" alt="Car Image" width="100" height="70">
                        <% } else { %>
                            <img src="<%= request.getContextPath() %>/images/no-image.png" alt="No Image Available" width="100" height="70">
                        <% } %>
                    </td>
                    
                </tr>
                <% 
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </tbody>
        </table>
    </div>
    <!-- Bootstrap Bundle JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
