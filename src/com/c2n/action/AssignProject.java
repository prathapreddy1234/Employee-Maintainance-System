package com.c2n.action;



import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.record.formula.functions.Request;


/**
 * Servlet implementation class AssignProject
 */
@WebServlet("/AssignProject")
public class AssignProject extends HttpServlet {
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			HttpSession session=request.getSession();
			DBConnection obj=new DBConnection();
			Properties prop=obj.loadproperties();
			String driver=prop.getProperty("driver");
			String url=prop.getProperty("url");
			String dbusername=prop.getProperty("usernamedb");
			String dbpassword=prop.getProperty("passworddb");
			
			String projectname=request.getParameter("proj");
			String employee=request.getParameter("emp");
			String manager=request.getParameter("manager");
			Class.forName(driver);
			con=DriverManager.getConnection(url,dbusername,dbpassword);
			ps=con.prepareStatement("update employees set project='"+projectname+"' where name='"+employee+"'");
			int j=ps.executeUpdate();
			if (j>0) {
				response.sendRedirect("AdminHome.jsp?Projectassigned Successfully");
			} else {
				response.sendRedirect("AdminHome.jsp?Projectassigned  fail");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
