<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet" %>
<%@ page import="com.jspservlet.carsales.db.DB" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Car Sales</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<style>
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
            <h2>Brand List</h2>
            <hr>
            
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th scope="col">Id</th>
                        <th scope="col">Brand Name</th>
                        <th scope="col">Option</th>
                    </tr>
                </thead>
                <tbody>
                <%
					    Connection con = null;
					    PreparedStatement stmt = null;
					    ResultSet rs = null;
					    try {
					        con = DB.getCon();
					        if (con == null || con.isClosed()) {
					            throw new Exception("Database connection is not available.");
					        }
					
					        String sql = "SELECT * FROM brand";
					        stmt = con.prepareStatement(sql);
					        rs = stmt.executeQuery();
					        while (rs.next()) {
					%>
					    <tr>
					        <td><%= rs.getInt("id") %></td>
					        <td><%= rs.getString("name") %></td>
					        <td>
					            <div class="btn-group">
					                <a href="show.jsp?id=<%= rs.getInt("id") %>" class="btn btn-success">Show</a>
					                <a href="edit.jsp?id=<%= rs.getInt("id") %>" class="btn btn-warning">Edit</a>
					                <a href="delete.jsp?id=<%= rs.getInt("id") %>" class="btn btn-danger">Delete</a>
					            </div>
					        </td>
					    </tr>
					<%
					        }
					    } catch (Exception e) {
					        out.println("<tr><td colspan='3' class='text-danger'>Error fetching data: " + e.getMessage() + "</td></tr>");
					    } finally {
					        try { if (rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
					        try { if (stmt != null) stmt.close(); } catch (Exception e) { e.printStackTrace(); }
					        try { if (con != null) con.close(); } catch (Exception e) { e.printStackTrace(); }
					    }
					%>

                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
