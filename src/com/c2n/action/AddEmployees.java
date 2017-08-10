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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddEmployees extends HttpServlet {
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			DBConnection obj=new DBConnection();
			Properties prop = obj.loadproperties();
			String driver = prop.getProperty("driver");
			String url = prop.getProperty("url");
			String dbusername = prop.getProperty("usernamedb");
			String dbpassword = prop.getProperty("passworddb");
			Class.forName(driver);
			con = DriverManager.getConnection(url, dbusername, dbpassword);
			String name = request.getParameter("name");
			String eid = request.getParameter("eid");
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String email = request.getParameter("email");
			String phonenumber = request.getParameter("phone");
			String joindate=request.getParameter("dt");
			String Role = request.getParameter("Role");
			String proj=("not Asigned");
			String relievereq=("not Asigned");
			String relieving=("not Asigned");
			ps = con.prepareStatement(
					"insert into employees(name,employeeid,username,password,email,phonenumber,joindate,role,project,relieve_request_date,relieving_date) values(?,?,?,?,?,?,?,?,?,?,?)");
			System.out.println("**********");
			ps.setString(1, name);
			ps.setString(2, eid);
			ps.setString(3, username);
			ps.setString(4, password);
			ps.setString(5, email);
			ps.setString(6, phonenumber);
			ps.setString(7, joindate);
			ps.setString(8, Role);
			ps.setString(9, proj);
			ps.setString(10, relievereq);
			ps.setString(11, relieving);
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
