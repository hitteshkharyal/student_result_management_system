<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Registration Successful</title>
    <!-- Redirect to login page after 10 seconds -->
    <meta http-equiv="refresh" content="10;URL=studentslogin.jsp">
    <style>
        body {
            background: #0f2027;
            font-family: Arial, sans-serif;
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .box {
            background-color: rgba(255,255,255,0.1);
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 10px black;
            text-align: center;
            width: 400px;
        }
        .success {
            color: lightgreen;
            font-size: 18px;
        }
        a {
            color: #90caf9;
            text-decoration: none;
            display: block;
            margin-top: 15px;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="box">
    <h2 class="success">Registration Successful!</h2>
    <p>You will be redirected to the login page in 10 seconds.</p>
    <a href="studentslogin.jsp">Click here if you are not redirected</a>
</div>
</body>
</html>
