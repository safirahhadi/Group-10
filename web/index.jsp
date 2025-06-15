<%-- 
    Document   : index
    Created on : Jun 12, 2025, 10:22:12 PM
    Author     : Safirahhadi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>G10 Hotel</title>
        <style>
            body {
                margin: 0;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background: url('img/hotel_background.jpg') no-repeat center center/cover;
                color: #fff;
            }
            .overlay {
                background-color: rgba(0, 0, 0, 0.6);
                padding: 50px 20px;
                min-height: 100vh;
                text-align: center;
            }
            .container {
                max-width: 800px;
                margin: auto;
            }
            h1 {
                font-size: 3em;
                margin-bottom: 10px;
            }
            p {
                font-size: 1.2em;
                margin-bottom: 40px;
            }
            .buttons a {
                text-decoration: none;
                margin: 0 10px;
                padding: 12px 24px;
                font-size: 1em;
                border: none;
                border-radius: 5px;
                background-color: #8b0000;
                color: #fff;
                transition: background 0.3s;
            }
            .buttons a:hover {
                background-color: #ffaa00;
            }
        </style>
    </head>
    <body>
        <div class="overlay">
            <div class="container">
                <h1>Welcome to G10 Hotel!</h1>
                <p>
                    Discover ultimate comfort and breathtaking ocean views at G10 Hotel.
                    Whether you're traveling for leisure or business, our luxurious rooms, fine dining,
                    and world-class service await you.
                </p>
                <div class="buttons">
                    <a href="${pageContext.request.contextPath}/login">Log In</a>
                    <a href="${pageContext.request.contextPath}/register">Sign Up</a>
                </div>
            </div>
        </div>
    </body>
</html>