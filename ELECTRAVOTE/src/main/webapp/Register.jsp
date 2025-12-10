<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register - Online Voting System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <style>
        body {
            background: linear-gradient(to right, #4e54c8, #8f94fb);
            font-family: 'Segoe UI', sans-serif;
        }

        .card {
            border-radius: 20px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        }

        .avatar {
            width: 120px;
            height: 120px;
            object-fit: cover;
            border-radius: 50%;
            margin-bottom: 15px;
            border: 4px solid white;
        }

        .form-control:focus {
            border-color: #6c63ff;
            box-shadow: 0 0 0 0.25rem rgba(108, 99, 255, 0.25);
        }

        .btn-primary {
            background-color: #6c63ff;
            border-color: #6c63ff;
        }

        .btn-primary:hover {
            background-color: #5a52d1;
        }
    </style>
</head>
<body>
<% 
    String error = (String) request.getAttribute("error");
    if (error != null) {
%>
    <div id="errorAlert" class="alert alert-danger alert-dismissible fade show text-center" role="alert" 
         style="position: fixed; top: 20px; left: 50%; transform: translateX(-50%); z-index: 9999; width: 70%;">
        <%= error %>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
<%
    }
%>


    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-md-6 col-lg-5">
                <div class="card p-4">
                    <div class="text-center">
                        <img src="img/img_avatar.png" alt="User Avatar" class="avatar">
                        <h3 class="mb-3">Voter Registration</h3>
                    </div>
                    <form action="RegisterServlet" method="post" enctype="multipart/form-data">
                        <div class="mb-3">
                            <label for="name" class="form-label">Full Name</label>
                            <input type="text" class="form-control" id="name" name="name" required placeholder="Enter full name">
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label">Email address</label>
                            <input type="email" class="form-control" id="email" name="email" required placeholder="example@mail.com">
                        </div>
                        <div class="mb-3">
						    <label class="form-label d-block">Gender</label>
						    <div class="btn-group" role="group" aria-label="Gender selection">
						        <input type="radio" class="btn-check" name="gender" id="genderMale" value="Male" autocomplete="off" required>
						        <label class="btn btn-outline-primary" for="genderMale">Male</label>
						
						        <input type="radio" class="btn-check" name="gender" id="genderFemale" value="Female" autocomplete="off">
						        <label class="btn btn-outline-primary" for="genderFemale">Female</label>
						        
						        <input type="radio" class="btn-check" name="gender" id="genderOther" value="Other" autocomplete="off">
						        <label class="btn btn-outline-primary" for="genderOther">Other</label>
						    </div>
						</div>
                        
                        <div class="mb-3">
                            <label for="voterId" class="form-label">Voter ID</label>
                            <input type="text" class="form-control" id="voterId" name="voterId" required placeholder="Enter voter ID">
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Create Password</label>
                            <input type="password" class="form-control" id="password" name="password" required placeholder="Minimum 6 characters">
                        </div>
                        <div>
	                        <label for="photo">Take or upload a photo:</label><br>
						    <input type="file" id="photo" name="photo" accept="image/*" required  capture="environment"><br>
						    
                        </div>
                        <br>
                        <br>
                        <button type="submit" class="btn btn-primary w-100">Register</button>
                    </form>
                    <p class="mt-3 text-center">Already registered? <a href="login.jsp">Login here</a></p>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS CDN -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
