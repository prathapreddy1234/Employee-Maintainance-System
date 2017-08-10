<%@page import="java.util.Properties"%>
<%@page import="com.c2n.action.DBConnection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
Connection con = null;
ResultSet rs = null;
String uname=request.getParameter("flag");
DBConnection obj=new DBConnection();
Properties prop=obj.loadproperties();
String driver=prop.getProperty("driver");
String url = prop.getProperty("url");
String dbusername = prop.getProperty("usernamedb");
String dbpassword = prop.getProperty("passworddb");
Class.forName(driver);
con = DriverManager.getConnection(url, dbusername, dbpassword);
Statement st=con.createStatement();
                    //ResultSet rs = st.executeQuery("select * from emp where empno="+sn);
                    rs = st.executeQuery("select * from employees where username='"+uname+"'");   
                    if(rs.next())
                    {    
                        out.println("<font color=red>");
                        out.println("Name already taken");
                        out.println("</font>");
 
                    }else {
 
                        out.println("<font color=green>");
                        out.println("Available");
                        out.println("</font>");
                    }
 
rs.close();
st.close();
con.close();
 %>
</body>
</html>