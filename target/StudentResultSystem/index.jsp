<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Result Management System</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #6dd5ed, #2193b0);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
        }
        .container {
            text-align: center;
            background: rgba(0, 0, 0, 0.3);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.3);
        }
        h2 {
            font-size: 2rem;
            margin-bottom: 20px;
        }
        a {
            display: inline-block;
            margin-top: 20px;
            padding: 12px 25px;
            background-color: #ffffff;
            color: #2193b0;
            border-radius: 10px;
            text-decoration: none;
            font-weight: bold;
            transition: 0.3s ease;
        }
        a:hover {
            background-color: #2193b0;
            color: white;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Welcome to Student Result Management System</h2>
        <a href="admin/adminlogin.jsp">Admin Panel</a>
        <a href="Student/studentslogin.jsp">Student Panel</a>
    </div>
</body>
</html>
