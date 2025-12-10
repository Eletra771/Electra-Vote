package com.ElectraVote;

import java.io.*;
import java.security.MessageDigest;
import java.sql.*;
import java.util.Base64;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/LoginServlet")
public class user_login extends HttpServlet {
    private static final String url = "jdbc:mysql://localhost:3306/electravote";
    private static final String user = "root";
    private static final String dbPassword = "7319425477";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String email = req.getParameter("email");
        String pass = req.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, user, dbPassword);

            String sql = "SELECT * FROM register WHERE email = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, email);

            ResultSet rs = st.executeQuery();

            if (!rs.next()) {
                req.setAttribute("error", "Email is not registered.");
                req.getRequestDispatcher("login.jsp").forward(req, res);
                return;
            }

            String storedHash = rs.getString("password");

            if (!storedHash.equals(hashPassword(pass))) {
                req.setAttribute("error", "Incorrect password.");
                req.getRequestDispatcher("login.jsp").forward(req, res);
                return;
            }

            // SUCCESS — create session
            HttpSession session = req.getSession();
            session.setAttribute("Email", email);
            session.setAttribute("Name", rs.getString("name"));
            session.setAttribute("Gender", rs.getString("gender"));
            session.setAttribute("voterId", rs.getString("voterId"));

            res.sendRedirect("dashbroad.jsp");
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Server error: " + e.getMessage());
            req.getRequestDispatcher("login.jsp").forward(req, res);
        }
    }

    private String hashPassword(String password) throws Exception {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        byte[] hash = md.digest(password.getBytes());
        return Base64.getEncoder().encodeToString(hash);
    }
}
