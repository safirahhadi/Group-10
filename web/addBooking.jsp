<%-- 
    Document   : addBooking
    Created on : Jun 11, 2025, 5:58:07 PM
    Author     : Che Zulaika
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Add Booking</title>
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
        <div class="container">
            <h1 class="text-white mt-3 text-center">Add New Booking</h1>
            <form action="booking?action=insert" method="post" onsubmit="return validateForm()">
                <input type="hidden" name="customerId" value="${customerId}">
                <label>Customer Email:</label>
                <input type="text" name="email" id="customerEmail" value="${email}"  readonly>

                <label class="mt-3">Room Number:</label>
                <input type="number" name="roomNumber" value="${roomNumber}"  readonly>

                <label class="mt-3">Check-In Date:</label>
                <input type="date" name="checkIn" required>

                <label class="mt-3">Check-Out Date:</label>
                <input type="date" name="checkOut" required>
                
                <br>
                <button type="submit" class="btn btn-primary mt-3">Book</button>
            </form>
        </div>
    </body>
</html>
