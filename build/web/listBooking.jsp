<%-- 
    Document   : listBooking
    Created on : Jun 11, 2025, 5:58:29 PM
    Author     : Che Zulaika
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, Model.Booking" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.Date" %>

<html>
    <head>
        <title>Booking Management</title>
        <link rel="stylesheet" href="css/style2.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

    </head>
    <body>
        <!--        <header>
                    <div class="logo-container">
                        <img src="img/hotel-logo.png" alt="Hotel Logo" class="logo">
                    </div>
                </header>-->

        <jsp:include page="header.jsp"/>
        <div class="container mt-3">
            <h2>Booking List</h2>

            <c:if test="${empty listBookings}">
                <div class="text-center">NO BOOKING YET</div>
            </c:if>
            <c:if test="${not empty listBookings}">

                <!--<a href="booking?action=new" class="btn">Add New Booking</a>-->
                <table class="text-center">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Customer ID</th>
                            <th>Room No</th>
                            <th>Check-In</th>
                            <th>Check-Out</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>

                        <c:forEach items="${listBookings}" var="booking">

                            <tr>
                                <td><c:out value="${booking.bookingId}"/></td>
                                <td><c:out value="${booking.customerId}"/></td>
                                <td><c:out value="${booking.roomNumber}"/></td>
                                <td><c:out value="${booking.checkIn}"/></td>
                                <td><c:out value="${booking.checkOut}"/></td>
                                <td class="text-capitalize">
                                    <form action="${pageContext.request.contextPath}/booking?action=update" method="post">

                                        <input type="hidden" name="bookingId" value="${booking.bookingId}">
                                        <select name="status" class="form-select d-inline-block w-50" aria-label="Default select example"  >
                                            <option value="">Open this select menu</option>
                                            <option value="pending" ${booking.status == 'pending' ? 'selected' : ''}>Pending</option>
                                            <option value="confirmed" ${booking.status == 'confirmed' ? 'selected' : ''}>Confirmed</option>
                                            <option value="cancelled" ${booking.status == 'cancelled' ? 'selected' : ''}>Cancelled</option>
                                        </select>
                                        <input type="submit" value="Update" class="btn btn-success">
                                    </form>
                                </td>
                                <td>
                                    <a href="booking?action=delete&id=<c:out value="${booking.bookingId}"/>"
                                       onclick="return confirm('Are you sure?')">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>
        </div>
    </body>
</html>
