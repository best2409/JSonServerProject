<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
<%@ page import="java.sql.*" %>
<%@ page import="exam.member.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	/* create table members
	(
		user_name		varchar(20),
		user_pwd		varchar(20),
		user_email		varchar(100)
	) */
	
	
	String userName = request.getParameter("userName");
	String userPwd = request.getParameter("userPwd");
	String userEmail = request.getParameter("userEmail");
	
	String dbUrl = "jdbc:mysql://localhost:3306/spring";
	Connection con = null;
	PreparedStatement pstmt = null;
	
	
	// DB 연결 
	try {
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection(dbUrl, "root", "spring1234");
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		System.out.println("Connection");
	} catch(SQLException e) {
		System.out.println("SQL");
	}
	
	// 회원가입(insert)
	String sql = "insert into members values(?, ?, ?)";
	try {
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, userName);
		pstmt.setString(2, userPwd);
		pstmt.setString(3, userEmail);
		pstmt.execute();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
%>