package com.student.dao;

import java.sql.*;
import com.student.model.Student;

public class StudentDAO {
    public static Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/student_result", "root", "");
    }

    public static boolean insertStudent(Student student) {
        try (Connection con = getConnection()) {
            String query = "INSERT INTO students (roll_no, name, course, password) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, student.getRollNo());
            ps.setString(2, student.getName());
            ps.setString(3, student.getCourse());
            ps.setString(4, student.getPassword());  // 👈 new password field
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // ✅ Optional: For login verification (useful next step)
    public static boolean validateStudent(int rollNo, String password) {
        try (Connection con = getConnection()) {
            String query = "SELECT * FROM students WHERE roll_no = ? AND password = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, rollNo);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            return rs.next(); // true if a match is found
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
