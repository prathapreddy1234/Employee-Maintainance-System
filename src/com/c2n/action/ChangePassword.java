package com.c2n.action;

import java.io.IOException;
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
@WebServlet("/ChangePassword")
public class ChangePassword extends HttpServlet{
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session=request.getSession();
			DBConnection obj=new DBConnection();
			Properties prop=obj.loadproperties();
			String driver=prop.getProperty("driver");
			String url=prop.getProperty("url");
			String dbusername=prop.getProperty("usernamedb");
			String dbpassword=prop.getProperty("passworddb");
			Class.forName(driver);
			con=DriverManager.getConnection(url,dbusername,dbpassword);
			String op=request.getParameter("oldpass");
			String np=request.getParameter("cnfnewpass");
				ps=con.prepareStatement("UPDATE employees SET password='"+np+"' WHERE sno='"+session.getAttribute("ID")+"'");
				ps.executeUpdate();
				System.out.println(np);
				System.out.println(op);
				System.out.println("pass changed......");
				response.sendRedirect("AdminHome.jsp");
		} catch (Exception e) {
			e.printStackTrace();
}
	}

}
