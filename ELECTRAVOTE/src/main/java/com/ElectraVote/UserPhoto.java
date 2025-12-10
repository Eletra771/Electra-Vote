package com.ElectraVote;

import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/UserPhoto")
public class UserPhoto extends HttpServlet {

    private static final String url = "jdbc:mysql://localhost:3306/electravote";
    private static final String user = "root";
    private static final String pass = "7319425477";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String voterId = req.getParameter("id");  // FIXED

        if (voterId == null || voterId.trim().isEmpty()) {
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, user, pass);

            String sql = "SELECT photo FROM register WHERE voterId = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, voterId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                InputStream imageStream = rs.getBinaryStream("photo");

                if (imageStream != null) {
                    res.setContentType("image/jpeg");
                    OutputStream out = res.getOutputStream();

                    byte[] buffer = new byte[4096];
                    int bytesRead;

                    while ((bytesRead = imageStream.read(buffer)) != -1) {
                        out.write(buffer, 0, bytesRead);
                    }
                    out.flush();
                    out.close();
                }
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
