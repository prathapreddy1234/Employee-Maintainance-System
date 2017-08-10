<%@page import="com.c2n.action.DBConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Properties"%>
<%@page import="com.c2n.action.AddEmployees"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="./js/validations.js"></script>


<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/validations.css">
<link rel="stylesheet" href="css/val.css">
<!-- For registration -->
<title>ADMIN_HOME</title>
</head>
<body>
	
	<div id="throbber" style="display: none; min-height: 220px;"></div>
	<div id="noty-holder"></div>
	<div id="wrapper">
		<!-- Navigation -->
		<div class="navbar navbar-inverse navbar-fixed-top" id="header" role="navigation">
		<!-- Top Menu Items -->
		
		<!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
		<div class="collapse navbar-collapse navbar-ex1-collapse">
			<ul class="nav navbar-nav side-nav">
				<li><a href="#content1" id="addemp" data-toggle="collapse"
					data-target="content_name1"><i class="fa fa-fw fa-search"></i>&nbsp&nbspAdd
						Employee </i></a>
					</li>
				<li><a href="#content2" id="viewemp" data-toggle="collapse"
					data-target="d0"><i class="fa fa-fw fa-star"></i>&nbsp&nbspView Employees</a>
					 </li>
				<li><a href="#content3" id="offerltr"><i
						class="fa fa-fw fa-user-plus"></i>&nbsp&nbspOffer Letter</a></li>
				<li><a href="#content4" id="addproj"><i
						class="fa fa-fw fa-paper-plane-o"></i>&nbsp&nbspAdd Project</a></li>
				<li><a href="#content5" id="assignProj"><i
						class="fa fa-fw fa fa-question-circle"></i>&nbsp&nbspAssign Project</a></li>
				
					<li><a href="#content6" id="changepass"><i class="fa fa-fw fa-cog"></i> Change
							Password</a></li>
					
					<li><a href="login.jsp"><i class="fa fa-fw fa-power-off"></i>
							Logout</a></li>
				</ul>				
		</div>
		  </div>

		<div id="page-wrapper">
			<div class="container-fluid">
				<!-- Page Heading -->
				<div class="row" id="main">
					<div class="col-sm-5 col-md-5 well" id="content1">																		<!--RegEmployee -->
						
						<form action="addemp" method="post">
						<div class="form-group" id="addemp">
								<label for="name" class="cols-sm-2 control-label">Employee
									ID</label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon"><i
											class="fa fa-user fa" aria-hidden="true"></i></span> <input
											type="text" class="form-control" name="eid" id="eid"
											placeholder="Enter Employee ID" onblur="ValidateName()"/>
									</div>
								</div>
							</div>
						
							<div class="form-group" id="addemp">
								<label for="name" class="cols-sm-2 control-label">Employee
									Name</label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon"><i
											class="fa fa-user fa" aria-hidden="true"></i></span> <input
											type="text" class="form-control" name="name" id="regname"
											placeholder="Enter Employee Name" onblur="ValidateName()"/>
									</div>
								</div>
							</div>

							<div class="form-group">
								<label for="username" class="cols-sm-2 control-label">Username</label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon"><i
											class="fa fa-users fa" aria-hidden="true"></i></span> <input
											type="text" class="form-control" name="username"
											id="username" onkeyup="loadXMLDoc()"
											placeholder="Enter Employee Username" onblur="ValidateUserName()"/>
									</div>
								</div>
							</div>

							<div class="form-group">
								<label for="password" class="cols-sm-2 control-label">Password</label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon"><i
											class="fa fa-lock fa-lg" aria-hidden="true"></i></span> <input
											type="password" class="form-control" name="password"
											id="password" placeholder="Enter Employee Password"
											  onblur="ValidatePassword()"/>
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
											placeholder="Enter Employee Email" onblur="ValidateEmail()"/>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label for="confirm" class="cols-sm-2 control-label">Phone
									Number</label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon"><i class="fa fa-phone"
											aria-hidden="true"></i></span> <input type="text"
											class="form-control" name="phone" id="phone"
											placeholder="Enter Phone Number" onblur="ValidatePhone()"/>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label for="confirm" class="cols-sm-2 control-label">Joining
									Date</label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon"><i
											class="fa fa-calendar" aria-hidden="true"></i></span> <input
											type="date" class="form-control" name="dt" id="dt"
											min="2017-07-15" onblur="ValidateDate()"/>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="Role">Role</label>
								<div class="cols-sm-10">
									<select name="Role" class="form-control" id="role" onblur="ValidateRole()">
										<option>Manager</option>
										<option>Developer</option>
										<option>Tester</option>
									</select>
								</div>
							</div>
							<div class="form-group ">
								<input type="submit" id="addemployeebtn"
									class="btn btn-primary "
									value="Register"><div id="spinner" class="fa fa-spinner fa-spin fa-pulse fa-2x fa-fw" ></div>
							</div>
						</form>

					</div>
					<div class="col-sm-12 col-md-12 well" id="content2">																	<!-- view employee -->			
						
						<table class="table table-bordered" id="tableborder">
							<thead>
								<tr>
									<th>SNO</th>
									<th>EmployeeID</th>
									<th>EmpName</th>
									<th>User Name</th>
									<th>Password</th>
									<th>Email</th>
									<th>Phone Number</th>
									<th>Joining Date</th>
									<th>Role</th>
									<th>project</th>
									<th>RelieveRequested</th>
									<th>Relieving</th>
									<th>Del</th>
									<th>Edit</th>
								</tr>
							</thead>
							<%
								Connection con;
								ResultSet rs = null;
								DBConnection obj=new DBConnection();
								Properties prop=obj.loadproperties();
								String driver=prop.getProperty("driver");
								String url=prop.getProperty("url");
								String dbusername=prop.getProperty("usernamedb");
								String dbpassword=prop.getProperty("passworddb");
								Class.forName(driver);
								con=DriverManager.getConnection(url,dbusername,dbpassword);
								Statement st = con.createStatement();
								String sql = "select *from employees";
								rs = st.executeQuery(sql);
								while (rs.next()) {
							%>
							<tbody>
								<tr>
									<td><%=rs.getString(1)%></td>
									<td><%=rs.getString(2)%></td>
									<td><%=rs.getString(3)%></td>
									<td><%=rs.getString(4)%></td>
									<td><%=rs.getString(5)%></td>
									<td><%=rs.getString(6)%></td>
									<td><%=rs.getString(7)%></td>
									<td><%=rs.getString(8)%></td>
									<td><%=rs.getString(9)%></td>
									<td><%=rs.getString(10)%></td>
									<td><%=rs.getString(11)%></td>
									<td><%=rs.getString(12)%></td>
									<td><a href="DeleteEmployee?Eid=<%=rs.getString(1) %>"  id="deletebutton"><span class="glyphicon glyphicon-trash"></span></a></td>
									<td><a id="editbutton" onclick="javascript:EditEmployee('<%=rs.getString(2)%>','<%=rs.getString(3)%>','<%=rs.getString(4)%>','<%=rs.getString(5)%>','<%=rs.getString(6)%>','<%=rs.getString(7)%>','<%=rs.getString(8)%>');"><i class="fa fa-pencil-square-o"></i></a></td>
								</tr>

								<%
									}
								%>
							</tbody>
						</table>

					</div>
					<!--Start Model Here -->
					<div style="margin-left: 418px;overflow-x: hidden;overflow-y: hidden;" class="modal fade col-sm-5 col-md-5" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-controls-modal="myModal" data-backdrop="static" data-keyboard="false">																		<!--AddEmployee -->
						<div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                 <h4 class="modal-title" id="myModalLabel">Modal title</h4>

            </div>
            <div class="modal-body">
						<form action="addemp" method="post" name="modaladdemp">
							<div class="form-group" id="addemp">
								<label for="name" class="cols-sm-2 control-label">Employee
									Name</label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon"><i
											class="fa fa-user fa" aria-hidden="true"></i></span> <input
											type="text" class="form-control" name="name" id="name"
											placeholder="Enter your Name" />
									</div>
								</div>
							</div>

							<div class="form-group">
								<label for="username" class="cols-sm-2 control-label">Username</label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon"><i
											class="fa fa-users fa" aria-hidden="true"></i></span> <input
											type="text" class="form-control" name="username"
											id="username" onkeyup="loadXMLDoc()"
											placeholder="Enter your Username" />
									</div>
								</div>
							</div>

							<div class="form-group">
								<label for="password" class="cols-sm-2 control-label">Password</label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon"><i
											class="fa fa-lock fa-lg" aria-hidden="true"></i></span> <input
											type="password" class="form-control" name="password"
											id="password" placeholder="Enter your Password"
											onblur="return noupper()" />
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
											placeholder="Enter your Email" />
									</div>
								</div>
							</div>
							<div class="form-group">
								<label for="confirm" class="cols-sm-2 control-label">Phone
									Number</label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon"><i class="fa fa-phone"
											aria-hidden="true"></i></span> <input type="text"
											class="form-control" name="phone" id="phone"
											placeholder="Phone Number" />
									</div>
								</div>
							</div>
							<div class="form-group">
								<label for="confirm" class="cols-sm-2 control-label">Joining
									Date</label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon"><i
											class="fa fa-calendar" aria-hidden="true"></i></span> <input
											type="te" class="form-control" name="dt" id="dt"
											 />
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="Role">Role</label>
								<div class="cols-sm-10">
									<select name="Role" class="form-control" id="Role">
										<option>Manager</option>
										<option>Developer</option>
										<option>Tester</option>
									</select>
								</div>
							</div>
							<div class="form-group ">
								<input type="submit" id="button"
									class="btn btn-primary "
									value="Register"><div class="fa fa-spinner fa-spin fa-pulse fa-2x fa-fw"  style="display: none;"></div>
							</div>
						</form>
