function loadXMLDoc() {
		var xmlhttp;
		var user = document.getElementById("username").value;
		var urls = "userValidator.jsp?flag=" + user;

		if (window.XMLHttpRequest) {
			xmlhttp = new XMLHttpRequest();
		} else {
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4) {
				//document.getElementById("err").style.color="red";
				document.getElementById("err").innerHTML = xmlhttp.responseText;

			}
		}
		xmlhttp.open("GET", urls, true);
		xmlhttp.send();
}
function validateOld() {
	var xmlhttp;
	var urls = "passChanger.jsp?pass="+document.getElementById("oldpass").value;

	if (window.XMLHttpRequest) {
		xmlhttp = new XMLHttpRequest();
	} else {
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4) {
			//document.getElementById("err").style.color="red";
			document.getElementById("olderr").innerHTML = xmlhttp.responseText;

		}
	}
	xmlhttp.open("GET", urls, true);
	xmlhttp.send();
}

$(document).ready(function() {
    $('#asignprojbtn').click(function ()
    {
    var proj=$('#proj').val();
    var emp=$('#emp').val();
    var manager=$('#manager').val();
        $.ajax({
            type: "post",
            url: "AssignProject", //this is my servlet
            data: {proj,emp,manager},
            success: function(msg){      
            	 $("#panelassign").slideDown(1000).delay(2000).slideUp(500);	 
                    
            }
        });
    });

});
 

$(document).ready(function() {
    $('#changebtn').click(function ()
    {
    var oldpass=$('#oldpass').val();
    var cnfnewpass=$('#cnfpass').val();
        $.ajax({
            type: "post",
            url: "ChangePassword", //this is my servlet
            data: {oldpass,cnfnewpass},
            success: function(msg){      
            	 $("#panelchangepass").slideDown(1000).delay(2000).slideUp(500);	 
                    
            }
        });
    });

});

var np;
var cnp;

$(document).ready(function() {
	$('#content1').hide();
	$('#content2').hide();
	$('#content3').hide();
	$('#content4').hide();
	$('#content5').hide();
	$('#content6').hide();
	$('#spin').hide();
	$('#myModal').modal('hide');
});
$(document).ready(function() {
	$("#addemp").click(function() {
		$("#content1").show();
		$('#content2').hide();
		$('#content3').hide();
		$('#content4').hide();
		$('#content5').hide();
		$('#content6').hide();
	});
	$("#viewemp").click(function() {
		$("#content2").show();
		$('#content1').hide();
		$('#content3').hide();
		$('#content4').hide();
		$('#content5').hide();
		$('#content6').hide();
	});
	$("#offerltr").click(function() {
		$("#content3").show();
		$('#content1').hide();
		$('#content2').hide();
		$('#content4').hide();
		$('#content5').hide();
		$('#content6').hide();
	});
	$("#addproj").click(function() {
		$("#content4").show();
		$('#content1').hide();
		$('#content2').hide();
		$('#content3').hide();
		$('#content5').hide();
		$('#content6').hide();
	});
	$("#assignProj").click(function() {
		$("#content5").show();
		$('#content1').hide();
		$('#content2').hide();
		$('#content3').hide();
		$('#content4').hide();
		$("#content6").hide();
	});
	$("#changepass").click(function() {
		$("#content6").show();
		$('#content1').hide();
		$('#content2').hide();
		$('#content3').hide();
		$("#content4").hide();
		$('#content5').hide();
	});
});	 

$(document).ready(function() {
    $('#addemployeebtn').attr("disabled", true);
});

$(document).ready(function() {
    $('#spinner').hide();
});

$(document).ready(function() {
    $('#addemployeebtn').click(function() {
    	$('#spinner').show();
	});
});

$(document).ready(function() {
    $('#addprojbtn').attr("disabled", true);
});

$(document).ready(function() {
    $('#asignprojbtn').attr("disabled", true);
});

$(document).ready(function() {
    $('#changebtn').attr("disabled", true);
});

