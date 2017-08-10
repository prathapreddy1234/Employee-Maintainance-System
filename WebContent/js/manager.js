function validateMOld() {
	var xmlhttp;
	var urls = "mngrpassChanger.jsp?pass="+document.getElementById("oldpass").value;

	if (window.XMLHttpRequest) {
		xmlhttp = new XMLHttpRequest();
	} else {
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.open("GET", urls, true);
	xmlhttp.send();
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4) {
			//document.getElementById("err").style.color="red";
			document.getElementById("mngrolderr").innerHTML = xmlhttp.responseText;

		}
	}
	
}

$(document).ready(function() {
    $('#changebtn').click(function ()
    {
    var old=$('#oldpass').val();
    var newp=$('#cnfpass').val();
        $.ajax({
            type: "post",
            url: "ChangeMPassword", //this is my servlet
            data: {old,newp},
            success: function(msg){      
            	 $("#panel").slideDown(1000).delay(2000).slideUp(500);	 
                    
            }
        });
    });

});

$(document).ready(function() {
    $('#updatembtn').click(function ()
    {
    	var name=$('#updtmngrname').val();
    	var email=$('#email').val();
    	var phone=$('#phone').val();
        $.ajax({
            type: "post",
            url: "EditManager", //this is my servlet
            data: {name,email,phone},
            success: function(msg){      
            	 $("#panel").slideDown(1000).delay(2000).slideUp(500);	 
                    
            }
        });
    });

});
//declarations
a=false;
b=false;
c=false;
d=false;
e=false;
$(document).ready(function(){
	$(a).on('click', function(){$(this).css("background-color:yellow	");});	
});

$(document).ready(function() {
	$('#home').hide();
	$('#requests').hide();
	$('#editprofile').hide();
	$('#changeMPass').hide();
	$('#manager_chpass_info').hide();
	$('#manager_newcheck_info').hide();
	$('#manager_oldcheck_info').hide();
});

$(document).ready(function() {
	$('li a').click(function() {
		$('a').removeClass('active');
		$(this).addClass('active');
	});
});

$(document).ready(function() {
	$('#homebtn').click(function() {
		$('#home').show();
		$('#requests').hide();
		$('#editprofile').hide();
		$('#changeMPass').hide();
	});
	$('#requestsbtn').click(function() {
		$('#home').hide();
		$('#requests').show();
		$('#editprofile').hide();
		$('#changeMPass').hide();
	});
	$('#editbtn').click(function() {
		$('#home').hide();
		$('#requests').hide();
		$('#editprofile').show();
		$('#changeMPass').hide();
	});
	$('#mchangebtn').click(function() {
		$('#home').hide();
		$('#requests').hide();
		$('#editprofile').hide();
		$('#changeMPass').show();
	});
});
/*disable the update btn*/
$(document).ready(function() {
    $('#updatembtn').attr("disabled", true);
});

function ValidateUpdateMName() {
	/* alert(); */
	var name=document.getElementById("updtmngrname").value;
	if(name==""){
		 a=false;
	}
	else{
		a=true;	
	}
	/* alert("A IS"+a); */ 
	ValidateManagerUpdate();
}

function ValidateUpdateMEmail() {
	/* alert(); */
	var email=document.getElementById("email").value;
	if(email==""){
		 b=false;
	}
	else{
		b=true;	
	}
	/* alert("A IS"+a); */ 
	ValidateManagerUpdate();
}

function ValidateUpdateMPhone() {
	/* alert(); */
	var phone=document.getElementById("phone").value;
	if(phone==""){
		 c=false;
	}
	else{
		c=true;	
	}
	/* alert("A IS"+a); */ 
	ValidateManagerUpdate();
}


function ValidateManagerUpdate() {
	if(a==true&&b==true&&c==true){
		$('#updatembtn').attr("disabled", false);
	}
	else{
		$('#updatembtn').attr("disabled", true);
	}
		
}


/*hide the infos*/
$(document).ready(function() {
	$('#edit_manager_name_info').hide();
	$('#edit_manager_email_info').hide();
	$('#edit_manager_phone_info').hide();
});

/*for manage edit name*/
$(document).ready(function(){
	
	$('#updtmngrname').keyup(function() {
		var name = $(this).val();
		if ( name.match( "[a-z]|[A-Z].*") ) {
			$('#m_editnamevalids').removeClass('invalid').addClass('valid');
			a=true;
		} else {
			$('#m_editnamevalids').removeClass('valid').addClass('invalid');
			a=false;
		}
		if(name.match("[0-9]")){
			$('#m_editnamevalids').removeClass('valid').addClass('invalid');
			a=true;
		}
		if(name.match("[^a-zA-Z0-9\-\/]")){
			$('#m_editnamevalids').removeClass('valid').addClass('invalid');
			a=true;
		}
	}).focus(function() {
		$('#edit_manager_name_info').show();
	}).blur(function() {
		$('#edit_manager_name_info').hide();
	});
	
});

/*for manage edit email*/
$(document).ready(function(){
	
	$('#email').keyup(function() {
		var email = $(this).val();
		if (email.match( "^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$") ) {
			$('#m_editemailvalids').removeClass('invalid').addClass('valid');
		} else {
			$('#m_editemailvalids').removeClass('valid').addClass('invalid');
		}
				
	}).focus(function() {
		$('#edit_manager_email_info').show();
	}).blur(function() {
		$('#edit_manager_email_info').hide();
	});
	
});


/*for phone*/
$(document).ready(function(){
	
	$('#phone').keyup(function() {
		var phone = $(this).val();
		if ( phone.match("[0-9]{10,}") ) {
			$('#m_editphonetenvalids').removeClass('invalid').addClass('valid');
		} else {
			$('#m_editphonetenvalids').removeClass('valid').addClass('invalid');
		}
		if(phone.length>10){
			$('#m_editphonetenvalids').removeClass('valid').addClass('invalid');
		}
		if ( phone.match(/[9|8|7]/) ) {
			$('#m_editphonestartvalids').removeClass('invalid').addClass('valid');
		} else {
			$('#m_editphonestartvalids').removeClass('valid').addClass('invalid');
		}
				
	}).focus(function() {
		$('#edit_manager_phone_info').show();
	}).blur(function() {
		$('#edit_manager_phone_info').hide();
	});
	
});

$(document).ready(function(){
	$('#newpass').focus(function() {
		$('#manager_chpass_info').show();
	}).blur(function() {
		$('#manager_chpass_info').hide();
	});
	
});

$(document).ready(function(){
	$('#oldpass').focus(function() {
		$('#manager_oldcheck_info').show();
	}).blur(function() {
		$('#manager_oldcheck_info').hide();
	});
	
});

$(document).ready(function(){
	$('#cnfpass').focus(function() {
		$('#manager_newcheck_info').show();
	}).blur(function() {
		$('#manager_newcheck_info').hide();
	});
	
});
/*perfect validations for edit manager*/


/*.slideUp(500)
.delay(5000)
.slideDown(500);*/