<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration - Car Sales System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: url('<%= request.getContextPath() %>/images/bg.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: 'Arial', sans-serif;
            }
       

        .registration-container {
            background: rgba(255, 255, 255);
            padding: 40px 30px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            margin: 50px auto;
        }

        .registration-container h3 {
            font-weight: 600;
            color: #343a40;
            margin-bottom: 20px;
        }

        .form-control {
            border-radius: 5px;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            font-size: 16px;
            font-weight: bold;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }

        .form-label {
            font-weight: 500;
            color: #495057;
        }

        .text-link {
            font-size: 14px;
            color: #007bff;
            text-decoration: none;
        }

        .text-link:hover {
            text-decoration: underline;
        }

        .heading {
            text-align: center;
            color: #ffffff;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.7);
            margin-top: 30px;
            margin-bottom: 20px;
            font-size: 32px;
            font-weight: 700;
        }
        }
    </style>
</head>
<body>

    <div class="heading">Car Sales System</div>

    <div class="container">
        <div class="registration-container">
            <h3 class="text-center">Create an Account</h3>
            <form action="RegServlet" method="post">
                <div class="mb-3">
                    <label for="name" class="form-label">Full Name</label>
                    <input type="text" name="name" class="form-control" id="name" placeholder="Enter your full name" required>
                </div>
                <div class="mb-3">
                    <label for="username" class="form-label">Username</label>
                    <input type="text" name="username" class="form-control" id="username" placeholder="Choose a username" required>
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" name="email" class="form-control" id="email" placeholder="Enter your email address" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" name="password" class="form-control" id="password" placeholder="Create a password" required>
                </div>
                <div class="mb-3">
                    <label for="role" class="form-label">Role</label>
                    <select name="role" class="form-select" id="role" required>
                        <option value="" disabled selected>Select your role</option>
                        <option value="user">User</option>
                        <option value="admin">Admin</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary btn-block w-100">Register</button>
                <div class="text-center mt-3">
                    <a href="login.jsp" class="text-link">Already have an account? Login here.</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
