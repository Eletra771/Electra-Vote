<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Welcome | Online Voting System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f8f9fa;
        }
        .hero-banner {
            background-image: url('img/m1.jpg');
            background-size: cover;
            background-position: center;
            border-radius: 15px;
            padding: 80px 30px;
            color: white;
            position: relative;
        }
        .card {
		  background: #f8f9fa;
		  border: none;
		  border-left: 5px solid #6c63ff;
		  transition: transform 0.3s;
		}
		.card:hover {
		  transform: translateY(-5px);
		  box-shadow: 0 4px 12px rgba(108, 99, 255, 0.2);
		}
		.text-warning {
		  color: #ffc107;
		}
        

        .hero-banner::after {
            content: "";
            position: absolute;
            inset: 0;
            background: rgba(0, 0, 0, 0.4);
            border-radius: 15px;
        }
        /* Optional: Soft arrow lines between steps */
		@media (min-width: 768px) {
		    .row.text-center.g-5 > .col-md-4:not(:last-child)::after {
		        content: "➔";
		        position: absolute;
		        top: 30px;
		        right: -20px;
		        font-size: 24px;
		        color: #ccc;
		    }
		}
        

        .hero-content {
            position: relative;
            z-index: 1;
        }

        .hero-content h1 {
            font-size: 2.8rem;
            font-weight: bold;
        }

        .image-grid img {
            border-radius: 10px;
            width: 100%;
            height: auto;
        }

        .nav-link:hover {
		    background-color: #f0f0f0;
		    color: #007bff;
		    border-radius: 5px;
		    transition: all 0.2s ease;
		}
        .navbar-brand {
            font-weight: 600;
        }
    </style>
</head>
<body>
<%
    String msg = request.getParameter("message");
%>

<% if ("login_required".equals(msg)) { %>
    <div id="loginAlert" class="alert alert-info alert-dismissible fade show text-center" role="alert" style="position: fixed; top: 20px; left: 50%; transform: translateX(-50%); z-index: 9999; width: 60%;">
        You need to login to continue.
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
<% } %>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm px-4">
    <a class="navbar-brand" href="#">ElectraVote</a>
    <div class="collapse navbar-collapse">
        <ul class="navbar-nav me-auto">
            <li class="nav-item"><a class="nav-link" href="election.jsp">Election</a></li>
            <li class="nav-item"><a class="nav-link" href="#">Local</a></li>
            <li class="nav-item"><a class="nav-link" href="#">State</a></li>
            <li class="nav-item"><a class="nav-link" href="#">Contract Us</a></li>
        </ul>
        <div class="d-flex">
            <a href="login.jsp" class="btn btn-outline-primary me-2">Sign in</a>
            <a href="Register.jsp" class="btn btn-primary">Register</a>
        </div>
    </div>
</nav>

<!-- Hero Banner -->
<div class="container mt-4">
    <div class="hero-banner text-center text-white">
        <div class="hero-content">
            <h1>Welcome to ElectraVote</h1>
            <p class="lead">Your guide to the 2025 election</p>
            <div class="d-flex justify-content-center mt-4">
                <input type="text" class="form-control w-50 me-2" placeholder="Enter your address">
                <button class="btn btn-light">Get started</button>
            </div>
        </div>
    </div>
</div>


<!-- Image Grid Section -->
<div class="container mt-5">
    <div class="row g-4 align-items-stretch">
        <div class="col-md-4">
            <img src="img/m2.jpg
            " alt="Voting Line" class="img-fluid rounded shadow-sm h-80 w-80" style="object-fit: cover;">
        </div>
        <div class="col-md-4">
            <img src="img/m4.jpg" alt="Voting Box" class="img-fluid rounded shadow-sm h-80 w-80" style="object-fit: cover;">
        </div>
        <div class="col-md-4">
            <img src="img/m3.jpg" alt="Voting Booth" class="img-fluid rounded shadow-sm h-80 w-80" style="object-fit: cover;">
        </div>
    </div>
</div>

