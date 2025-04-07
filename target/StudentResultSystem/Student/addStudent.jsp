<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Student Registration</title>
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
        .form-box {
            background-color: rgba(255, 255, 255, 0.1);
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px #000;
            width: 400px;
        }
        input[type="text"], input[type="password"], input[type="submit"] {
            width: 90%;
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
    </style>
</head>
<body>
<div class="form-box">
    <h2>Student Registration</h2>
    <form action="../AddStudentServlet" method="post">
        Roll No: <input type="text" name="roll"><br>
        Name: <input type="text" name="name"><br>
        Course: <input type="text" name="course"><br>
        Password: <input type="password" name="password"><br>
        <input type="submit" value="Register">
    </form>
</div>
</body>
</html>
