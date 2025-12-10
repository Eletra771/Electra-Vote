<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8"/>
  <title>Admin Login - ElectraVote</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Bootstrap 5 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

  <style>
    body{
      min-height:100vh;
      display:flex;
      align-items:center;
      justify-content:center;
      background: linear-gradient(135deg,#0f2027 0%, #203a43 50%, #2c5364 100%);
      color:#fff;
      font-family: 'Segoe UI', sans-serif;
    }
    .card-admin{
      width:420px;
      border-radius:18px;
      padding:28px;
      background: linear-gradient(180deg, rgba(255,255,255,0.04), rgba(255,255,255,0.02));
      box-shadow: 0 10px 30px rgba(0,0,0,0.45);
      backdrop-filter: blur(6px);
    }
    .brand {
      font-weight:700;
      letter-spacing:1px;
      color: #fff;
    }
    .btn-neon{
      background: linear-gradient(90deg,#5efce8,#736efe);
      border: none;
      color:#111;
      font-weight:600;
    }
    .muted { color:#cfd8dc; font-size:0.9rem; }
  </style>
</head>
<body>
  <div class="card-admin">
    <div class="text-center mb-3">
      <h3 class="brand">ElectraVote Admin</h3>
      <p class="muted">Login to manage elections and view results</p>
    </div>

    <form action="AdminLoginServlet" method="post">
      <div class="mb-3">
        <label class="form-label">Email</label>
        <input class="form-control" type="email" name="email" required />
      </div>
      <div class="mb-3">
        <label class="form-label">Password</label>
        <input class="form-control" type="password" name="password" required />
      </div>

      <% if(request.getAttribute("error") != null) { %>
        <div class="alert alert-danger"><%= request.getAttribute("error") %></div>
      <% } %>

      <div class="d-grid">
        <button class="btn btn-neon">Sign in</button>
      </div>
    </form>
    <div class="mt-3 text-center muted">
      Tip: Keep your admin credentials safe.
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