<!-- How It Works Section -->
<div class="container mt-5 pt-5">
    <h2 class="text-center fw-bold mb-3">How does it work?</h2>
    <p class="text-center text-muted mb-5">
        Our voting system is flexible to meet the unique needs of our users, so the details may vary from client to client and from election to election. But all online voting projects follow the same basic flow.
    </p>

    <div class="row text-center g-5">
        <!-- Step 1 -->
        <div class="col-md-4">
            <h1 class="text-primary fw-bold">01</h1>
            <h5 class="fw-bold mt-3">Election Set-Up</h5>
            <p class="text-muted">
                By utilizing our intuitive Election Manager, you're able to define your election including the dates, times, and ballot questions. Select authentication methods and upload eligible voter lists. Our support team helps guide or manage the process entirely.
            </p>
        </div>

        <!-- Step 2 -->
        <div class="col-md-4">
            <h1 class="text-primary fw-bold">02</h1>
            <h5 class="fw-bold mt-3">Voting</h5>
            <p class="text-muted">
                At your branded voting website, voters log in and vote with secure electronic ballots. Each vote is encrypted for anonymity. A receipt is issued to prevent repeat voting.
            </p>
        </div>

        <!-- Step 3 -->
        <div class="col-md-4">
            <h1 class="text-primary fw-bold">03</h1>
            <h5 class="fw-bold mt-3">Results</h5>
            <p class="text-muted">
                After voting ends, results are instantly tabulated and reviewed. They're published on the portal, and voters can verify by downloading vote receipts — ensuring full transparency.
            </p>
        </div>
    </div>
</div>


<!-- Carousel Testimonials Section -->
<div class="card mt-5 pt-5">
    <h2 class="text-center fw-bold mb-4">What Our Voters Say</h2>
    
    <div id="testimonialCarousel" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner text-center">

            <!-- Testimonial 1 -->
            <div class="carousel-item active">
                <img src="img/user1.png" class="rounded-circle mb-3" width="80" height="80" alt="User 1">
                <h5>Anjali Mehta</h5>
                <small class="text-muted">Voter from Delhi</small>
                <p class="mt-3 w-75 mx-auto">
                    “The voting process was so easy and secure. I was able to cast my vote online in just a few clicks!”
                </p>
                <div class="text-warning">★★★★★</div>
            </div>

            <!-- Testimonial 2 -->
            <div class="carousel-item">
                <img src="img/user2.png" class="rounded-circle mb-3" width="80" height="80" alt="User 2">
                <h5>Rahul Singh</h5>
                <small class="text-muted">Voter from Mumbai</small>
                <p class="mt-3 w-75 mx-auto">
                    “I love how transparent and smooth the system is. I even got a receipt for my vote!”
                </p>
                <div class="text-warning">★★★★☆</div>
            </div>

            <!-- Testimonial 3 -->
            <div class="carousel-item">
                <img src="img/ladies.png" class="rounded-circle mb-3" width="80" height="80" alt="User 3">
                <h5>Sneha Roy</h5>
                <small class="text-muted">Voter from Kolkata</small>
                <p class="mt-3 w-75 mx-auto">
                    “This is the future of elections! Secure, private, and super convenient.”
                </p>
                <div class="text-warning">★★★★★</div>
            </div>
        </div>

        <!-- Carousel Controls -->
        <button class="carousel-control-prev" type="button" data-bs-target="#testimonialCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon bg-dark rounded-circle p-2" aria-hidden="true"></span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#testimonialCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon bg-dark rounded-circle p-2" aria-hidden="true"></span>
        </button>

        <!-- Indicators -->
        <div class="carousel-indicators mt-4">
            <button type="button" data-bs-target="#testimonialCarousel" data-bs-slide-to="0" class="active"></button>
            <button type="button" data-bs-target="#testimonialCarousel" data-bs-slide-to="1"></button>
            <button type="button" data-bs-target="#testimonialCarousel" data-bs-slide-to="2"></button>
        </div>
    </div>
</div>


<!-- Footer -->
<div class="text-center mt-5 mb-4">
    <button class="btn btn-light border">Learn more about VoteSmart</button>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
