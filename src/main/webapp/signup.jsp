<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>SignUp Page</title>
    <!-- Swiper CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css">
    <!-- Font Awesome CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="styles.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/jquery.validation/1.19.3/jquery.validate.min.js"></script>
    <script>
        // Add custom method for email validation
        jQuery.validator.addMethod("checkemail", function(value, element) {
            return /^(([^<>()[\]

\\.,;:\s@\"]+(\.[^<>()[\]

\\.,;:\s@\"]+)*)|(\".+\"))@((

\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\]

)|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(value)
                || /^[0-9]{10}$/.test(value);
        });

        // Document ready function to validate form
        jQuery(document).ready(function($) {
            $("#signup").validate({
                rules: {
                    uname: {
                        required: true
                    },
                    uemail: {
                        required: true,
                        checkemail: true
                    },
                    upassword: {
                        required: true,
                        minlength: 6
                    },
                    cupassword: {
                        required: true,
                        equalTo: "#password"
                    }
                },
                messages: {
                    uname: {
                        required: "Please enter your name."
                    },
                    uemail: {
                        required: "Please enter your email.",
                        email: "Please enter a valid email address."
                    },
                    upassword: {
                        required: "Please enter a password.",
                        minlength: "Your password must be at least 6 characters long."
                    },
                    cupassword: {
                        required: "Please confirm your password.",
                        equalTo: "Passwords do not match."
                    }
                },
                errorElement: "div",
                errorPlacement: function(error, element) {
                    error.addClass("form-text text-danger");
                    error.insertAfter(element);
                },
                highlight: function(element, errorClass, validClass) {
                    $(element).addClass("is-invalid").removeClass("is-valid");
                },
                unhighlight: function(element, errorClass, validClass) {
                    $(element).removeClass("is-invalid").addClass("is-valid");
                }
            });
        });
    </script>
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
            width: 35%;
            background-color: white;
            padding: 50px;
            border-radius: 20px;
            margin: 80px auto;
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

        .navbar .logo {
            text-decoration: none !important;
        }

        #msg {
            color: red;
            width: 75%;
            font-size: 18px;
            font-family: sans-serif;
            padding: 5px;
        }

        .form-text.text-danger {
            color: red;
        }

        .is-invalid {
            border-bottom: 1px solid red;
        }

        .is-valid {
            border-bottom: 1px solid green;
        }
    </style>
</head>
<body>

    <%@ include file="navbar.jsp" %>
    <br><br>
    <div class="container">
        <form id="signup" class="mx-auto" method="POST" action="register">
            <h4 class="text-center">SignUp</h4>
            <div class="form-group mt-5">
                <label for="name" class="form-label">Name</label>
                <input id="name" type="text" class="form-control" name="uname" required>
            </div>
            <div class="form-group">
                <label for="mail" class="form-label">Email</label>
                <input id="mail" type="email" class="form-control" name="uemail" required>
                <div class="form-text">We'll never share your email with anyone else.</div>
            </div>
            <div class="form-group">
                <label for="password" class="form-label">Password</label>
                <input id="password" type="password" class="form-control" name="upassword" required>
            </div>
            <div class="form-group">
                <label for="cpassword" class="form-label">Confirm Password</label>
                <input id="cpassword" type="password" class="form-control" name="cupassword" required>
            </div>
            <input type="submit" class="btn btn-primary mt-4" name="signup" value="SignUp" />
            <div class="form-text mt-3">Already have an account? <a href="login.jsp">Click here</a></div>
            <div>
                <% if (request.getAttribute("status") != null) { %>
                <div id="msg">
                    <%= request.getAttribute("status") %>
                </div>
                <% } %>
            </div>
        </form>
    </div>

    <%@ include file="footer.jsp" %>
</body>
</html>
