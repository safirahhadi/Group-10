<%-- 
    Document   : listRooms
    Created on : 1 Jun 2025, 12:18:09 PM
    Author     : Qina Najwa
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Model.Room" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Room's List</title>
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
            <h2>Senarai Bilik Hotel</h2>
            <c:if test="${user.role == 'admin'}">
                <a href="addRoom?action=new" class="btn">Add New Room</a>
            </c:if>
            <c:if test="${empty roomLists}">
                <div class="text-center">Tiada bilik disediakan buat masa kini.</div>
            </c:if>

            <c:if test="${not empty roomLists}">
                <table class="text-center">
                    <tr style="background-color: #f2f2f2;">
                        <th>No. Bilik</th>
                        <th>Gambar</th>
                        <th>Jenis</th>
                        <th>Harga (RM)</th>
                        <th>Status</th>

                        <th>Tindakan</th>
                    </tr>


                    <c:forEach items="${roomLists}" var="room">

                        <tr>
                            
                            <td><c:out value="${room.roomNumber}"/></td>
                            <td>
                                <img src="img/<c:out value="${fn:toLowerCase(room.roomType)}"/>.jpg" 
                                     width="100" height="70" alt="Gambar Bilik">
                            </td>
                            <td><c:out value="${room.roomType}"/></td>
                            <td><c:out value="${room.pricePerNight}"/></td>
                            <td><c:out value="${room.availability?'Tersedia':'Tidak'}"/></td>

                            <c:if test="${user.role == 'admin'}">
                                <td>
                                    <a href="updateRoom?roomNumber=<c:out value="${room.roomNumber}"/>">Edit</a> |
                                    <a href="deleteRoom?roomNumber=<c:out value="${room.roomNumber}"/>" onclick="return confirm('Padam bilik ini?');">Padam</a>
                                </td>
                            </c:if>
                            <c:if test="${user.role == 'customer'}">
                                <td>
                                    <form action="${pageContext.request.contextPath}/booking?action=new" method="post">
                                        <input type="hidden" name="customerId" value="<c:out value='${user.id}'/>">
                                        <input type="hidden" name="email" value="<c:out value="${user.email}"/>">
                                        <input type="hidden" name="roomNumber" value="<c:out value="${room.roomNumber}"/>">
                                        <input type="submit" value="Booking" class="btn btn-primary" ${room.availability == 'Tidak' ? 'disabled' : ''}>

                                    </form>
                                </td>
                            </c:if>
                        </tr>
                    </c:forEach>
                </table>
            </c:if>
            <br>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

    </body>
</html>