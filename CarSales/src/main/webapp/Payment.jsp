<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.jspservlet.carsales.db.DB" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment - Car Sales System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: url('<%= request.getContextPath() %>/images/bg.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: 'Arial', sans-serif;
            }
        

        .payment-container {
            max-width: 500px;
            margin: 80px auto;
            padding: 20px;
            background: rgba(255, 255, 255, 0.9); 
            border-radius: 10px;
            box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
        }

        .card-header {
            background-color: #007bff;
            color: white;
            font-size: 1.5rem;
            text-align: center;
            font-weight: bold;
        }

        .card-body {
            padding: 20px;
        }

        .btn-success {
            width: 100%;
            padding: 10px;
            font-size: 1.2rem;
        }

        .btn-success:hover {
            background-color: #28a745;
            border-color: #28a745;
            opacity: 0.9;
        }
        .btn-danger {
            width: 100%;
            padding: 10px;
            font-size: 1.2rem;
        }

        .btn-danger:hover {
            background-color: #FFCCCB;
            border-color: #FFCCCB;
            opacity: 0.9;
        }

        .card-title {
            font-size: 1.3rem;
            font-weight: bold;
            color: #333;
        }

        .card-text {
            font-size: 1.2rem;
            color: #555;
        }

        .alert-danger {
            margin-top: 10px;
        }
        
    </style>
</head>
<body>

<div class="container payment-container">
    <div class="card">
        <div class="card-header">
            Payment Details
        </div>
        <div class="card-body">
            <% 
                Integer carId = (Integer) request.getAttribute("carId");
                String carTitle = (String) request.getAttribute("carTitle");
                String carPrice = (String) request.getAttribute("carPrice");

                if (carTitle != null && carPrice != null) {
            %>
            <h5 class="card-title">Car Title: <%= carTitle %></h5>
            <p class="card-text">Price: ₹<%= carPrice %></p>
            
            <!-- Pay Now Form -->
            <form action="CompletePurchase" method="post">
                <input type="hidden" name="carId" value="<%= carId %>">
                <input type="hidden" name="price" value="<%= carPrice %>">
                <button type="submit" class="btn btn-success w-100 mb-3">Pay Now</button>
            </form>
            
            <!-- Cancel Button (Separate) -->
            <a href="index.jsp" class="btn btn-danger w-100">Cancel</a>

            <% 
                } else {
            %>
            <div class="alert alert-danger">
                <strong>Error:</strong> Car details not found. Please go back and try again.
            </div>
            <% } %>
        </div>
    </div>
</div>


</body>
</html>
