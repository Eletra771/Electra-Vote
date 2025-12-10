<%@ page import="java.sql.*" %>

<%
    // Prevent direct access without login (correct session attribute)
    if (session.getAttribute("Email") == null) {
        response.sendRedirect("login.jsp?msg=Login required");
        return;
    }

    // Correct session attributes from your login servlet
    String voterId = (String) session.getAttribute("voterId");
    String voterName = (String) session.getAttribute("Name");

    // DB connection
    String url = "jdbc:mysql://localhost:3306/electravote";
    String user = "root";
    String pass = "7319425477";

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(url, user, pass);

    PreparedStatement ps = con.prepareStatement("SELECT * FROM candidates");
    ResultSet rs = ps.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Vote</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">

<div class="container mt-4">

    <!-- User profile photo and name -->
    <div class="d-flex justify-content-end align-items-center mb-3">
        <span class="me-3 fw-bold">Welcome, <%= voterName %></span>

        <img src="UserPhoto?id=<%= voterId %>"
             alt="User Photo"
             class="rounded-circle"
             width="60" height="60"
             style="object-fit: cover; border:2px solid #333;">
    </div>

    <h2 class="mb-4">Choose Your Candidate</h2>

    <div class="row">
        <%
            while (rs.next()) {
        %>

        <div class="col-md-4">
            <div class="card shadow-sm mb-4">

                <img src="CandidatePhoto?id=<%= rs.getInt("id") %>"
                     class="card-img-top"
                     style="height:250px; object-fit:cover;">

                <div class="card-body">
                    <h5 class="card-title"><%= rs.getString("name") %></h5>
                    <p class="card-text text-muted"><%= rs.getString("party") %></p>

                    <form action="CastVote" method="post">
                        <input type="hidden" name="candidateId" value="<%= rs.getInt("id") %>">
                        <button class="btn btn-primary w-100">Vote</button>
                    </form>
                </div>

            </div>
        </div>

        <%
            }
        %>
    </div>

</div>
</body>
</html>
