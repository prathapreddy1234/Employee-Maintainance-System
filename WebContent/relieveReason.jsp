<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Properties"%>
<%@page import="com.c2n.action.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>StoresReason</title>
</head>
<body>
<%
try{
	out.print("coming.....");
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	DBConnection obj=new DBConnection();
	Properties prop=obj.loadproperties();
	String driver=prop.getProperty("driver");
	String url=prop.getProperty("url");
	String dbusername=prop.getProperty("usernamedb");
	String dbpassword=prop.getProperty("passworddb");
	Class.forName(driver);
	con=DriverManager.getConnection(url,dbusername,dbpassword);
	String reason=request.getParameter("reason");
	String query="UPDATE employees SET reason='"+reason+"' WHERE sno='"+session.getAttribute("ID")+"'";
	out.print(reason);
	System.out.print(reason);
	ps=con.prepareStatement(query);
	ps.executeUpdate();
	out.print("<h1>submittedsuccessfully updated...</h1>"); 
	out.print("submitted...");
}
catch(Exception e){
	e.printStackTrace();
}
%>
</body>
</html>