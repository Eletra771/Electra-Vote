package com.ElectraVote;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.security.MessageDigest;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Base64;
@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {

    private static final String url = "jdbc:mysql://localhost:3306/electravote";
    private static final String user = "root";
    private static final String pass = "7319425477";

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, user, pass);

            PreparedStatement pst = con.prepareStatement(
                "SELECT * FROM admin WHERE email=?"
            );
            pst.setString(1, email);
            ResultSet rs = pst.executeQuery();

            // Email not found
            if (!rs.next()) {
                req.setAttribute("error", "Invalid credentials");
                req.getRequestDispatcher("admin_login.jsp").forward(req, res);
                return;
            }

            String storedPass = rs.getString("password");

            // Password match check
            if (!storedPass.equals(password)) {
                req.setAttribute("error", "Invalid credentials");
                req.getRequestDispatcher("admin_login.jsp").forward(req, res);
                return;
            }

            // SUCCESS
            HttpSession session = req.getSession();
            session.setAttribute("adminId", rs.getInt("id"));
            session.setAttribute("adminName", rs.getString("name"));

            res.sendRedirect("admin_dashbroad.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Server error: " + e.getMessage());
            req.getRequestDispatcher("admin_login.jsp").forward(req, res);
        }
    }
}
