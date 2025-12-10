<%@ page session="true" %>
<%
  if (session.getAttribute("adminId") == null) {
    response.sendRedirect("admin_login.jsp");
    return;
  }
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Add Candidate</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="p-4">
  <div class="container" style="max-width:700px;">
    <h3 class="mb-3">Add Candidate</h3>

    <% if(request.getAttribute("error") != null) { %>
      <div class="alert alert-danger"><%= request.getAttribute("error") %></div>
    <% } %>

    <form action="AddCandidateServlet" method="post" enctype="multipart/form-data">

      <div class="mb-3">
        <label class="form-label">Name</label>
        <input name="name" class="form-control" required />
      </div>

      <div class="mb-3">
        <label class="form-label">Party</label>
        <input name="party" class="form-control" />
      </div>

      <div class="mb-3">
        <label class="form-label">Manifesto</label>
        <textarea name="manifesto" class="form-control" rows="4"></textarea>
      </div>

      <div class="mb-3">
        <label class="form-label">Candidate Photo (Symbol)</label>
        <input type="file" name="photo" accept="image/*" class="form-control" />
      </div>

      <button class="btn btn-primary">Add Candidate</button>
      <a href="manage_candidates.jsp" class="btn btn-secondary ms-2">Back</a>

    </form>
  </div>
</body>
</html>
