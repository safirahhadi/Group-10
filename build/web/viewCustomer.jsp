
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customers List</title>
        <link rel="stylesheet" href="css/style2.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

    </head>
    <body><jsp:include page="header.jsp"/>
        <div class="container mt-3">
            <h2>Customers List</h2>

            <c:if test="${empty customers}">
                <div class="text-center">NO CUSTOMERS EXISTS</div>
            </c:if>
            <c:if test="${not empty customers}">

                <!--<a href="booking?action=new" class="btn">Add New Booking</a>-->
                <table class="text-center">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Contact Number</th>
                            <th>Email</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                    
                    <c:forEach items="${customers}" var="customer">

                        <tr>
                            <td><c:out value="${customer.id}"/></td>
                        <td><c:out value="${customer.firstName}"/></td>
                        <td><c:out value="${customer.lastName}"/></td>
                        <td><c:out value="${customer.email}"/></td>
                        <td><c:out value="${customer.contactNumber}"/></td>
                        <td>
                            <a class="btn btn-danger" href="deleteCustomer?id=${customer.id}">Delete</a>
                        </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="alert alert-success" role="alert">
                    To delete a customer account, each booking correlated with must be deleted first.
                </div>
            </c:if>
        </div>
    </body>
</html>
