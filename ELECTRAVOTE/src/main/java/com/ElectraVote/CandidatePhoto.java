package com.ElectraVote;

import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class CandidatePhoto extends HttpServlet {

    private static final String url = "jdbc:mysql://localhost:3306/electravote";
    private static final String user = "root";
    private static final String pass = "7319425477";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException {
        String id = req.getParameter("id");

        if (id == null) {
            res.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing ID");
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, user, pass);

            PreparedStatement ps = con.prepareStatement(
                "SELECT photo FROM candidates WHERE id = ?"
            );
            ps.setInt(1, Integer.parseInt(id));

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                byte[] img = rs.getBytes("photo");

                if (img != null && img.length > 0) {
                    res.setContentType("image/jpeg");
                    res.getOutputStream().write(img);
                } else {
                    System.out.println("No image stored for candidate id: " + id);
                }
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
