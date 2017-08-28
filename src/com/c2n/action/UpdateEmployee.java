package com.c2n.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/UpdateEmployee")
public class UpdateEmployee extends HttpServlet{
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		try {
			DBConnection obj=new DBConnection();
			Properties prop=obj.loadproperties();
			String driver=prop.getProperty("driver");
			String url=prop.getProperty("url");
			String dbusername=prop.getProperty("usernamedb");
			String dbpassword=prop.getProperty("passworddb");
			
			String name=request.getParameter("name");
			String email=request.getParameter("email");
			String phone=request.getParameter("phone");
			
			
			System.out.println(name);
			System.out.println(email);
			System.out.println(phone);
			Class.forName(driver);
			con=DriverManager.getConnection(url,dbusername,dbpassword);
			
			ps=con.prepareStatement("UPDATE employees SET name='"+name+"' , email='"+email+"' , phonenumber='"+phone+"' WHERE employeeid='"+session.getAttribute("ID")+"'");
			int j=ps.executeUpdate();
			PrintWriter pw=response.getWriter();
			pw.println("<h1>password successfully updated...</h1>");
			System.out.println("i am working.......");
			

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}

}
