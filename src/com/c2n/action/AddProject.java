package com.c2n.action;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

import javax.jws.WebService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/AddProject")
public class AddProject extends HttpServlet{
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			DBConnection obj=new DBConnection();
			Properties prop=obj.loadproperties();
			String driver=prop.getProperty("driver");
			String url = prop.getProperty("url");
			String dbusername = prop.getProperty("usernamedb");
			String dbpassword = prop.getProperty("passworddb");
			Class.forName(driver);
			con = DriverManager.getConnection(url, dbusername, dbpassword);
			String projname = request.getParameter("projectname");
			String cusername = request.getParameter("clientname");
			String duration = request.getParameter("duration");
			ps = con.prepareStatement(
					"insert into projects(project_name, client_name, duration) values(?,?,?)");
			ps.setString(1, projname);
			ps.setString(2, cusername);
			ps.setString(3, duration);
			ps.execute();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
