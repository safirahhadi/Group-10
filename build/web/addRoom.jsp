<%-- 
    Document   : addRoom
    Created on : 1 Jun 2025, 12:17:49 PM
    Author     : Qina Najwa
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Tambah Bilik Baru</title>
        <link rel="stylesheet" href="css/style.css">
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
            <h2>Tambah Bilik Baru</h2>
            <form action="addRoom" method="post">
                <label for="roomNumber">Nombor Bilik:</label>
                <input type="number" min="100" name="roomNumber" required><br><br>

                <label for="roomType">Jenis Bilik:</label>
                <select name="roomType" class="form-select" aria-label="Default select example">
                    <option selected>Open this select menu</option>
                    <option value="Single" ${room.roomType == 'Single' ? 'selected' : ''}>Single</option>
                    <option value="Double" ${room.roomType == 'Double' ? 'selected' : ''}>Double</option>
                    <option value="King" ${room.roomType == 'King' ? 'selected' : ''}>King</option>
                </select>
                <label for="pricePerNight">Harga per Malam (RM):</label>
                <input type="number" step="0.01" name="pricePerNight" required><br><br>

                <label>Tersedia:</label>
                <input type="checkbox" name="availability"><br><br>

                <input type="submit" value="Simpan">
            </form>
        </div>
    </body>
