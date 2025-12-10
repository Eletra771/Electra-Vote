<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Voter Login - Online Voting System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(to right, #11998e, #38ef7d);
            font-family: 'Segoe UI', sans-serif;
        }

        .login-card {
            margin-top: 80px;
            border-radius: 15px;
            padding: 30px;
            background-color: #fff;
            box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.2);
        }

        .avatar {
            width: 90px;
            height: 90px;
            border-radius: 50%;
            margin-bottom: 20px;
            object-fit: cover;
        }

        .btn-primary {
            background-color: #4e4376;
            border-color: #4e4376;
        }

        .btn-primary:hover {
            background-color: #3b305a;
        }

        .form-control:focus {
            border-color: #4e4376;
            box-shadow: 0 0 0 0.25rem rgba(78, 67, 118, 0.25);
        }
    </style>
</head>
<body>
<!-- Error message pop-up -->
<% String error = (String) request.getAttribute("error"); %>
<% if (error != null) { %>
    <div class="alert alert-danger alert-dismissible fade show mt-3" role="alert">
        <%= error %>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
<% } %>


<div class="container d-flex justify-content-center align-items-center min-vh-100">
    <div class="col-md-6 col-lg-4">
        <div class="login-card text-center">
            <img src="img/img_avatar.png" alt="User Avatar" class="avatar">
            <h3 class="mb-4">Voter Login</h3>
            <form action="LoginServlet" method="post">
                <div class="mb-3 text-start">
                    <label for="email" class="form-label">Email Address</label>
                    <input type="email" id="email" name="email" class="form-control" required placeholder="Enter email">
                </div>
                <div class="mb-3 text-start">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" id="password" name="password" class="form-control" required placeholder="Enter password">
                </div>
                <button type="submit" class="btn btn-primary w-100 mt-3">Login</button>
            </form>
            <p class="mt-3">Not registered? <a href="Register.jsp">Create an account</a></p>
        </div>
    </div>
</div>

<!-- Bootstrap Bundle JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
