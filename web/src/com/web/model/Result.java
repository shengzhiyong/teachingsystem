package com.web.model;

public class Result {

	private Long id;
	private String coursename;
	private String major;
	private Integer teacher_id;
	private Integer student_id;
	private String result;
	private String teacherName;
	private String studentName;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String getCoursename() {
		return coursename;
	}
	public void setCoursename(String coursename) {
		this.coursename = coursename;
	}
	public String getTeacherName() {
		return teacherName;
	}
	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public Integer getTeacher_id() {
		return teacher_id;
	}
	public void setTeacher_id(Integer teacherId) {
		teacher_id = teacherId;
	}
	public Integer getStudent_id() {
		return student_id;
	}
	public void setStudent_id(Integer studentId) {
		student_id = studentId;
	}
	
	
}
