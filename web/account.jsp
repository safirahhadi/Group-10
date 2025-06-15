<%-- 
    Document   : customer-form
    Created on : May 18, 2025, 6:05:00 PM
    Author     : Safirahhadi
--%>

<%@page import="Model.User"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    User user = (User) request.getAttribute("user");
%>
<html>
    <head>
        <title>User Account</title>
        <link rel="stylesheet" href="css/style.css">
        <script src="js/validate.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

    </head>
    <body>
        <!--        <header>
                    <div class="logo-container">
                        <img src="img/hotel-logo.png" alt="Hotel Logo" class="logo">
                    </div>
                </header>-->

        <jsp:include page="header.jsp"/>
        <h2>User Account</h2>
        <form action="account" method="POST" onsubmit="return validateForm()">
            <input type="hidden" name="id" value="<%=user.getId()%>">
            <label>First Name: <input type="text" name="first_name" value="<%=user.getFirstName()%>" required></label><br>
            <label>Last Name: <input type="text" name="last_name" value="<%=user.getLastName()%>" required></label><br>
            <label>Contact Number: <input type="text" name="contact_number" value="<%=user.getContactNumber()%>" required></label><br>
            <label>Email: <input type="email" name="email" value="<%=user.getEmail()%>" required></label><br>
            <input type="submit" value="Edit">
        </form>
        <a href="customer">Back to List</a>
    </body>
</html>