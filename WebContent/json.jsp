<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="org.json.simple.*"%>

<%

	String userName = request.getParameter("userName");
	
	out.println(userName);
	
%>