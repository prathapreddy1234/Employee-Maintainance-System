<%@page import="com.c2n.action.DBConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Properties"%>
<%@page import="com.c2n.action.AddEmployees"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.Properties"%>
<%@page import="com.c2n.action.AddEmployees"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="./js/validations.js"></script>
<script src="./js/manager_script.js"></script>
<script src="./js/employee.js"></script>
<script type="text/javascript"></script>
<link rel="stylesheet" href="css/manager.css">
<link rel="stylesheet" href="css/employee.css">
<title>EMPLOYEE_HOME</title>

<!-- <style type="text/css">
#panel{
padding: 10px;
}
</style> -->
<!--  <script type="text/javascript">
    $("#updatembtn").click(function() {
        $.ajax({
            url: '#editprofile',
            type: 'POST',
            success: function(data) {
                alert('Update Success');
            },
            failure: function(data) {
                alert('Update Failed');
            }
        });
    )};
</script>  -->
</head>
<body>
	<div id="panel">
		<img alt="correct" src="./images/valid.jpg"><b>Your Details
			Updated Successfully!</b>
	</div>
	<div id="throbber" style="min-height: 120px;"></div>
	<div id="noty-holder"></div>
	<div class="header" id="header">

		<img id="backgroundimage" src="./images/header5.JPG" border="0"
			alt="header">
		<div class="navbar navbar-btn navbar-fixed-top" id="header"
			role="navigation">
			<!-- Top Menu Items -->

			<!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
			<div class="collapse navbar-collapse navbar-ex1-collapse">
				<ul class="nav navbar-nav head-nav">
					<li><a href="#home" id="homebtn" data-toggle="collapse"
						data-target="content_name1">Home </i></a></li>
					<li><a href="#relieve" id="requestsbtn" data-toggle="collapse"
						data-target="d0">Relieve</a></li>
					<li><a href="#editprofile" id="editbtn">EditProfile</a></li>
					<li><a href="#changeMPass" id="mchangebtn">Change Password</a></li>
					<li><a href="login.jsp"> Logout</a></li>
				</ul>
			</div>
		</div>
	</div>

	<%-- <h1><%=f%></h1> --%>

	<div class="btns btns-body">
		<div class="col-sm-10 col-md-10 well" id="home">
			<h1>home</h1>
		</div>
		<div class="col-sm-10 col-md-10 well" id="relieve">
			<div class="form-group" id="reason">
				<label>Reason to relieve</label>
				<textarea class="form-control" rows="5" id="reasontxt"></textarea>
				<div class="form-group ">
					<input type="button" id="reasonbtn" class="btn btn-primary "
						value="Submit">
				</div>
			</div>
		</div>
		<%
			String name;
			try {
				Connection con;
				DBConnection obj = new DBConnection();
				Properties prop = obj.loadproperties();
				String driver = prop.getProperty("driver");
				String url = prop.getProperty("url");
				String dbusername = prop.getProperty("usernamedb");
				String dbpassword = prop.getProperty("passworddb");
				Class.forName(driver);
				con = DriverManager.getConnection(url, dbusername, dbpassword);
				PreparedStatement ps = con.prepareStatement(
						"select * from employees where employeeid='" + session.getAttribute("ID") + "'");
				ResultSet res = ps.executeQuery();
				while (res.next()) {
		%>
		<div class="col-sm-5 col-md-5 well" id="editprofile">
			<form>
				<div class="form-group" id="addemp">
					<label for="name" class="cols-sm-3 control-label"> Name</label>
					<div class="cols-sm-10">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="fa fa-calculator" aria-hidden="true"></i></span> <input
								type="text" class="form-control" name="name" id="updtmngrname"
								value="<%=res.getString(3)%>" placeholder="Enter your Name"
								onblur="validateUpdateMName()" />
						</div>
					</div>
				</div>



				<div class="form-group">
					<label for="email" class="cols-sm-2 control-label">Email</label>
					<div class="cols-sm-10">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="fa fa-envelope fa" aria-hidden="true"></i></span> <input
								type="text" class="form-control" name="email" id="email"
								value="<%=res.getString(6)%>" placeholder="Enter your Email"
								onblur="ValidateUpdateMEmail()" />
						</div>
					</div>
				</div>
				<div class="form-group">
					<label for="confirm" class="cols-sm-2 control-label">Phone
						Number</label>
					<div class="cols-sm-10">
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-phone"
								aria-hidden="true"></i></span> <input type="text" class="form-control"
								name="phone" id="phone" value="<%=res.getString(7)%>"
								placeholder="Phone Number" onblur="ValidateUpdateMPhone()" />
						</div>
					</div>
				</div>


				<div class="form-group ">
					<input type="button" id="updateempbtn" class="btn btn-primary "
						value="Update">
					<div class="fa fa-spinner fa-spin fa-pulse fa-2x fa-fw"></div>
				</div>
			</form>
			<%
				}

				} catch (Exception e) {
					e.printStackTrace();
				}
			%>

		</div>


		<div class="col-sm-10 col-md-10 well" id="changeMPass">
			<!-- change password -->
			<form>
				<div class="form-group">
					<label for="name" class="cols-sm-10 control-label">Old
						Password</label><span id="molderr"></span>
					<div class="cols-sm-10">
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-user fa"
								aria-hidden="true"></i></span><input type="password"
								class="form-control" name="oldpass" id="oldpass"
								onkeyup="validateMOld()" onblur="oldValids()"
								placeholder="Enter Old Password" />
						</div>
					</div>
				</div>
				<div class="form-group">
					<label for="username" class="cols-sm-10 control-label">New
						Password</label>
					<div class="cols-sm-10">
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-users fa"
								aria-hidden="true"></i></span> <input type="password"
								class="form-control" name="newpass" id="newpass"
								onblur="newValids()" placeholder="Enter new Password" />
						</div>
					</div>
				</div>
				<div class="form-group">
					<label for="username" class="cols-sm-10 control-label">Confirm
						Password</label><span id=""></span>
					<div class="cols-sm-10">
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-users fa"
								aria-hidden="true"></i></span> <input type="password"
								class="form-control" name="cnfnewpass" id="cnfpass"
								onkeyup="validateNew()" placeholder="Confirm new Password" /><span
								id="output"></span>
						</div>
					</div>
				</div>


				<div class="form-group">
					<input type="button" id="empchangebtn" class="btn btn-primary"
						value="CHANGE">
				</div>
				<!-- 	<div class="loader" id="loading" style="display: none;margin-left: 178px;"></div> -->


				<span id="output"></span>
			</form>


		</div>
	</div>
	<div class="col-md-4">
		<div class="aro-pswd_info">
			<div id="edit_manager_name_info">
				<ul>
					<li id="m_editnamevalids" class="invalid">Everything must be <strong>a
							character</strong></li>
				</ul>
			</div>
		</div>
	</div>

	<div class="col-md-4">
		<div class="aro-pswd_info">
			<div id="edit_manager_email_info">
				<ul>
					<li id="m_editemailvalids" class="invalid">Must be <strong>
							valid Email</strong></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="col-md-4">
		<div class="aro-pswd_info">
			<div id="edit_manager_phone_info">
				<ul>
					<li id="m_editphonestartvalids" class="invalid">Must start
						with <strong>one 9 or 8 or 7</strong>
					</li>
					<li id="m_editphonetenvalids" class="invalid">Must be <strong>
							ten digits</strong></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="col-md-4">
		<div class="aro-pswd_info">
			<div id="manager_chpass_info">
				<h4>&nbsp&nbsp&nbspPassword must requirements</h4>
				<ul>
					<li id="chletter" class="invalid">At least <strong>one
							letter</strong></li>
					<li id="chcapital" class="invalid">At least <strong>one
							capital letter</strong></li>
					<li id="chnumber" class="invalid">At least <strong>one
							number</strong></li>
					<li id="chlength" class="invalid">Be at least <strong>8
							characters</strong></li>
					<li id="chspace" class="invalid">be<strong> use
							[~,!,@,#,$,%,^,&,*,-,=,.,;,']</strong></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="col-md-4">
		<div class="aro-pswd_info">
			<div id="manager_oldcheck_info">
				<ul>
					<li id="mngrolderr"></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="col-md-4">
		<div class="aro-pswd_info">
			<div id="manager_newcheck_info">
				<ul>
					<li id="newerr"></li>
				</ul>
			</div>
		</div>
	</div>

</body>
</html>