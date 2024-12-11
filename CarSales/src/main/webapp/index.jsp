<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.jspservlet.carsales.db.DB" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Car Sales</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" 
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
          crossorigin="anonymous">
    <style>
    
    body {
            background: url('<%= request.getContextPath() %>/images/bg.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: 'Arial', sans-serif;
         } 
        
        .jumbotron {
            background-color: #f8f9fa;
            padding: 30px;
            text-align: center;
            margin-bottom: 20px;
            border-radius: 5px;
        }
        .btn {
            margin: 5px;
        }
        .list-group {
            margin-top: 20px;
        }
        .card {
            margin: 10px 0;
        }
         
    </style>
</head>
<body>
    <div class="container">
        <%@ include file="WEB-INF/jspf/header.jsp" %>

    		<div class="row">
            <div class="col-md-3">
                <%@ include file="WEB-INF/jspf/slidebar.jsp" %>
            </div> 

            <div class="col-md-9">
                <div class="d-flex justify-content-end mb-3">
                    <input type="text" class="form-control me-2" placeholder="Search for cars...">
                    <button class="btn btn-info">SEARCH</button>
                </div>

 <div class="row">
                    <% 
                        try {
                            String sql = "SELECT id, title, description, year, price, image_path FROM car WHERE is_sold = FALSE";
                            Connection conn = DB.getCon();
                            Statement stmt = conn.createStatement();
                            ResultSet rs = stmt.executeQuery(sql);

                            while (rs.next()) {
                                int carId = rs.getInt("id");
                                String title = rs.getString("title");
                                String description = rs.getString("description");
                                String year = rs.getString("year");
                                String price = rs.getString("price");
                                String imagePath = rs.getString("image_path");
                    %>
                            <div class="col-md-4">
                                <div class="card" style="width: 18rem;">
                                    <% if (imagePath != null && !imagePath.trim().isEmpty()) { %>
                                        <img src="<%= request.getContextPath() %>/<%= imagePath %>" class="card-img-top" alt="Car Image">
                                    <% } else { %>
                                        <img src="<%= request.getContextPath() %>/images/no-image.png" class="card-img-top" alt="No Image Available">
                                    <% } %>
                                    <div class="card-body">
                                        <h5 class="card-title"><%= title %></h5>
                                        <p class="card-text"><b><%= year %></b></p>
                                        <p class="card-text">Price: ₹<%= price %></p>
                                        <form action="BuyNow" method="POST">
                                            <input type="hidden" name="carId" value="<%= carId %>">
                                            <button type="submit" class="btn btn-primary">Buy</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                    <% 
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
