<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>

<%
    String userName = (String) session.getAttribute("Name");
    String email = (String) session.getAttribute("Email");
    String gender = (String) session.getAttribute("Gender");
    String voterId = (String) session.getAttribute("voterId");

    if (userName == null || email == null || voterId == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Dashboard - ElectraVote</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body { background: linear-gradient(to right, #4e54c8, #8f94fb); font-family: 'Segoe UI'; color: white; }
        .navbar { background-color: rgba(0, 0, 0, 0.2); }
        .card-style { background: white; color: #333; padding: 25px; border-radius: 15px; margin-top: 40px; }
        .avatar { width: 130px; height: 130px; border-radius: 50%; border: 3px solid #6c63ff; object-fit: cover; }
        .vote-btn { background: #28a745; color: white; }
    </style>
</head>

<body>

<nav class="navbar navbar-expand-lg navbar-dark px-4">
    <a class="navbar-brand fw-bold" href="#">ElectraVote</a>
    <div class="collapse navbar-collapse">
        <ul class="navbar-nav ms-auto">
            <li class="nav-item"><a class="nav-link" href="feedback.jsp">Feedback</a></li>
            <li class="nav-item"><a class="nav-link" href="contact.jsp">Contact Us</a></li>
            <li class="nav-item"><a class="nav-link btn btn-danger" href="logout.jsp">Logout</a></li>
        </ul>
    </div>
</nav>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6 card-style text-center">

            <!-- USER PHOTO -->
            <img src="UserPhoto?id=<%= voterId %>" class="avatar" alt="User Photo">

            <h3 class="mt-3">Welcome, <%= userName %>!</h3>
            <hr>

            <p><b>Email:</b> <%= email %></p>
            <p><b>Voter ID:</b> <%= voterId %></p>
            <p><b>Gender:</b> <%= gender %></p>

            <a href="election.jsp" class="btn vote-btn mt-3">Vote Now</a>
        </div>
    </div>
</div>

</body>
</html>
