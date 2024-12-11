<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.jspservlet.carsales.db.DB" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Car - Car Sales</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
          rel="stylesheet" 
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
          crossorigin="anonymous">
    <style>
        body {
            background: url('<%= request.getContextPath() %>/images/bg.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: 'Arial', sans-serif;
        
}
        .container {
            margin-top: 30px;
        }

        .card {
            border: none;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            overflow: hidden;
        }

        .card-header {
            background-color: #007bff;
            color: #fff;
            padding: 15px;
            font-size: 1.25rem;
        }

        .card-body {
            padding: 20px;
        }

        .btn-primary {
            background-color: #007bff;
            border: none;
            font-weight: bold;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="card">
            <div class="card-header">
                Add Car
            </div>
            <div class="card-body">
                <form action="CarAdd" method="post" enctype="multipart/form-data">
                    <div class="mb-3">
                        <label for="title" class="form-label">Title</label>
                        <input type="text" class="form-control" name="title" id="title" placeholder="Enter car title" required>
                    </div>

                    <div class="mb-3">
                        <label for="description" class="form-label">Description</label>
                        <textarea class="form-control" name="description" id="description" rows="3" placeholder="Enter car description" required></textarea>
                    </div>

                    <div class="mb-3">
                        <label for="year" class="form-label">Year</label>
                        <input type="text" class="form-control" name="year" id="year" placeholder="Enter car year" required>
                    </div>

                    <div class="mb-3">
                        <label for="price" class="form-label">Price</label>
                        <input type="number" step="0.01" class="form-control" name="price" id="price" placeholder="Enter car price" required>
                    </div>

                    <div class="mb-3">
                        <label for="model" class="form-label">Model</label>
                        <select name="model_id" class="form-control" id="model" required>
                            <option value="" disabled selected>Select a model</option>
                            <% 
                                try (Connection conn = DB.getCon();
                                     PreparedStatement stmt = conn.prepareStatement("SELECT id, name FROM model");
                                     ResultSet rs = stmt.executeQuery()) {
                                    while (rs.next()) {
                                        out.println("<option value='" + rs.getInt("id") + "'>" + rs.getString("name") + "</option>");
                                    }
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                            %>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label for="member" class="form-label">Member</label>
                        <select name="member_id" class="form-control" id="member" required>
                            <option value="" disabled selected>Select a member</option>
                            <% 
                                try (Connection conn = DB.getCon();
                                     PreparedStatement stmt = conn.prepareStatement("SELECT id, name FROM member");
                                     ResultSet rs = stmt.executeQuery()) {
                                    while (rs.next()) {
                                        out.println("<option value='" + rs.getInt("id") + "'>" + rs.getString("name") + "</option>");
                                    }
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                            %>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label for="file" class="form-label">Car Image</label>
                        <input type="file" class="form-control" name="file" id="file" required>
                    </div>

                    <button type="submit" class="btn btn-primary mt-3">Save</button>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>
