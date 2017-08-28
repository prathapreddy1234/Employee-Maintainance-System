package com.c2n.action;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteEmployee")
public class DeleteEmployee extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con = null;
		PreparedStatement pst = null;

		String Empid = request.getParameter("Eid");

		try {
			DBConnection obj=new DBConnection();
			Properties prop=obj.loadproperties();
			String driver=prop.getProperty("driver");
			String url=prop.getProperty("url");
			String dbusername=prop.getProperty("usernamedb");
			String dbpassword=prop.getProperty("passworddb");
			Class.forName(driver);
			con=DriverManager.getConnection(url,dbusername,dbpassword);
			pst = con.prepareStatement("delete from employees where sno='" + Empid + "'");
			int i = pst.executeUpdate();
			if (i > 0) {
				response.sendRedirect("AdminHome.jsp?deleteflag=Y");
			} else {
				response.sendRedirect("AdminHome.jsp?deleteflag=N");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
