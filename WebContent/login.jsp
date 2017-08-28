<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">
	 <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/bootstrap.min.js"></script>
<script>
 $(document).ready(function() {
            $('#loginbtn').attr("disabled", true);
        });
  </script>
 <script>
 var a=false;
 var b=false;
function ValidateUsername() {
	/* alert(); */
	var username=document.getElementById("username").value;
	if(username==""){
		 a=false;
	}
	else{
		a=true;	
	}
/* 	alert("A IS"+a); */
}

function ValidatePassword() {
	var password=document.getElementById("password").value;
	if(password==""){
		b=false;
	}
	else{
		b=true;	
	}
	/* alert("B IS"+b); */
	Validate();
}
function Validate() {
	

if(a==true&&b==true){
	/* alert("callles"); */
	$(document).ready(function() {
	  $('#loginbtn').attr("disabled", false);
	   });
}
else{
	$(document).ready(function() {
	  $('#loginbtn').attr("disabled", true);
	   });
}
}
</script>
<title>EMPLOYEE MAINTENANCE SYSTEM</title>
<style>
body {
	background-image: url("images/employeebanner.jpg");
}
span {
	color: red;
}
</style>
</head>
<body>
	<div id="login-overlay" class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">Login to Oursite</h4>
				 <%
				try{
					if(request.getParameter("nouser").equals("no"))
					{%>
					<span>No Such user Try again</span>
					<% 
					}
					else{
						System.out.print("Logged In");
					}
				}catch(Exception e){
					 
				}
					
				%>  
				
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-xs-6">
						<div id="loginErrorMsg" style="color: red; display: none;">Invalid
							Username (Or) Password</div>
						<div class="well">
							<form id="loginForm" method="POST" action="login"
								novalidate="novalidate">
								<div class="form-group">
									<label for="username" class="control-label">Username</label> <input
										type="text" class="form-control" id="username" name="username"
										value="" required="" title="Please enter you username"
										placeholder="Enter Your Username" onblur="ValidateUsername()"> <span
										class="help-block"></span>
								</div>
								<div class="form-group">
									<label for="password" class="control-label">Password</label> <input
										type="password" class="form-control" id="password"
										name="password" value="" required=""
										title="Please enter your password" onblur="ValidatePassword()"> <span
										class="help-block"></span>
								</div>
								<div class="form-group">
									<label for="sel1">Role</label> <select class="form-control"
										id="sel1" name="role">
										<option>Admin</option>
										<option>Manager</option>
										<option>Developer</option>
										<option>Tester</option>
									</select>
								</div>
								<div class="checkbox">
									<label> <input type="checkbox" name="remember"
										id="remember"> Remember login
									</label>
									<!--   <p class="help-block">(if this is a private computer)</p> -->
								</div>
								<button type="submit" class="btn btn-success btn-block" id="loginbtn">Login</button>
							</form>
						</div>
					</div>
					<div class="col-xs-6"></div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>