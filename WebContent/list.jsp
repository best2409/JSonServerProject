<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="org.json.simple.*" %>
 <%
	String dbUrl = "jdbc:mysql://localhost:3306/spring";
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
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
	
	// 회원리스트 (select)
	JSONArray arrayObj = new JSONArray();
	JSONObject obj = null;
	
	String sql = "select * from members";
	try {
		pstmt = con.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
		
		// rs -> json
		while(rs.next()) {
			obj = new JSONObject();
			obj.put("userName", rs.getString("user_name"));
			obj.put("userPwd", rs.getString("user_pwd"));
			obj.put("userEmail", rs.getString("user_email"));
			
			arrayObj.add(obj);
		}
		
		out.print(arrayObj);
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	try {
		rs.close();
		pstmt.close();
		con.close();
		
		rs = null;
		pstmt = null;
		con = null; 
	} catch(Exception e) {
		
	} 
%>