<%-- 
    Document   : main
    Created on : Jun 12, 2025, 9:28:19 AM
    Author     : Safirahhadi
--%>

<!DOCTYPE html>
<html>
    <head>
        <title>Hotel Management System</title>
        <style>
            body, html {
                margin: 0;
                padding: 0;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background: url('img/hotel-bg.jpg') no-repeat center center fixed;
                background-size: cover;
                text-align: center;
                color: #400000;
                position: relative;
            }
          
            /* Optional overlay for readability */
            body::before {
                content: "";
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(255, 255, 255, 0.3);
                z-index: -1;
            }

            .logo-container {
                background-color: #8B0000;
                padding: 15px 0;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
            }

            .logo {
                height: 90px;
            }

            h1 {
                color: #8B0000;
                font-size: 36px;
                margin: 50px 0 20px;
                text-shadow: 1px 1px 2px #fff;
            }

            .module-buttons {
                margin-top: 40px;
            }

            .module-buttons a {
                display: inline-block;
                margin: 20px;
                padding: 20px 50px;
                font-size: 18px;
                text-decoration: none;
                background-color: #B22222;
                color: white;
                border: 2px solid #8B0000;
                border-radius: 12px;
                box-shadow: 0 4px 10px rgba(0,0,0,0.2);
                transition: background-color 0.3s, transform 0.3s;
            }

            .module-buttons a:hover {
                background-color: #8B0000;
                transform: translateY(-3px);
            }
        </style>
    </head>
    <body>
        <header>   
            <div class="logo-container">
                <img src="img/hotel-logo.png" alt="Hotel Logo" class="logo">
            </div>
        </header>

        <h1>Welcome to Hotel Management System</h1>

        <div class="module-buttons">
            <a href="${pageContext.request.contextPath}/customer">Customer Management</a>
            <a href="${pageContext.request.contextPath}/booking">Booking Management</a>
            <a href="${pageContext.request.contextPath}/listRooms">Rooms Management</a>
        </div>
    </body>
</html>
