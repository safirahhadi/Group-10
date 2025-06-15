
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
    Document   : login
    Created on : Jun 12, 2025, 1:05:34 PM
    Author     : Safirahhadi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Login</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        
    </head>
    <body>
        
        <!-- Login 6 - Bootstrap Brain Component -->
        <section class="p-3 p-md-4 p-xl-5 d-flex align-items-center" style="height:100vh; background-color: #8b0000;">
            <div class="container ">
                <div class="row justify-content-center">
                    <div class="col-12 col-md-9 col-lg-7 col-xl-6 col-xxl-5">
                        <div class="card border-0 shadow-sm rounded-4">
                            <div class="card-body p-3 p-md-4 p-xl-5">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="mb-5">
                                            <h3>Register</h3>
                                        </div>
                                    </div>
                                </div>
                                <c:if test="${error!=null}">
                                    <div class="row">
                                        <div class="alert alert-warning" role="alert">
                                            Error occured: <c:out value="error"/>
                                        </div>
                                    </div>
                                </c:if>

                                <c:if test="${message!=null}">
                                    <div class="row">
                                        <div class="alert alert-success" role="alert">
                                            <c:out value="message"/>
                                        </div>
                                    </div>
                                </c:if>


                                <form action="register" method="post">
                                    <div class="row gy-3 overflow-hidden">
                                        <div class="col-12">
                                            <div class="form-floating mb-3">
                                                <input type="text" class="form-control" name="firstName" id="firstName" placeholder="name@example.com" required>
                                                <label for="firstName" class="form-label">First Name</label>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-floating mb-3">
                                                <input type="text" class="form-control" name="lastName" id="lastName" placeholder="name@example.com" required>
                                                <label for="lastName" class="form-label">Last Name</label>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-floating mb-3">
                                                <input type="number" class="form-control" name="contact" id="contact" placeholder="name@example.com" required>
                                                <label for="contact" class="form-label">Contact Number</label>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-floating mb-3">
                                                <input type="email" class="form-control" name="email" id="email" placeholder="name@example.com" required>
                                                <label for="email" class="form-label">Email</label>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-floating mb-3">
                                                <input type="password" class="form-control" name="password" id="password" value="" placeholder="Password" required>
                                                <label for="password" class="form-label">Password</label>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="d-grid">
                                                <button class="btn bsb-btn-2xl btn-primary" type="submit" style="background-color: #8b0000;">Register now</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                                <div class="row">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    </body>
</html>