<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Car Sales System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: url('<%= request.getContextPath() %>/images/bg.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: 'Arial', sans-serif;
        }

        .login-card {
            background: #f5f5f5; 
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            margin: 50px auto;
        }

        .login-card h2 {
            text-align: center;
            margin-bottom: 20px;
            font-weight: 600;
            color: #333;
        }

        .form-label {
            font-weight: bold;
            color: #495057;
        }

        .btn {
            width: 100%;
            margin-top: 10px;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }

        .btn-warning {
            background-color: #ffc107;
            border-color: #ffc107;
        }

        .btn-primary:hover,
        .btn-warning:hover {
            opacity: 0.9;
        }

        .alert {
            font-size: 14px;
        }
     
    </style>
</head>
<body>
    <div class="container">
        <div class="login-card">
            <!-- Page Heading -->
            <h2>Login</h2>

            <!-- Display error message -->
            <%
                String errorMessage = (String) request.getAttribute("errorMessage");
                if (errorMessage != null) {
            %>
                <div class="alert alert-danger">
                    <%= errorMessage %>
                </div>
            <% } %>

            <!-- Login Form -->
            <form action="LoginServlet" method="post">
                <div class="mb-3">
                    <label for="username" class="form-label">Username</label>
                    <input type="text" name="username" class="form-control" id="username" placeholder="Enter your username" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" name="password" class="form-control" id="password" placeholder="Enter your password" required>
                </div>
                <!-- Buttons for user and admin login -->
                <button type="submit" class="btn btn-primary" name="role" value="user">User Login</button>
                <button type="submit" class="btn btn-warning" name="role" value="admin">Admin Login</button>
            </form>
        </div>
    </div>
</body>
</html>
