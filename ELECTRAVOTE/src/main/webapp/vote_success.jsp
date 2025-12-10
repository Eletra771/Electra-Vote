<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Vote Submitted - ElectraVote</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        body {
            background: linear-gradient(to right, #e0f7fa, #ffffff);
            font-family: 'Segoe UI', sans-serif;
            text-align: center;
            padding: 80px 20px;
        }

        .success-container {
            position: relative;
            background-image: url('img/celebration.jpg'); /* 🎉 Background image */
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;

            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            padding: 50px;
            max-width: 600px;
            margin: auto;
            overflow: hidden;
        }

        /* Optional white overlay for readability */
        .success-container::before {
            content: '';
            position: absolute;
            top: 0; left: 0;
            width: 100%; height: 100%;
            background: rgba(255, 255, 255, 0.8);
            border-radius: 15px;
            z-index: 0;
        }

        /* Ensure content appears above overlay */
        .success-container > * {
            position: relative;
            z-index: 1;
        }

        .success-icon {
            font-size: 60px;
            color: #28a745;
        }

        h1 {
            font-size: 28px;
            color: #004080;
            margin-top: 20px;
        }

        p {
            font-size: 16px;
            color: #555;
            margin: 15px 0 30px;
        }

        .success-image {
            width: 120px;
            margin-top: 10px;
        }

        .home-btn {
            background-color: #004080;
            color: white;
            padding: 12px 24px;
            text-decoration: none;
            font-size: 16px;
            border-radius: 25px;
            transition: background 0.3s;
        }

        .home-btn:hover {
            background-color: #003366;
        }
    </style>
</head>
<body>

<div class="success-container">
    <!-- ✅ Checkmark Icon -->
    <i class="fas fa-check-circle success-icon"></i>

    <h1>Vote Successfully Submitted!</h1>
    <p>Thank you for voting. Your vote has been recorded securely and confidentially.</p>

    <!-- 👍 Optional thumbs-up image -->
    <img src="img/thums.jpg" alt="Thumbs Up" class="success-image">

    <br><br>
    <a href="index.jsp" class="home-btn">Back to Dashboard</a>
</div>

</body>
</html>
