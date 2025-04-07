package com.student.servlet;

import com.student.dao.StudentDAO;
import com.student.model.Student;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class AddStudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try {
            int roll = Integer.parseInt(req.getParameter("roll"));
            String name = req.getParameter("name");
            String course = req.getParameter("course");
            String password = req.getParameter("password"); // ✅ Get password

            Student student = new Student();
            student.setRollNo(roll);
            student.setName(name);
            student.setCourse(course);
            student.setPassword(password); // ✅ Set password

            boolean status = StudentDAO.insertStudent(student);

            res.sendRedirect("Student/added.jsp?status=" + status);
        } catch (Exception e) {
            e.printStackTrace();
            res.sendRedirect("Student/addStudent.jsp?status=false");
        }
    }
}
