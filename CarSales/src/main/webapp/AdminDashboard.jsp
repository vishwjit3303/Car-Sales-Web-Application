<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="com.jspservlet.carsales.db.DB" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Car Sales</title>
    <!-- Bootstrap 5.0.2 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: url('<%= request.getContextPath() %>/images/bg.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: 'Arial', sans-serif;
            }
        

        .navbar {
            margin-bottom: 20px;
            background-color: #007bff !important;
        }

        .navbar-brand, .nav-link {
            color: #fff !important;
        }

        .sidebar {
            background: rgba(255, 255, 255, 0.9);
            padding: 20px;
            height: 100vh;
            border-radius: 10px;
            box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
        }

        .sidebar a {
            text-decoration: none;
            color: #000;
            padding: 10px;
            display: block;
            font-weight: bold;
            margin-bottom: 10px;
            border-radius: 5px;
        }

        .sidebar a:hover {
            background-color: #007bff;
            color: white;
        }

        .card {
            margin-bottom: 20px;
            border: none;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .card-img-top {
            height: 180px;
            object-fit: cover;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }

        .card-body {
            padding: 15px;
        }

        .card-title {
            font-size: 1.25rem;
            color: #333;
        }

        .card-text {
            font-size: 1rem;
            color: #555;
        }

        .search-bar {
            margin-bottom: 20px;
        }

        .btn-search {
            background-color: #007bff;
            color: white;
            font-weight: bold;
        }

        .btn-search:hover {
            background-color: #0056b3;
        }

        .car-list-section {
            margin-top: 30px;
        }
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Car Sales Admin</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" 
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="AdminDashboard">Dashboard</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="login.jsp">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <div class="col-md-3 sidebar">
                <h4 class="mb-4">Admin Menu</h4>
                <a href="brand.jsp">Add Brand</a>
                <a href="model.jsp">Add Model</a>
                <a href="car.jsp">Add Car</a>
                <a href="carlist.jsp">Car List</a>
                
            </div>

            <!-- Main Content Area -->
            <div class="col-md-9">
                <!-- Search Bar -->
                <div class="input-group mb-4 search-bar">
                    <input type="text" class="form-control" placeholder="Search for cars...">
                    <button class="btn btn-search">SEARCH</button>
                </div>

                <!-- Car Cards -->
                <div class="row">
                    <% 
                        try {
                            String sql = "SELECT id, title, description, year, price, image_path FROM car";
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
                            <div class="card">
                                <% if (imagePath != null && !imagePath.trim().isEmpty()) { %>
                                    <img src="<%= request.getContextPath() %>/<%= imagePath %>" class="card-img-top" alt="Car Image">
                                <% } else { %>
                                    <img src="<%= request.getContextPath() %>/images/no-image.png" class="card-img-top" alt="No Image Available">
                                <% } %>
                                <div class="card-body">
                                    <h5 class="card-title"><%= title %></h5>
                                    <p class="card-text"><strong>Year:</strong> <%= year %></p>
                                    <p class="card-text"><strong>Price:</strong> ₹<%= price %></p>
                                    <p class="card-text"><strong>Location:</strong> Pune</p>
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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
