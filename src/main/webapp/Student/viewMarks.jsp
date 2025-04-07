<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Student Result</title>
    <style>
        body {
            background: #0f2027;
            font-family: Arial, sans-serif;
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            height: 100vh;
            margin: 0;
        }
        .result-box {
            background-color: rgba(255, 255, 255, 0.1);
            padding: 30px;
            border-radius: 10px;
            width: 400px;
            box-shadow: 0px 0px 10px #000;
            margin-bottom: 20px;
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            color: white;
        }
        td {
            padding: 8px;
            text-align: left;
        }
        .error {
            color: red;
            text-align: center;
        }
        .button-group {
            display: flex;
            gap: 15px;
        }
        .btn {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            cursor: pointer;
            font-weight: bold;
        }
        .btn:hover {
            background-color: #388e3c;
        }
    </style>
</head>
<body>

<%
    String rollNo = request.getParameter("rollNo");
    boolean studentFound = false;
    String name = "", course = "";
    int subject1 = 0, subject2 = 0, subject3 = 0, total = 0;
    String grade = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_result", "root", "");

        // Fetch student details
        PreparedStatement ps1 = con.prepareStatement("SELECT * FROM students WHERE roll_no = ?");
        ps1.setString(1, rollNo);
        ResultSet rs1 = ps1.executeQuery();

        if (rs1.next()) {
            studentFound = true;
            name = rs1.getString("name");
            course = rs1.getString("course");
        }

        // Fetch result details
        if (studentFound) {
            PreparedStatement ps2 = con.prepareStatement("SELECT * FROM result WHERE roll_no = ?");
            ps2.setString(1, rollNo);
            ResultSet rs2 = ps2.executeQuery();

            if (rs2.next()) {
                subject1 = rs2.getInt("subject1");
                subject2 = rs2.getInt("subject2");
                subject3 = rs2.getInt("subject3");
                total = rs2.getInt("total");
                grade = rs2.getString("grade");
            } else {
                grade = "Not Yet Uploaded";
            }

            rs2.close();
            ps2.close();
        }

        rs1.close();
        ps1.close();
        con.close();
    } catch (Exception e) {
        out.println("<div class='error'>Database Error: " + e.getMessage() + "</div>");
    }

    if (studentFound) {
%>
    <div class="result-box" id="resultBox">
        <h2>Student Result</h2>
        <table>
            <tr><td><strong>Roll No:</strong></td><td><%= rollNo %></td></tr>
            <tr><td><strong>Name:</strong></td><td><%= name %></td></tr>
            <tr><td><strong>Course:</strong></td><td><%= course %></td></tr>
            <tr><td><strong>Subject 1:</strong></td><td><%= subject1 %></td></tr>
            <tr><td><strong>Subject 2:</strong></td><td><%= subject2 %></td></tr>
            <tr><td><strong>Subject 3:</strong></td><td><%= subject3 %></td></tr>
            <tr><td><strong>Total:</strong></td><td><%= total %></td></tr>
            <tr><td><strong>Grade:</strong></td><td><%= grade %></td></tr>
        </table>
    </div>

    <div class="button-group">
        <a href="../index.jsp" class="btn">Back</a>
        <button class="btn" onclick="printResult()">Print</button>
    </div>

    <script>
        function printResult() {
            const originalContent = document.body.innerHTML;
            const printContent = document.getElementById("resultBox").innerHTML;
            document.body.innerHTML = "<h2 style='text-align:center;'>Student Result</h2>" + printContent;
            window.print();
            document.body.innerHTML = originalContent;
        }
    </script>

<%
    } else {
%>
    <div class="error">Student with Roll No <strong><%= rollNo %></strong> not found.</div>
    <a href="../index.jsp" class="btn">Back</a>
<%
    }
%>

</body>
</html>
