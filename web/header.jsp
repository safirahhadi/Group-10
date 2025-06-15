<%-- 
    Document   : header.jsp
    Created on : 12 Jun 2025, 8:01:41 pm
    Author     : Aiman
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header class="p-0">
    <jsp:useBean id="user" class="Model.User" scope="session"/>
    <nav class="navbar navbar-expand-lg fs-5  p-0">
        <div class="container-fluid ">
            <a class="navbar-brand logo-container m-0" href="${pageContext.request.contextPath}"><img src="img/hotel-logo.png" alt="Hotel Logo" class="logo" ></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                <div class="navbar-nav">
                    <c:if test="${user.id!=0}">
                        <c:if test="${user.role == 'customer'}">
                    <a class="text-white nav-link" href="${pageContext.request.contextPath}/listRooms">Book</a>
                        <a class="text-white nav-link " href="${pageContext.request.contextPath}/account">Account</a>
                        <a class="text-white nav-link " href="${pageContext.request.contextPath}/viewBooking?id=${user.id}">Booking</a>
                        
                    </c:if>
                        <c:if test="${user.role == 'admin'}">
                    <a class="text-white nav-link" href="${pageContext.request.contextPath}/listRooms">List Rooms</a>
                        <a class="text-white nav-link " href="${pageContext.request.contextPath}/booking">Booking</a>
                        <a class="text-white nav-link " href="${pageContext.request.contextPath}/viewCustomer">Customer</a>
                        
                    </c:if>
                        <a class="text-white nav-link " href="${pageContext.request.contextPath}/logout">Logout</a>
                    </c:if>
                    <c:if test="${user.id==0}">
                        <a class="text-white nav-link" href="${pageContext.request.contextPath}/login">Log in</a>
                        
                    </c:if>
                </div>
            </div>
        </div>
    </nav>
</header>