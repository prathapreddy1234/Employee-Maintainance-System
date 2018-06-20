package com.c2n.action;

import java.io.FileInputStream;
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

@WebServlet("/EditEmployee")
public class EditEmployee extends HttpServlet 
{
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	/*public Properties loadproperties() throws Exception 
	{
		// TODO Auto-generated method stub
		FileInputStream fi=new FileInputStream("D://jdbc.properties");
		Properties prop=new Properties();
		prop.load(fi);
		fi.close();
		return prop;
	}*/

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			System.out.println("coming....");
			System.out.println("code done");
			HttpSession session=request.getSession();
			DBConnection obj=new DBConnection();
			Properties prop=obj.loadproperties();
			String driver = prop.getProperty("driver");
			String url = prop.getProperty("url");
			String dbusername = prop.getProperty("usernamedb");
			String dbpassword = prop.getProperty("passworddb");
			Class.forName(driver);
			con = DriverManager.getConnection(url, dbusername, dbpassword);
			String sno = request.getParameter("sno");
			System.out.println("sno"+sno);
			String name = request.getParameter("name");
			System.out.println("name"+name);
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String email = request.getParameter("email");
			String phonenumber = request.getParameter("phone");
			/*String joindate=request.getParameter("dt");
			String Role = request.getParameter("Role");*/
			
			ps = con.prepareStatement(
					"update employees set name='"+name+"',email='"+email+"',phonenumber='"+phonenumber+"' where employeeid='"+session.getAttribute("ID")+"' ");
			System.out.println("**********");
			
			int res = ps.executeUpdate();
			if (res > 0)
				response.sendRedirect("AdminHome.jsp?registration Success");
			else
				response.sendRedirect("AdminHome.jsp?registration Fail");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}