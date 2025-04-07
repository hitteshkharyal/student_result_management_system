<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<%
    String adminId = (String) session.getAttribute("adminId");
    if (adminId == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }

    String msg = "";

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String rollNo = request.getParameter("rollNo");
        String subject1 = request.getParameter("subject1");
        String subject2 = request.getParameter("subject2");
        String subject3 = request.getParameter("subject3");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_result", "root", "");

            int s1 = Integer.parseInt(subject1);
            int s2 = Integer.parseInt(subject2);
            int s3 = Integer.parseInt(subject3);
            int total = s1 + s2 + s3;
            String grade = (total >= 270) ? "A" : (total >= 210) ? "B" : (total >= 150) ? "C" : "F";

            PreparedStatement check = con.prepareStatement("SELECT * FROM result WHERE roll_no=?");
            check.setString(1, rollNo);
            ResultSet checkRS = check.executeQuery();

            if (checkRS.next()) {
                PreparedStatement update = con.prepareStatement(
                    "UPDATE result SET subject1=?, subject2=?, subject3=?, total=?, grade=? WHERE roll_no=?"
                );
                update.setInt(1, s1);
                update.setInt(2, s2);
                update.setInt(3, s3);
                update.setInt(4, total);
                update.setString(5, grade);
                update.setString(6, rollNo);
                update.executeUpdate();
                msg = "Updated successfully for Roll No: " + rollNo;
            } else {
                PreparedStatement insert = con.prepareStatement(
                    "INSERT INTO result (roll_no, subject1, subject2, subject3, total, grade) VALUES (?, ?, ?, ?, ?, ?)"
                );
                insert.setString(1, rollNo);
                insert.setInt(2, s1);
                insert.setInt(3, s2);
                insert.setInt(4, s3);
                insert.setInt(5, total);
                insert.setString(6, grade);
                insert.executeUpdate();
                msg = "Inserted successfully for Roll No: " + rollNo;
            }

            checkRS.close();
            check.close();
            con.close();
        } catch (Exception e) {
            msg = "Error: " + e.getMessage();
        }
    }

    // Fetch student data
    ResultSet rs = null;
    Connection con = null;
    Statement stmt = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_result", "root", "");
        stmt = con.createStatement();
        rs = stmt.executeQuery("SELECT * FROM students");
    } catch (Exception e) {
        msg = "Database Error: " + e.getMessage();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        body {
            background: #0f2027;
            font-family: Arial, sans-serif;
            color: white;
            padding: 30px;
        }
        h2 {
            text-align: center;
        }
        .msg {
            color: lightgreen;
            text-align: center;
        }
        table {
            width: 100%;
            background-color: rgba(255,255,255,0.1);
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 10px;
            border: 1px solid #fff3;
            text-align: center;
        }
        input[type="number"] {
            width: 60px;
        }
        input[type="submit"] {
            padding: 5px 10px;
            background: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        #one {
            padding: 5px 10px;
            background: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            float:right;
        }
        #two{
            text-decoration: none;
            color:white;
        }
        
    </style>
</head>
<body>

<h2>Welcome Admin - Dashboard</h2>
<button value="Back"id="one"><a href="../index.jsp" id="two">Back</a></button>

<% if (!msg.isEmpty()) { %>
    <div class="msg"><%= msg %></div>
<% } %>

<table>
    <tr>
        <th>Roll No</th>
        <th>Name</th>
        <th>Course</th>
        <th>Subject 1</th>
        <th>Subject 2</th>
        <th>Subject 3</th>
        <th>Total</th>
        <th>Grade</th>
        <th>Action</th>
    </tr>

<%
    if (rs != null) {
        while (rs.next()) {
            String rollNo = rs.getString("roll_no");
            String name = rs.getString("name");
            String course = rs.getString("course");

            // Fetch result for this student
            PreparedStatement psResult = con.prepareStatement("SELECT * FROM result WHERE roll_no=?");
            psResult.setString(1, rollNo);
            ResultSet resultRS = psResult.executeQuery();

            int s1 = 0, s2 = 0, s3 = 0, total = 0;
            String grade = "", button = "Submit";

            if (resultRS.next()) {
                s1 = resultRS.getInt("subject1");
                s2 = resultRS.getInt("subject2");
                s3 = resultRS.getInt("subject3");
                total = resultRS.getInt("total");
                grade = resultRS.getString("grade");
                button = "Edit";
            }
%>
    <tr>
        <form method="post">
            <td>
                <%= rollNo %>
                <input type="hidden" name="rollNo" value="<%= rollNo %>">
            </td>
            <td><%= name %></td>
            <td><%= course %></td>
            <td><input type="number" name="subject1" value="<%= s1 %>" required></td>
            <td><input type="number" name="subject2" value="<%= s2 %>" required></td>
            <td><input type="number" name="subject3" value="<%= s3 %>" required></td>
            <td><%= (total > 0 ? total : "-") %></td>
            <td><%= (grade != null && !grade.isEmpty() ? grade : "-") %></td>
            <td><input type="submit" value="<%= button %>"></td>
        </form>
    </tr>
<%
            resultRS.close();
            psResult.close();
        }
        rs.close();
        stmt.close();
        con.close();
    }
%>
</table>



</body>
</html>
