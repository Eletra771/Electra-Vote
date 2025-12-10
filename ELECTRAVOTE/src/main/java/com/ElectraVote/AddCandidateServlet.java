package com.ElectraVote;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/AddCandidateServlet")
@MultipartConfig
public class AddCandidateServlet extends HttpServlet {

    private static final String URL = "jdbc:mysql://localhost:3306/electravote";
    private static final String USER = "root";
    private static final String PASS = "7319425477"; 

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ---- Admin Login Required ----
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("adminId") == null) {
            response.sendRedirect("admin_login.jsp");
            return;
        }

        String name = request.getParameter("name");
        String party = request.getParameter("party");
        String manifesto = request.getParameter("manifesto");

        Part photoPart = request.getPart("photo");
        String fileName = null;

        // ---- Save Uploaded Photo ----
        if (photoPart != null && photoPart.getSize() > 0) {

            String uploadsDir = request.getServletContext().getRealPath("/uploads");
            Files.createDirectories(Paths.get(uploadsDir)); // create folder if not exists

            String original = photoPart.getSubmittedFileName();
            String extension = "";

            int dot = original.lastIndexOf(".");
            if (dot >= 0) extension = original.substring(dot);

            fileName = "cand_" + System.currentTimeMillis() + extension;

            File file = new File(uploadsDir, fileName);

            try (InputStream in = photoPart.getInputStream();
                 FileOutputStream out = new FileOutputStream(file)) {

                byte[] buffer = new byte[4096];
                int len;

                while ((len = in.read(buffer)) != -1) {
                    out.write(buffer, 0, len);
                }
            }
        }

        // ---- Insert Candidate Record ----
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(URL, USER, PASS);

            String sql = "INSERT INTO candidates (name, party, manifesto, photo) VALUES (?, ?, ?, ?)";

            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, name);
            pst.setString(2, party);
            pst.setString(3, manifesto);
            pst.setString(4, (fileName != null ? "uploads/" + fileName : null));

            pst.executeUpdate();
            conn.close();

            response.sendRedirect("manage_candidates.jsp?msg=added");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Server error: " + e.getMessage());
            request.getRequestDispatcher("add_candidate.jsp").forward(request, response);
        }
    }
}
