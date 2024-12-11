<%@ page import="java.sql.*" %>
<%@ page import="com.jspservlet.carsales.db.DB" %>

<%
    // Use implicit 'session' object provided by JSP
    if (session == null || session.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp"); // Redirect to login if not logged in
        return;
    }

    String userId = (String) session.getAttribute("userId");
    String carId = request.getParameter("car_id");

    try {
        Connection conn = DB.getCon();

        String sql = "INSERT INTO purchase (user_id, car_id, purchase_date) VALUES (?, ?, NOW())";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, userId);
        ps.setString(2, carId);
        ps.executeUpdate();

        response.sendRedirect("payment.jsp?car_id=" + carId);
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<div class='alert alert-danger'>An error occurred while processing your request. Please try again later.</div>");
    }
%>
