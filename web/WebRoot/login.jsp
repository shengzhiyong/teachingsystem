<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<!-- 新 Bootstrap 核心 CSS 文件 -->
	<link rel="stylesheet" href="css/bootstrap.min.css">
	
	<!-- 可选的Bootstrap主题文件（一般不用引入） -->
	<link rel="stylesheet" href="css/bootstrap-theme.min.css">
	
	<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
	<script src="js/jquery-1.11.1.min.js"></script>
	
	
  </head>
  <style>

.form-horizontal {
	padding-top : 100px;
}
.control-group {
	margin-left:auto;
	margin-right:auto;
	width:70%;
}
.controls {
	margin-top : 10px;
}
</style>
<script type="text/javascript">
$(function(){
  		
		var un = document.getElementById("username");   
		var pwd = document.getElementById("password");   
  		
  		$("#username").change(function(){
			//增加客户端验证  
			if(!un.value){  
			  $("#sp1").html("请输入用户名！"); 
			} else {
				$("#sp1").html(""); 
			}
		})
  		
  		$("#password").change(function(){
			//增加客户端验证  
			if(!pwd.value){  
			  $("#sp2").html("请输入密码！"); 
			} else {
				$("#sp2").html(""); 
			}
		})
		
  		$("#btn").click(function(){
  		re= /select|update|delete|exec|count|’|"|=|;|>|<|%/i;
  			$("#sp").html("");
  			if(!un.value){  
			  $("#sp1").html("请输入用户名！"); 
			  return;
			} else {
				$("#sp1").html(""); 
			}
  			if(!pwd.value){  
			  $("#sp2").html("请输入密码！"); 
			  return;
			} else {
				$("#sp2").html(""); 
			}
			 if ( re.test(un.value) )
     {
     alert("请您不要在参数中输入特殊字符和SQL关键字！"); 
     return;
    } 
		 if ( re.test(pwd.value) )
    {
    alert("请您不要在参数中输入特殊字符和SQL关键字！");
    return ;
   } 

  			$.ajax({
  				type : "post",
  				url : "loginServlet",
  				data : $("#f").serialize(),
  				dataType : "json",
  				success : function(msg){
  					if(msg == 0){
  						$("#sp").html("用户名或密码错误！");
  					} else if(msg == 1) {
  						location = "sysuser.jsp";
  					} else if(msg == 2) {
  						location = "teacher.jsp";
  					} else if(msg == 3) {
  						location = "student.jsp";
  					}else if(msg == 4){location="pingjiaozhe.jsp"}
  				}
  			});
  		});
  		
  	});
</script>
<body>
	  <div class="container-fluid">
		  <div class="row">
			  <div class="col-md-10 col-md-offset-1">
		  		<div class="jumbotron" style="background-color:#76ee00;">
				  <h2 style="font-family:微软雅黑;color:blue";>
				  	&emsp;&emsp;&emsp;登录界面
				  </h2>
			  	</div>
		 	 </div>
	 	 </div>
	  </div>
	  
	  
	    <div class="container-fluid">
	  	<div class="row">
		  <div class="col-md-5 col-md-offset-4">
	
			  <form class="form-horizontal" autocomplete="off" style="padding:0px;" id="f" action="loginServlet" method="post">
			    <fieldset>
			      <div id="legend" class="">
			        <legend class="">登录</legend>
			      </div>
			    <div class="control-group">
			
			          <!-- Text input-->
			          <label class="control-label" for="input01">用户名</label>
			          <div class="controls">
			            <input type="text" placeholder="请输入用户名" class="input-xlarge" id="username" name="username" >
			            <span id="sp1" style="color:red;"></span>
			          </div>
			        </div>
			
			    
			
			    <div class="control-group">
			
			          <!-- Text input-->
			          <label class="control-label" for="input02" >密码</label>
			          <div class="controls">
			            <input type="password" placeholder="请输入密码" class="input-xlarge" id="password" name="password">
			            <span id="sp2" style="color:red;"></span>
			          </div>
			<br/>
			          <!-- Button -->
			          <div class="controls">
			            <input type="button" id="btn" class="btn btn-info" value="登录" />
			          </div>
			<span id="sp" style="color:red;"></span>
			        </div>
			    </fieldset>
			  </form>

		  </div>
		</div>
	  </div>
</body>

</html>
<%--

  <body>
	<form name="f" action="loginServlet?method=login" method="post" >
		用户名：<input type="text" id="username" name="username" />
		 		<span id="sp1"></span></br>
		密     码：<input type="password" id="password" name="password" />
				<span id="sp2"></span></br>
		<input type="button" id="btn" value="登录" /></br>
		<span id="sp"></span>
	</form>
	
  </body>
</html>

--%>