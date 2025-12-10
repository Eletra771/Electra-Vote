package com.ElectraVote;

import java.io.IOException;
import java.io.InputStream;
import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Base64;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
@MultipartConfig
public class RegisterServlet extends HttpServlet {
    private static final String url = "jdbc:mysql://localhost:3306/electravote";
    private static final String user = "root";
    private static final String pass = "7319425477"; // ✅ Replace with your actual MySQL password

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");
        String id = request.getParameter("voterId");
        String password = request.getParameter("password");
        Part file=request.getPart("photo");
        InputStream input=null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, user, pass);
            if(file !=null) {
            	input=file.getInputStream();
            }

            // Check for duplicate email or voter ID
            String checkSQL = "SELECT * FROM register WHERE email = ? OR voterId = ?";
            PreparedStatement checkStmt = conn.prepareStatement(checkSQL);
            checkStmt.setString(1, email);
            checkStmt.setString(2, id);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                request.setAttribute("error", "Email or Voter ID already registered.");
                request.getRequestDispatcher("Register.jsp").forward(request, response);
                return;
            }

            // Insert user
            String insertSQL = "INSERT INTO register (name, email, gender, voterId, password,photo) VALUES (?, ?, ?, ?, ?,?)";
            PreparedStatement insertStmt = conn.prepareStatement(insertSQL);
            insertStmt.setString(1, name);
            insertStmt.setString(2, email);
            insertStmt.setString(3, gender);
            insertStmt.setString(4, id);
            insertStmt.setString(5, hashPassword(password));
            insertStmt.setBlob(6, input);

            int inserted = insertStmt.executeUpdate();

            if (inserted > 0) {
            	response.sendRedirect("index.jsp?message=login_required");

            } else {
                request.setAttribute("error", "Registration failed. Try again.");
                request.getRequestDispatcher("Register.jsp").forward(request, response);
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Server error: " + e.getMessage());
            request.getRequestDispatcher("Register.jsp").forward(request, response);
        }
    }

    private String hashPassword(String password) throws Exception {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        byte[] hash = md.digest(password.getBytes());
        return Base64.getEncoder().encodeToString(hash);
    }
}
