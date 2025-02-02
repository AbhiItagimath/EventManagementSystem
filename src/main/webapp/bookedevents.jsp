<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.model.Dproduct"%>
<%@page import="com.model.Enquiry"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Booked Events</title>
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
        .btn-success {
            background-color: #28a745;
            color: #fff;
        }
        .btn-success:hover {
            background-color: #218838;
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
                <h3 class="header-text">Manage <b style="color: #fff;">Events</b></h3>
            </div>
        </div>
        <table class="table table-striped table-hover">
            <thead>
                <tr>
                    <th>Event ID</th>
                    <th>User Name</th>
                    <th>Email</th>
                    <th>Plan</th>
                    <th>Cost</th>
                    <th>Event Date</th>
                    <th>Booked Date</th>
                    <th>Address</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <%
                Enquiry s1 = new Enquiry(session);
                ArrayList<Dproduct> ar = s1.geteventstatusAdmin();
                Iterator<Dproduct> itr = ar.iterator();
                while (itr.hasNext()) {
                    Dproduct s = itr.next();
                %>
                <tr>
                    <td><%=s.getEvent_id()%></td>
                    <td><%=s.getUser_name()%></td>
                    <td><%=s.getEmail()%></td>
                    <td><%=s.getPlan()%></td>
                    <td><%=s.getCost()%></td>
                    <td><%=s.getEventdate()%></td>
                    <td><%=s.getBookeddate()%></td>
                    <td><%=s.getAddress()%></td>
                    <%
                    if (s.getStatus().equals("pending")) {
                    %>
                    <td style="color: blue">
                        <form action="register" method="post">
                            <input type="hidden" name="event_id" value="<%=s.getEvent_id()%>" />
                            <button type="submit" class="btn btn-success" name="status" value="accepted">Accept</button>
                            <button type="submit" class="btn btn-danger" name="status" value="rejected">Reject</button>
                        </form>
                    </td>
                    <%
                    } else if (s.getStatus().equals("accepted")) {
                    %>
                    <td style="color: green"><%=s.getStatus()%></td>
                    <%
                    } else if (s.getStatus().equals("rejected")) {
                    %>
                    <td style="color: red"><%=s.getStatus()%></td>
                    <%
                    }
                    %>
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
