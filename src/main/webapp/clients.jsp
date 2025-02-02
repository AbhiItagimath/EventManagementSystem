<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.model.Enquiry"%>
<%@page import="java.util.*"%>
<%@page import="com.model.User"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Clients</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css">
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }
        .container {
            margin-top: 50px; /* Adjust this value as needed */
            padding: 20px;
        }
        .header-text {
            padding-left: 20px;
            padding-top: 14px;
            color: #3867d6;
            font-size: xx-large;
            text-align: center;
        }
        .table {
            width: 100%;
            margin-bottom: 1rem;
            color: #333;
            background-color: #fff;
            border-collapse: collapse;
            text-align: left;
            border-radius: 0.5rem;
            overflow: hidden;
        }
        .table th, .table td {
            padding: 1rem;
            border-bottom: 1px solid #ddd;
        }
        .table th {
            background-color: #f2f2f2;
            color: #333;
        }
        .table-striped tbody tr:nth-of-type(odd) {
            background-color: #f9f9f9;
        }
        .table-hover tbody tr:hover {
            background-color: #f1f1f1;
        }
        .btn {
            padding: 0.5rem 1rem;
            border: none;
            border-radius: 0.25rem;
            cursor: pointer;
            font-size: 1rem;
        }
        .btn-danger {
            background-color: #dc3545;
            color: #fff;
        }
        .btn-danger:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>
    <%@include file="admHeader.jsp" %>
    
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <h3 class="header-text">Manage <b style="color: #fff;">Clients</b></h3>
            </div>
        </div>
        <table class="table table-striped table-hover">
            <thead>
                <tr>
                    <th>Client ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Signed Up Date</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                Enquiry enquiry = new Enquiry(session);
                ArrayList<User> clients = enquiry.getClients();
                for (User client : clients) {
                %>
                <tr>
                    <td><%=client.getCid()%></td>
                    <td><%=client.getCname()%></td>
                    <td><%=client.getCemail()%></td>
                    <td><%=client.getSignupDate()%></td>
                    <td>
                        <form action="deleteClient" method="post">
                            <input type="hidden" name="cid" value="<%=client.getCid()%>" />
                            <button type="submit" class="btn btn-danger">Delete</button>
                        </form>
                    </td>
                </tr>
                <%
                }
                %>
            </tbody>
        </table>
    </div>
    
    <%@include file="footer.jsp" %>
    
    <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
    <script src="app.js"></script>
</body>
</html>