</div></div>
					</div>
					<!-- Model Here -->
					<div class="col-sm-12 col-md-12 well" id="content3">
						<h1>Offer Letter</h1>
					</div>
					<div class="col-sm-3 col-md-3 well" id="content4">															<!-- Add Project -->
			<div class="row main">
				<div class="main-login main-center">
					<form action="./AddProject" method="post">
						<div class="form-group">
							<label for="name" class="cols-sm-2 control-label">Project
								Name</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-user fa"
										aria-hidden="true"></i></span> <input type="text"
										class="form-control" name="projectname" id="projectname"
										placeholder="Enter Project Name" onblur="ValidateProjName()"/>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="username" class="cols-sm-2 control-label">Client Name</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="fa fa-users fa" aria-hidden="true"></i></span> <input
										type="text" class="form-control" name="clientname" id="clientname"
										placeholder="Enter Clientname" onblur="ValidateCientName()"/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="email" class="cols-sm-2 control-label">Duration</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-clock-o" aria-hidden="true"></i></span> <input
										type="text" class="form-control" name="duration" id="duration"
										placeholder="Enter Project duration" onblur="ValidateDuration()"/>
								</div>
							</div>
						</div>
						<div class="form-group ">
							<input type="submit" id="addprojbtn"
								class="btn btn-primary"
								value="ADD">
						</div>
						<!-- 	<div class="loader" id="loading" style="display: none;margin-left: 178px;"></div> -->
					</form>
				</div>
			</div>
		</div>
			<div class="col-sm-3 col-md-3 well" id="content5">															<!-- Assign Project -->
				<div class="row main">
				<div class="main-login main-center">
					<form action="./AssignProject" method="post">
						<div class="form-group">
							<label for="name" class="cols-sm-2 control-label">Project</label>
							
							<div class="cols-sm-10">
							 
									<select name="proj" class="form-control" id="proj" onblur="ValidateProj()">
								 <%
									PreparedStatement ps = con.prepareStatement(
											"select * from projects");
									rs=ps.executeQuery();
									while(rs.next()){
								 %>
										<option><%=rs.getString(2) %></option>
								 	<%} %>
										 
									</select>
								</div>
						</div>
						<div class="form-group">
							<label for="username" class="cols-sm-2 control-label">Employee</label>
							<div class="cols-sm-10">
									<select name="emp" class="form-control" id="emp" onblur="ValidateEmployee()">
									 <%
									 PreparedStatement ps1 = con.prepareStatement(
												"select * from employees where role='Developer'");
										ResultSet res1=ps1.executeQuery();
										while(res1.next()){
									 %>
										<option><%=res1.getString(2) %></option>
								 	 <%} %>
										 
									</select>
								</div>
						</div>

						<div class="form-group">
							<label for="email" class="cols-sm-2 control-label">Manager</label>
							<div class="cols-sm-10">
									<select name="manager" class="form-control" id="manager" onblur="ValidateManager()">
									<%
									PreparedStatement pstmt = con.prepareStatement(
											"select * from employees where role='Manager'");
									rs=pstmt.executeQuery();
									while(rs.next()){
								 %>
										<option><%=rs.getString(2) %></option>
								 	<%} %>
						 
										
								 
									</select>
								</div>
						</div>
						<div class="form-group ">
							<input type="submit" id="asignprojbtn"
								class="btn btn-primary"
								value="Asign">
						</div>
						<!-- 	<div class="loader" id="loading" style="display: none;margin-left: 178px;"></div> -->
					</form>
				</div>
			</div>

					</div>
					<div class="col-sm-3 col-md-3 well" id="content6">															<!-- Change password -->
						<div class="row main">
				<div class="main-login main-center">
					<form action="./ChangePassword" method="post">
						<div class="form-group">
							<label for="name" class="cols-sm-10 control-label">Old Password</label><span id="olderr"></span>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-user fa"
										aria-hidden="true"></i></span><input type="password"
										class="form-control" name="oldpass" id="oldpass" onkeyup="validateOld()" onblur="oldValids()"
										placeholder="Enter Old Password" />
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="username" class="cols-sm-10 control-label">New Password</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="fa fa-users fa" aria-hidden="true"></i></span> <input
										type="password" class="form-control" name="newpass" id="newpass" onblur="newValids()"
										placeholder="Enter new Password" />
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="username" class="cols-sm-10 control-label">Confirm Password</label><span id="newerr"></span> 
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="fa fa-users fa" aria-hidden="true"></i></span> <input
										type="password" class="form-control" name="cnfnewpass" id="cnfpass" onkeyup="validateNew()"
										placeholder="Confirm new Password" />
								</div>
							</div>
						</div>

						
						<div class="form-group">
							<input type="submit" id="changebtn"
								class="btn btn-primary"
								value="CHANGE">
						</div>
						<!-- 	<div class="loader" id="loading" style="display: none;margin-left: 178px;"></div> -->
					</form>
				</div>
			</div>

					</div>
				</div>
				
		<!-- Infos -->
		<div class="col-md-4">
			<div class="aro-pswd_info">
				<div id="user_info">
					<ul>
						<li id="namevalids" class="invalid">Everything must be <strong>a character</strong></li>
					</ul>
				</div>
			</div>
		</div>
		
		<div class="col-md-4">
			<div class="aro-pswd_info">
				<div id="pswd_info">
					<h4>&nbsp&nbsp&nbspPassword must be requirements</h4>
					<ul>
						<li id="letter" class="invalid">At least <strong>one letter</strong></li>
						<li id="capital" class="invalid">At least <strong>one capital letter</strong></li>
						<li id="number" class="invalid">At least <strong>one number</strong></li>
						<li id="length" class="invalid">Be at least <strong>8 characters</strong></li>
						<li id="space" class="invalid">be<strong> use [~,!,@,#,$,%,^,&,*,-,=,.,;,']</strong></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="aro-pswd_info">
				<div id="email_info">
					<ul>
						<li id="emailvalids" class="invalid">Must be <strong> valid Email</strong></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="aro-pswd_info">
				<div id="phone_info">
					<ul>
						<li id="startvalids" class="invalid">Must start with <strong>one 9 or 8 or 7</strong></li>
						<li id="tenvalids" class="invalid">Must be <strong> ten digits</strong></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="aro-pswd_info">
				<div id="username_info">
					<ul>
						<li><span id="err"></span> </li>
					</ul>
				</div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="aro-pswd_info">
				<div id="chpswd_info">
					<h4>&nbsp&nbsp&nbspPassword must  requirements</h4>
					<ul>
						<li id="chletter" class="invalid">At least <strong>one letter</strong></li>
						<li id="chcapital" class="invalid">At least <strong>one capital letter</strong></li>
						<li id="chnumber" class="invalid">At least <strong>one number</strong></li>
						<li id="chlength" class="invalid">Be at least <strong>8 characters</strong></li>
						<li id="chspace" class="invalid">be<strong> use [~,!,@,#,$,%,^,&,*,-,=,.,;,']</strong></li>
					</ul>
				</div>
			</div>
		</div>
		
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /#page-wrapper -->
	</div>
	<!-- /#wrapper -->
	
</body>
</html>