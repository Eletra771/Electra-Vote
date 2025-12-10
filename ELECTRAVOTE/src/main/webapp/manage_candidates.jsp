<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<%
  if (session.getAttribute("adminId") == null) {
    response.sendRedirect("admin_login.jsp");
    return;
  }

  // Database credentials
  String url = "jdbc:mysql://localhost:3306/electravote";
  String user = "root";
  String pass = "7319425477"; // ✅ Replace with your MySQL password
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Manage Candidates</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="p-4">
  <div class="container">
    <h3>Manage Candidates</h3>
    <a href="add_candidate.jsp" class="btn btn-primary mb-3">Add Candidate</a>
    <% if(request.getParameter("msg")!=null){ %>
       <div class="alert alert-success">Candidate added successfully.</div>
    <% } %>

    <table class="table table-striped">
      <thead>
        <tr>
          <th>#</th>
          <th>Photo</th>
          <th>Name</th>
          <th>Party</th>
          <th>Manifesto</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>
      <%
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Load driver
            try (Connection c = DriverManager.getConnection(url, user, pass)) {
                PreparedStatement pst = c.prepareStatement("SELECT * FROM candidates ORDER BY id DESC");
                ResultSet rs = pst.executeQuery();
                int i = 1;
                while(rs.next()){
      %>
        <tr>
          <td><%= i++ %></td>
          <td>
            <%
               String photo = rs.getString("photo");
               if(photo != null && !photo.isEmpty()){ 
            %>
               <img src="<%= photo %>" width="80" height="60" style="object-fit:cover;border-radius:6px"/>
            <% } else { %>
               <img src="img/placeholder.png" width="80" height="60"/>
            <% } %>
          </td>
          <td><%= rs.getString("name") %></td>
          <td><%= rs.getString("party") %></td>
          <td style="max-width:300px;"><%= rs.getString("manifesto") %></td>
          <td>
            <a href="edit_candidate.jsp?id=<%= rs.getInt("id") %>" class="btn btn-sm btn-warning">Edit</a>
            <a href="DeleteCandidateServlet?id=<%= rs.getInt("id") %>" class="btn btn-sm btn-danger" onclick="return confirm('Delete candidate?')">Delete</a>
          </td>
        </tr>
      <%  
                }
            }
        } catch(Exception ex){ 
            out.print("<tr><td colspan='6'>Server error: " + ex.getMessage() + "</td></tr>"); 
        }
      %>
      </tbody>
    </table>
  </div>
</body>
</html>
