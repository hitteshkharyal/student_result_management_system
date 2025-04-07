<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<%
    String message = "";

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String id = request.getParameter("id");
        String password = request.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/student_result", "root", "");

            PreparedStatement ps = con.prepareStatement("SELECT * FROM admin WHERE id = ? AND password = ?");
            ps.setString(1, id);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                session.setAttribute("adminId", id);
                response.sendRedirect("dashboard.jsp");
                return;
            } else {
                message = "Invalid ID or Password!";
            }

            rs.close();
            ps.close();
            con.close();
        } catch (Exception e) {
            message = "Something went wrong: " + e.getMessage();
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #2c5364, #203a43, #0f2027);
            color: white;
            
        }
        .flex{
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }
        
        .login-box {
            background: rgba(255,255,255,0.1);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0,0,0,0.4);
            width: 320px;
        }
        h2 {
            text-align: center;
            margin-bottom: 25px;
        }
        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 8px;
            border: none;
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background: #4CAF50;
            color: white;
            border: none;
            border-radius: 8px;
            font-weight: bold;
            cursor: pointer;
        }
        .error {
            color: #ff8080;
            text-align: center;
            margin-bottom: 10px;
        }
        #one {
            padding: 5px 10px;
            background: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            position:relative;
            left:5px;
            top:5px;
        }
        #two{
            text-decoration: none;
            color:white;
        }
    </style>
</head>
<body>
    <button value="Back"id="one"><a href="../index.jsp" id="two">Back to home</a></button>
    <div class="flex">
<div class="login-box">
    <h2>Admin Login</h2>
    <form method="post">
        <input type="text" name="id" placeholder="Admin ID" required>
        <input type="password" name="password" placeholder="Password" required>
        <input type="submit" value="Login">
        <% if (!message.isEmpty()) { %>
            <div class="error"><%= message %></div>
        <% } %>
        
    </form>
  </div>
  </div>
</body>
</html>
