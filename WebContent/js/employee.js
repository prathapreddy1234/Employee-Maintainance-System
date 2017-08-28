$(document).ready(function(){
	$('#relieve').hide();
	$('#requestsbtn').click(function() {
		$('#home').hide();
		$('#relieve').show();
		$('#editprofile').hide();
		$('#changeMPass').hide();
	});
	$('#homebtn').click(function() {
		$('#home').show();
		$('#relieve').hide();
		$('#editprofile').hide();
		$('#changeMPass').hide();
	});
	$('#empeditbtn').click(function() {
		$('#home').hide();
		$('#relieve').hide();
		$('#editprofile').show();
		$('#changeMPass').hide();
	});
	$('#mchangebtn').click(function() {
		$('#home').hide();
		$('#relieve').hide();
		$('#editprofile').hide();
		$('#changeMPass').show();
	});
	/* Stores Reason */
	 $('#reasonbtn').click(function () {
		
			    var reason=$('#reasontxt').val();			    
			        $.ajax({
			            type: "post",
			            url: "relieveReason.jsp", // this is my servlet
			            data: {reason},
			            success: function(msg){      
			            	 $("#panel").slideDown(1000).delay(2000).slideUp(500);	 
			            }
			        });
			    });
	 
	 $('#empchangebtn').click(function ()
			    {
			    var old=$('#oldpass').val();
			    var newp=$('#cnfpass').val();
			        $.ajax({
			            type: "",
			            url: "EmpChangePassword", //this is my servlet
			            data: {old,newp},
			            success: function(msg){      
			            	 $("#panel").slideDown(1000).delay(2000).slideUp(500);	 
			                    
			            }
			        });
			    });

			});

$(document).ready(function() {
    $('#updateempbtn').click(function ()
    {
    	var name=$('#updtmngrname').val();
    	var email=$('#email').val();
    	var phone=$('#phone').val();
        $.ajax({
            type: "post",
            url: "UpdateEmployee", //this is my servlet
            data: {name,email,phone},
            success: function(msg){      
            	 $("#panel").slideDown(1000).delay(2000).slideUp(500);	 
                    
            }
        });
    });

});  /*end of ready*/