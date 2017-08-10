<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>EmployeeEditor</title>
</head>
<body>
<%
 
try {
	String id=request.getParameter("sno");
	
	Connection con=null;
	PreparedStatement pst=null;
	
	Class.forName("com.mysql.jdbc.Driver");	
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/emsdb","root","");
	
	String sql = "select *from employees where sno='"+id+"'";
	
	ResultSet rs = pst.executeQuery(sql);
	out.println(id);
%>
	
<%} catch (Exception e) {
	e.printStackTrace();
} %>
</body>
</html>