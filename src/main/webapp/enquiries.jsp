<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.model.Enquiry, com.model.UserEnquiry" %>
<%
    HttpSession sessions = request.getSession();
    Enquiry enq = new Enquiry(sessions);
    ArrayList<UserEnquiry> enquiriesList = enq.getAllEnquiries();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Enquiries</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css">
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <%@ include file="navbar.jsp" %>

    <div class="container"  style="margin-top: 40px">
        <h3 class="header-text" style="text-align: center; font-size: 40px; color: #3867d6;">All <b style="color: #fff">Enquiries</b></h3>
        <table class="table table-striped table-hover">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Telephone</th>
                    <th>Subject</th>
                    <th>Message</th>
                    <th>Submitted At</th>
                </tr>
            </thead>
            <tbody>
                <% if (enquiriesList != null && !enquiriesList.isEmpty()) {
                       for (UserEnquiry enquiry : enquiriesList) { %>
                <tr>
                    <td><%= enquiry.getId() %></td>
                    <td><%= enquiry.getName() %></td>
                    <td><%= enquiry.getEmail() %></td>
                    <td><%= enquiry.getTel() %></td>
                    <td><%= enquiry.getSubject() %></td>
                    <td><%= enquiry.getMessage() %></td>
                    <td><%= enquiry.getSubmittedAt() %></td>
                </tr>
                <%    }
                   } else { %>
                <tr>
                    <td colspan="7">No enquiries found.</td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>

    <%@ include file="footer.jsp" %>
</body>
</html>
