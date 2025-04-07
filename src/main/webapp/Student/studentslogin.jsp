<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Student Login</title>
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
        .login-box {
            background-color: rgba(255, 255, 255, 0.1);
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px #000;
            width: 350px;
            text-align: center;
        }
        input[type="text"], input[type="password"], input[type="submit"] {
            width: 80%;
            padding: 10px;
            margin: 10px 0;
            border: none;
            border-radius: 5px;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            font-weight: bold;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        .register-link {
            margin-top: 15px;
            display: block;
            color: #90caf9;
            text-decoration: none;
            font-size: 14px;
        }
        .register-link:hover {
            text-decoration: underline;
        }
        .error-msg {
            color: #ff7070;
            font-size: 14px;
            margin-top: 10px;
        }
    </style>
</head>
<body>
<div class="login-box">
    <h2>Student Login</h2>
    <form action="viewMarks.jsp" method="post">
        <input type="text" name="rollNo" placeholder="Enter Roll Number" required><br>
        <input type="password" name="password" placeholder="Enter Password" required><br>
        <input type="submit" value="Login">
    </form>

    <!-- Link to Registration Page -->
    <a href="addStudent.jsp" class="register-link">New Student? Register here</a>
     <a href="../index.jsp" class="register-link">Go To Home</a>
    

    <%-- Error handling --%>
    <% if ("invalid".equals(request.getParameter("error"))) { %>
        <div class="error-msg">Invalid roll number or password!</div>
    <% } else if ("exception".equals(request.getParameter("error"))) { %>
        <div class="error-msg">Something went wrong. Please try again.</div>
    <% } %>
</div>
</body>
</html>
