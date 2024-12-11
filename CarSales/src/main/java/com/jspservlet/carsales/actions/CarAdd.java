package com.jspservlet.carsales.actions;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import com.jspservlet.carsales.db.DB;

@WebServlet("/CarAdd")
@MultipartConfig(location = "/tmp", maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 10, fileSizeThreshold = 1024)
public class CarAdd extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form fields
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String year = request.getParameter("year");
        String price = request.getParameter("price");
        String modelid = request.getParameter("model_id");
        String memberid = request.getParameter("member_id");

        final String UPLOAD_DIRECTORY = "C:/Users/vishw/eclipse-workspace/CarSales/src/main/webapp/images/"; 
        String uploadedImagePath = "";
        File uploadDir = new File(UPLOAD_DIRECTORY);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();  
        }

        Part filePart = request.getPart("file");
        if (filePart == null) {
            System.out.println("No file uploaded.");
            throw new ServletException("File upload failed. Ensure a file is selected.");
        }

        System.out.println("File Part Size: " + filePart.getSize());
        System.out.println("File Part Content Type: " + filePart.getContentType());

        if (filePart.getSize() > 0) {
            String fileName = getFileName(filePart);
            System.out.println("Uploaded file name: " + fileName);

            if (fileName != null && !fileName.isEmpty()) {
                String filePath = UPLOAD_DIRECTORY + fileName;
                filePart.write(filePath);
                uploadedImagePath = "images/" + fileName;  
                System.out.println("File uploaded successfully to: " + filePath);
            } else {
                throw new ServletException("File name is empty.");
            }
        } else {
            System.out.println("No file uploaded.");
            throw new ServletException("File upload failed. Ensure a file is selected.");
        }

        try {
            String sql = "INSERT INTO car(title, description, year, price, model_id, member_id, image_path) VALUES(?,?,?,?,?,?,?)";
            Connection conn = DB.getCon();
            PreparedStatement preparedStatement = conn.prepareStatement(sql);


            preparedStatement.setString(1, title);
            preparedStatement.setString(2, description);
            preparedStatement.setString(3, year);
            preparedStatement.setString(4, price);
            preparedStatement.setString(5, modelid);
            preparedStatement.setString(6, memberid);
            preparedStatement.setString(7, uploadedImagePath); 

            preparedStatement.executeUpdate();

           
            response.sendRedirect("AdminDashboard.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Error adding car to the database.", e);
        }
    }

    private String getFileName(Part filePart) {
        String contentDisposition = filePart.getHeader("content-disposition");
        String[] tokens = contentDisposition.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf('=') + 2, token.length() - 1);
            }
        }
        return "";
    }
}