//For registration
var a=false;
var b=false;
var c=false;
var d=false;
var e=false;
var f=false;
function ValidateName() {
	/* alert(); */
	var regname=document.getElementById("regname").value;
	if(regname==""){
		 a=false;
	}
	else{
		
		a=true;	
	}
	/* alert("A IS"+a); */ 
	ValidateRegistraion();
}

function ValidateUserName() {
	/* alert(); */
	var username=document.getElementById("username").value;
	if(username==""){
		 b=false;
	}
	else{
		b=true;	
	}
 /* alert("A IS"+b);   */
	ValidateRegistraion();
}

function ValidatePassword() {
	/* alert(); */
	var password=document.getElementById("password").value;
	/* alert(password); */
	if(password==""){
		 c=false;
	}
	else{
		c=true;	
	}
	 /*  alert("A IS"+c);   */
	ValidateRegistraion();
}


function ValidateEmail() {
	/* alert(); */
	var email=document.getElementById("email").value;
	if(email==""){
		 d=false;
	}
	else{
		d=true;	
	}
 /* alert("A IS"+d);  */  
	ValidateRegistraion();
}

function ValidatePhone() {
	/* alert(); */
	var phone=document.getElementById("phone").value;
	if(phone==""){
		 e=false;
	}
	else{
		e=true;	
	}
	/* alert("A IS"+e);  */
	ValidateRegistraion();
}


function ValidateDate() {
	var date=document.getElementById("dt").value;
	if(date==""){
		f=false;
	}
	else{
		f=true;	
	}
	  /* alert("B IS"+f);    */
	ValidateRegistraion();
}


function ValidateRegistraion() {
	
if(a==true&&b==true&&c==true&&d==true&&e==true&&f==true){
	  /* alert("callles");  */ 
	$(document).ready(function() {
	  $('#addemployeebtn').attr("disabled", false);
	   });
}
else{
	$(document).ready(function() {
	  $('#addemployeebtn').attr("disabled", true);
	   });
}
}


/*For Add project */
function ValidateProjName() {
	/* alert(); */
	var projname=document.getElementById("projectname").value;
	/* alert(projname); */
	if(projname==""){
		 a=false;
	}
	else{
		a=true;	
	}
   	/* alert("A IS"+a); */ 
	ValidateAddProj();
}
function ValidateCientName() {
	    
	var clientname=document.getElementById("clientname").value;
	 
	if(clientname==""){
		 b=false;
	}
	else{
		b=true;	
	}
  /* 	alert("A IS"+a); */   
	ValidateAddProj();	
}

function ValidateDuration() {
	/* alert(); */
	var projname=document.getElementById("duration").value;
	/* alert(projname); */
	if(projname==""){
		 c=false;
	}
	else{
		c=true;	
	}
   	/* alert("A IS"+a); */ 
	ValidateAddProj();
}
function EditEmployee(empname,username,password,email,phoneno,joindate,role) {
	
	document.forms["modaladdemp"]["name"].value=empname;
	document.forms["modaladdemp"]["username"].value=username;
	document.forms["modaladdemp"]["password"].value=password;
	document.forms["modaladdemp"]["email"].value=email;
	document.forms["modaladdemp"]["phone"].value=phoneno;
	document.forms["modaladdemp"]["dt"].value=joindate;
	document.forms["modaladdemp"]["Role"].value=role;
	 $('#myModal').modal('show');
}
 


function ValidateAddProj() {
	if(a==true&&b==true&&c==true){
		  /* alert("callles"); */  
		$(document).ready(function() {
		  $('#addprojbtn').attr("disabled", false);
		   });
	}
	else{
		$(document).ready(function() {
		  $('#addprojbtn').attr("disabled", true);
		   });
	}
	}



/*for assignProj*/
function ValidateProj() {
	/* alert(); */
	var proj=document.getElementById("proj").value;
	/* alert(projname); */
	if(proj==""){
		 a=false;
	}
	else{
		a=true;	
	}
   	/* alert("A IS"+a); */ 
	ValidateAssignProj();
}

