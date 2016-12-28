$(function(){
  		
  		
  		$("#username").change(function(){
			var un = document.getElementById("username");   
			//增加客户端验证  
			if(!un.value){  
			  $("#sp1").html("请输入用户名！"); 
			} else {
				$("#sp1").html(""); 
			}
		})
  		
  		$("#password").change(function(){
			var pwd = document.getElementById("password");   
			//增加客户端验证  
			if(!pwd.value){  
			  $("#sp2").html("请输入密码！"); 
			} else {
				$("#sp2").html(""); 
			}
		})
		
  		var name = document.getElementById("username");   
  		var pwd = document.getElementById("password"); 
  		$("#btn").click(function(){
  			
  			$.ajax({
  				type : "post",
  				url : "loginServlet",
  				data : {
  					"username" : name,
  					"password" : pwd
  					
  				},
  				dataType : "json",
  				success : function(msg){
  					if(msg == 1){
  					} else {
  						$("#sp").html("用户名或密码错误！");
  					}
  				}
  			});
  		});
  		
  	});