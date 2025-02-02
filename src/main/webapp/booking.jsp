<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Booking Page</title>
    <!-- Swiper CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css">
    <!-- Font Awesome CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="styles.css">
    <!-- jQuery and Validation Plugin -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/jquery.validation/1.19.3/jquery.validate.min.js"></script>
    <!-- jQuery Validation Script -->
    <script>
        jQuery(document).ready(function($) {
            $("#booking").validate({
                rules: {
                    address: {
                        required: true
                    },
                    edate: {
                        required: true,
                        date: true
                    }
                },
                messages: {
                    address: {
                        required: "Please enter your address."
                    },
                    edate: {
                        required: "Please select a date.",
                        date: "Please enter a valid date."
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

            function disablePastDates() {
                var today = new Date();
                var dd = String(today.getDate()).padStart(2, '0');
                var mm = String(today.getMonth() + 1).padStart(2, '0');
                var yyyy = today.getFullYear();
                today = yyyy + '-' + mm + '-' + dd;
                document.getElementById("mydate").setAttribute("min", today);
            }

            disablePastDates();
        });
    </script>
    <style>
        * {
            font-family: sans-serif;
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }

        body {
            background: #222;
            padding-top: 70px; /* Ensure content is below the fixed navbar */
        }

        form {
            width: 35%;
            background-color: white;
            padding: 50px;
            border-radius: 20px;
            margin: 40px auto;
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

        .header {
            position: fixed;
            top: 0;
            width: 100%;
            background-color: #333;
            z-index: 1000;
            padding: 10px 0;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header .logo {
            color: #ffffff;
            text-decoration: none;
            font-size: 24px;
            font-weight: bold;
            margin-left: 20px;
        }

        .header .logo span {
            color: #3867d6; /* Accent color */
        }

        .navbar a, .navbar form a {
            color: #ffffff;
            text-decoration: none;
            padding: 0.5em 1em;
            display: inline-block;
        }

        .navbar a:hover, .navbar form a:hover {
            color: #000000; /* Adjust hover text color as needed */
        }

        .navbar form {
            display: inline;
            margin: 0;
            padding: 0;
        }

        .navbar .nav-link {
            color: inherit;
            text-decoration: none;
            padding: 0.5em 1em;
            display: inline-block;
        }

        .profile {
            display: flex;
            align-items: center;
            gap: 10px;
            color: #ffffff;
            margin-right: 20px;
        }

        .profile img {
            width: 30px;
            height: 30px;
            border-radius: 50%;
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

    <%
    String plan = request.getParameter("plan");
    String cost = request.getParameter("cost");
    String name = (String) session.getAttribute("uname");
    String email = (String) session.getAttribute("email");
    %>
    <div class="container">
        <form id="booking" class="mx-auto" method="POST" action="addtocart">
            <h4 class="text-center">Book Event</h4>
            <div class="form-group mt-5">
                <label for="user" class="form-label">Name</label>
                <input id="user" type="text" class="form-control" name="name" value="<%= name %>" readonly>
            </div>
            <div class="form-group">
                <label for="mail" class="form-label">Email</label>
                <input id="mail" type="email" class="form-control" name="email" value="<%= email %>" readonly>
            </div>
            <div class="form-group">
                <label for="plan" class="form-label">Plan</label>
                <input id="plan" type="text" class="form-control" name="uplan" value="<%= plan %>" readonly>
            </div>
            <div class="form-group">
                <label for="cost" class="form-label">Cost</label>
                <input id="cost" type="number" class="form-control" name="ecost" value="<%= cost %>" readonly>
            </div>
            <div class="form-group">
                <label for="date" class="form-label">Date</label>
                <input id="mydate" type="date" class="form-control" name="edate">
            </div>
            <div class="form-group">
                <label for="address" class="form-label">Address</label>
                <input id="address" type="text" class="form-control" name="address">
            </div>
            <input type="submit" class="btn btn-primary mt-4" name="bookevent" value="Book" />
            <div class="form-text mt-3">Want to Change Plan? <a href="book.jsp">Click me!</a></div>
            <div class="form-text mt-3">Booked Events Status <a href="userBooked.jsp">Click me!</a></div>
            <div>
                <% if (request.getAttribute("status") != null) { %>
                <div id="msg" style="font-size: medium; color: red">
                    <%= request.getAttribute("status") %>
                </div>
                <% } %>
            </div>
        </form>
    </div>

    <%@ include file="footer.jsp" %>
</body>
</html>
