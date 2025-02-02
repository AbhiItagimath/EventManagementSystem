<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reset Password</title>

    <!-- Swiper CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css">
    <!-- Font Awesome CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="styles.css">
    <style>
        * {
            font-family: sans-serif;
            padding: 0;
            margin: 0;
            box-sizing: border-box;
            text-transform: none !important;
        }

        body {
            background: #222;
        }

        form {
            width: 30%;
            background-color: white;
            padding: 50px;
            border-radius: 20px;
            margin: 125px auto 30px auto;
        }

        .btn-primary {
            width: 100%;
            border: none;
            border-radius: 50px;
            background: #3867d6;
            color: white;
            padding: 10px;
            cursor: pointer;
        }

        .btn-primary:hover {
            background: #2b50a0;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            margin: 5px 0 20px 0;
            display: inline-block;
            border: none;
            border-bottom: 1px solid #ccc;
            box-sizing: border-box;
            color: rgba(0, 0, 0, .87);
        }

        h4 {
            font-size: 2rem !important;
            font-weight: 700;
            text-align: center;
        }

        .form-label {
            font-weight: 800 !important;
            display: block;
        }

        .navbar a, .footer a {
            text-decoration: none !important;
        }

        .navbar a:hover, .footer a:hover {
            text-decoration: none !important;
        }

        #msg {
            color: red;
            width: 75%;
            font-size: 18px;
            font-family: sans-serif;
            padding: 5px;
            text-align: center;
            font-size: 20px;
        }
    </style>
</head>
<body>
    <%@ include file="navbar.jsp" %>

    <div class="container">
        <form method="POST" action="register">
            <h4 class="text-center">RESET PASSWORD</h4>
            <div class="form-group mt-5">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="oldPassword" class="form-label">Old Password</label>
                <input type="password" class="form-control" id="oldPassword" name="oldPassword" required>
            </div>
            <div class="form-group">
                <label for="newPassword" class="form-label">New Password</label>
                <input type="password" class="form-control" id="newPassword" name="newPassword" required>
            </div>
            <div class="form-group">
                <label for="confirmNewPassword" class="form-label">Confirm New Password</label>
                <input type="password" class="form-control" id="confirmNewPassword" name="confirmNewPassword" required>
            </div>
            <input type="submit" class="btn btn-primary mt-4" name="resetPassword" value="Reset Password">
            <div class="form-text mt-3">
                <% if (request.getAttribute("status") != null) { %>
                <div id="msg"><%= request.getAttribute("status") %></div>
                <% } %>
            </div>
        </form>
    </div>

    <%@include file="footer.jsp" %>
</body>
</html>