function ValidateEmployee() {
	/* alert(); */
	var emp=document.getElementById("emp").value;
	/* alert(projname); */
	if(emp==""){
		 b=false;
	}
	else{
		b=true;	
	}
   	/* alert("A IS"+a); */ 
	ValidateAssignProj();
}

function ValidateManager() {
	/* alert(); */
	var manager=document.getElementById("manager").value;
	/* alert(projname); */
	if(manager==""){
		 c=false;
	}
	else{
		c=true;	
	}
   	/* alert("A IS"+a); */ 
	ValidateAssignProj();
}

function ValidateAssignProj() {
	if(a==true&&b==true&&c==true){
		  /* alert("callles"); */  
		$(document).ready(function() {
		  $('#asignprojbtn').attr("disabled", false);
		   });
	}
	else{
		$(document).ready(function() {
		  $('#asignprojbtn').attr("disabled", true);
		   });
	}
}

var op=false;
var np=false;

function oldValids() {
	/* alert(); */
	var oldpass=document.getElementById("oldpass").value;
	/* alert(projname); */
	if(oldpass==""){
		op=false;
	}
	else{
		op=true;	
	}
   	/* alert("A IS"+a); */ 
	ValidateChangePassword();
}

function newValids() {
	/* alert(); */
	var newpass=document.getElementById("newpass").value;
	/* alert(projname); */
	if(newpass==""){
		 np=false;
	}
	else{
		np=true;	
	}
   	/* alert("A IS"+a); */ 
	ValidateChangePassword();
}


function ValidateChangePassword() {
	if(op==true&&np==true){
		  /* alert("callles"); */  
		$(document).ready(function() {
		  $('#changebtn').attr("disabled", false);
		   });
	}
	else{
		$(document).ready(function() {
		  $('#changebtn').attr("disabled", true);
		   });
	}
}

/*Disables validaters*/
$(document).ready(function(){
	$('#user_info').hide();

});

$(document).ready(function(){
	$('#username_info').hide();

});

$(document).ready(function(){
	$('#pswd_info').hide();

});

$(document).ready(function(){
	$('#email_info').hide();

});

$(document).ready(function(){
	$('#phone_info').hide();

});

$(document).ready(function(){
	$('#chpswd_info').hide();

});


/*Enables validators*/

/*for name*/
$(document).ready(function(){
	
	$('#regname').keyup(function() {
		var name = $(this).val();
		if ( name.match( "[a-z]|[A-Z].*") ) {
			$('#namevalids').removeClass('invalid').addClass('valid');
		} else {
			$('#namevalids').removeClass('valid').addClass('invalid');
		}
		if(name.match("[0-9]")){
			$('#namevalids').removeClass('valid').addClass('invalid');
		}
		if(name.match("[^a-zA-Z0-9\-\/]")){
			$('#namevalids').removeClass('valid').addClass('invalid');
		}
	}).focus(function() {
		$('#user_info').show();
	}).blur(function() {
		$('#user_info').hide();
	});
	
});

/*for password*/
$(document).ready(function(){
	
	$('#password').keyup(function() {
		var pswd = $(this).val();
		
		//validate the length
		if ( pswd.length < 8 ) {
			$('#length').removeClass('valid').addClass('invalid');
		} else {
			$('#length').removeClass('invalid').addClass('valid');
		}
		
		//validate letter
		if ( pswd.match(/[A-z]/) ) {
			$('#letter').removeClass('invalid').addClass('valid');
		} else {
			$('#letter').removeClass('valid').addClass('invalid');
		}

		//validate capital letter
		if ( pswd.match(/[A-Z]/) ) {
			$('#capital').removeClass('invalid').addClass('valid');
		} else {
			$('#capital').removeClass('valid').addClass('invalid');
		}

		//validate number
		if ( pswd.match(/\d/) ) {
			$('#number').removeClass('invalid').addClass('valid');
		} else {
			$('#number').removeClass('valid').addClass('invalid');
		}
		
		//validate space
		if ( pswd.match(/[^a-zA-Z0-9\-\/]/) ) {
			$('#space').removeClass('invalid').addClass('valid');
		} else {
			$('#space').removeClass('valid').addClass('invalid');
		}
		
	}).focus(function() {
		$('#pswd_info').show();
	}).blur(function() {
		$('#pswd_info').hide();
	});
	
});
/*for email*/
$(document).ready(function(){
	
	$('#email').keyup(function() {
		var email = $(this).val();
		if (email.match( "^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$") ) {
			$('#emailvalids').removeClass('invalid').addClass('valid');
		} else {
			$('#emailvalids').removeClass('valid').addClass('invalid');
		}
				
	}).focus(function() {
		$('#email_info').show();
	}).blur(function() {
		$('#email_info').hide();
	});
	
});

