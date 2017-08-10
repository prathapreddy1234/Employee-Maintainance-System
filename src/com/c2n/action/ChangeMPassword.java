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
@WebServlet("/ChangeMPassword")
public class ChangeMPassword extends HttpServlet{
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			response.setContentType("text/html");
			System.out.println("coming");
			HttpSession session=request.getSession();
			DBConnection obj=new DBConnection();
			Properties prop=obj.loadproperties();
			String driver=prop.getProperty("driver");
			String url=prop.getProperty("url");
			String dbusername=prop.getProperty("usernamedb");
			String dbpassword=prop.getProperty("passworddb");
			Class.forName(driver);
			con=DriverManager.getConnection(url,dbusername,dbpassword);
			String op=request.getParameter("old");
			String np=request.getParameter("newp");
			System.out.println("values.....");
				ps=con.prepareStatement("UPDATE employees SET password='"+np+"' WHERE sno='"+session.getAttribute("ID")+"'");
				ps.executeUpdate();
				System.out.println(np);
				System.out.println(op);
				PrintWriter pw=response.getWriter();
				pw.println("<h1>submittedsuccessfully updated...</h1>");
				System.out.println("pass changed.....");
		} catch (Exception e) {
			e.printStackTrace();
}
	}

}
