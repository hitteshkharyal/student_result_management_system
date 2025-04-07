package com.student.model;

public class Student {
    private int rollNo;
    private String name;
    private String course;
    private String password; // New field

    // Getters and Setters
    public int getRollNo() { return rollNo; }
    public void setRollNo(int rollNo) { this.rollNo = rollNo; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getCourse() { return course; }
    public void setCourse(String course) { this.course = course; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
}