/*for phone*/
$(document).ready(function(){
	
	$('#phone').keyup(function() {
		var phone = $(this).val();
		if ( phone.match("[0-9]{10,}") ) {
			$('#tenvalids').removeClass('invalid').addClass('valid');
		} else {
			$('#tenvalids').removeClass('valid').addClass('invalid');
		}
		if(phone.length>10){
			$('#tenvalids').removeClass('valid').addClass('invalid');
		}
		if ( phone.match(/[9|8|7]/) ) {
			$('#startvalids').removeClass('invalid').addClass('valid');
		} else {
			$('#startvalids').removeClass('valid').addClass('invalid');
		}
				
	}).focus(function() {
		$('#phone_info').show();
	}).blur(function() {
		$('#phone_info').hide();
	});
	
});

$(document).ready(function(){
	
	$('#username').keyup(function() {
	}).focus(function() {
		$('#username_info').show();
	}).blur(function() {
		$('#username_info').hide();
	});
	
});

/*for change password*/
$(document).ready(function(){
	
	$('#newpass').keyup(function() {
		var pswd = $(this).val();
		//validate the length
		if ( pswd.length < 8 ) {
			$('#chlength').removeClass('valid').addClass('invalid');
			a=false;
		} else {
			$('#chlength').removeClass('invalid').addClass('valid');
			a=true;
		}
		
		//validate letter
		if ( pswd.match(/[a-z]/) ) {
			$('#chletter').removeClass('invalid').addClass('valid');
			a=true;
		} else {
			$('#chletter').removeClass('valid').addClass('invalid');
			a=false;
		}

		//validate capital letter
		if ( pswd.match(/[A-Z]/) ) {
			$('#chcapital').removeClass('invalid').addClass('valid');
			a=true;
		} else {
			$('#chcapital').removeClass('valid').addClass('invalid');
			a=false;
		}

		//validate number
		if ( pswd.match(/\d/) ) {
			$('#chnumber').removeClass('invalid').addClass('valid');
			a=true;
		} else {
			$('#chnumber').removeClass('valid').addClass('invalid');
			a=false;
		}
		
		//validate space
		if ( pswd.match(/[^a-zA-Z0-9\-\/]/) ) {
			$('#chspace').removeClass('invalid').addClass('valid');
			a=true;
		} else {
			$('#chspace').removeClass('valid').addClass('invalid');
			a=false;
		}
		
	}).focus(function() {
		$('#chpswd_info').show();
	}).blur(function() {
		$('#chpswd_info').hide();
	});
	
});

function validateNew(){
	
	np=document.getElementById("newpass").value;
	cnp=document.getElementById("cnfpass").value;
	if(np==cnp){
		document.getElementById("newerr").innerHTML="<font style=color:green><h4>Matches</h4></font>";
		f==true;
	}
	else{
		document.getElementById("newerr").innerHTML="<font style=color:red><h4>Not matches</h4></font>";
		f==false;
	}
}

//perfect validations
$(document).ready(function(){
	$('changebtn').click(function(){
		alert("i am coming");
		if(a==true){
			return true;
		}
		else{
			return false;
		}
	});
});