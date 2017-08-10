package com.c2n.action;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginValidate extends HttpServlet 
{
	Connection con=null;
	PreparedStatement ps=null;
	ResultSet rs = null;
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try
		{
			DBConnection obj=new DBConnection();
			Properties prop=obj.loadproperties();
			String driver=prop.getProperty("driver");
			String url=prop.getProperty("url");
			String dbusername=prop.getProperty("usernamedb");
			String dbpassword=prop.getProperty("passworddb");
			Class.forName(driver);	
			con = DriverManager.getConnection(url,dbusername,dbpassword);
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String role = request.getParameter("role");
			

			ps = con.prepareStatement(
					"select * from employees where username='" + username + "'AND password='" + password + "'AND role='" + role + "'");
			ResultSet rs = ps.executeQuery();
			String rol=null;
			String id=null;
			while (rs.next()) {
				 rol=rs.getString(9);
				 id=rs.getString(1);
			}
			System.out.println(id);
			System.out.println(rol);
					HttpSession session=request.getSession();
					session.setAttribute("ID", id);
			if(rol.equals("Admin")){
				response.sendRedirect("AdminHome.jsp");
			}
			else if(rol.equals("Manager"))
				response.sendRedirect("Manager_Home.jsp");
			else if(rol.equals("Developer")||rol.equals("Tester"))
				response.sendRedirect("EmployeeHome.jsp");
			

		}
		catch(Exception e)
		{
			System.out.println("No such user ");
			//out.print("Sorry UserName or Password Error!");
			response.sendRedirect("login.jsp?nouser=no");
/*	        RequestDispatcher rd=request.getRequestDispatcher("login.jsp?update=Fail");  
	        rd.include(request, response);  
*/		}
	}

}
