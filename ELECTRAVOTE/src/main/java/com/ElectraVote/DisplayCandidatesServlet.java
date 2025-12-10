package com.ElectraVote;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DisplayCandidatesServlet extends HttpServlet {

    private static final String url = "jdbc:mysql://localhost:3306/electravote";
    private static final String user = "root";
    private static final String pass = "7319425477";

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        List<Candidate> clist = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, user, pass);

            String sql = "SELECT * FROM candidates";
            PreparedStatement pst = con.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                Candidate c = new Candidate();
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));
                c.setParty(rs.getString("party"));
                c.setManifesto(rs.getString("manifesto"));
                c.setPhoto(rs.getString("photo"));

                clist.add(c);
            }

            con.close();

            req.setAttribute("candidateList", clist);
            req.getRequestDispatcher("election.jsp").forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().println("Error loading candidates: " + e.getMessage());
        }
    }
}
