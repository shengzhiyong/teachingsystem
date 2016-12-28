<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'teacher.jsp' starting page</title>
    
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
  <script type="text/javascript">
  	$(function(){
  		
  		var pwd = document.getElementById("exampleInputPassword");   
  		var pwd1 = document.getElementById("exampleInputPassword1");   
		var pwd2 = document.getElementById("exampleInputPassword2");   
  		
  			$("#exampleInputPassword").change(function(){
			//增加客户端验证  
			if(!pwd.value){  
			  $("#sp").html("旧密码不能为空！"); 
			} else {
				$("#sp").html(""); 
			}
		})
		
		$("#exampleInputPassword1").change(function(){
			//增加客户端验证  
			if(!pwd1.value){  
			  $("#sp1").html("新密码不能为空！"); 
			} else {
				$("#sp1").html(""); 
			}
		})
		
		$("#exampleInputPassword2").change(function(){
			//增加客户端验证  
			if(!pwd2.value){ 
			  $("#sp2").html("请重复输入新密码！"); 
			} else {
				$("#sp2").html(""); 
			}
			if(pwd1.value != pwd2.value) {
				$("#sp2").html("两次密码输入不同！"); 
			} else {
				$("#sp2").html(""); 
			}
		})
  		
  		$("#btn").click(function(){
  			var a=0,b=0,c=0,d=0;
  			if(!pwd.value){  
			  $("#sp").html("旧密码不能为空！"); 
			} else {
				a=1
			}
  			if(!pwd1.value){  
			  $("#sp1").html("新密码不能为空！"); 
			} else {
				b=1
			}
  			if(!pwd2.value){ 
			  $("#sp2").html("请重复输入新密码！"); 
			}else {
				c=1
			}
  			if(pwd1.value != pwd2.value) {
				$("#sp2").html("两次密码输入不同！"); 
			} else {
				d=1
			}
  			if(a&b&c != 0) {
  				$.ajax({
					type : "post",
					url : "userServlet?method=updatePwd",
					data :$("#f").serialize(),
					success : function(msg){
						if(msg == '1'){
							$("#sp3").html("修改成功！");
						} else {
							$("#sp").html("旧密码错误！");
						}
					}
				});
  			}
			
	  	});
  			
  		
  	
		
  			
  	});
  	
  		function checkMsg() {
	  		$("#msg").css("display","block")
	  		$("#uppwd").css("display","none")
	  		$("#tip").css("display","none")
	  		$("#result").css("display","none")
	  		$("#teacher").css("display","none")
	  	}
	  	  function  teacher() {
	  		$("#msg").css("display","none")
	  		$("#uppwd").css("display","none")
	  		$("#tip").css("display","none")
	  		$("#result").css("display","none")
	  		$("#teacher").css("display","block")
	  		
	  		$.ajax({
  				type : "post",
  				url : "initServlet?method=teacherResult",
  				data : {
  					"id" : ${sessionScope.number }
  				},
  				dataType : "json",
  				success : function(msg){
  					var str = "";
					for(var i = 0; i < msg.length; i ++) {
						str += '<tr>';
						str += '<td>' + msg[i].coursename + '</td>';
						str += '<td>' + msg[i].studentname + '</td>';
						str += '<td>' + msg[i].id + '</td>';
						str += '</tr>';
					}
  					$("#asd").html(str);
  				}
  			});
	  	}
	  	function checkResult() {
	  		$("#msg").css("display","none")
	  		$("#uppwd").css("display","none")
	  		$("#tip").css("display","none")
	  		$("#result").css("display","block")
	  		$("#teacher").css("display","none")
	  		
	  		$.ajax({
			type : "post",
			url : "initServlet?method=teacherInit",
			data : {
				"id" : ${sessionScope.number }
			},
			dataType : "json",
			success : function(msg){
				var str = "";
				for(var i = 0; i < msg.length; i ++) {
					str += '<li role="presentation"><a class="courseli" href="javascript:void(0);" cn="'+msg[i].coursename+'">';
					str += msg[i].coursename;
					str += '</a></li>';
				}
				$("#toshow").html(str);
				$(".courseli").click(function() {
					var coursename = $(this).attr("cn");
					$.ajax({
						type : "post",
						url : "initServlet?method=showResult",
						data : {
							"coursename" : coursename,
							"id" : ${sessionScope.number }
						},
						dataType : "json",
						success : function(msg){
							var str = '';
							for(var i = 0; i < msg.length; i ++) {
								str += '<tr>';
								str += '<td>' + msg[i].student_id + '</td>';
								str += '<td>' + msg[i].studentName + '</td>';
								str += '<td><input type="text" snum="'+msg[i].student_id+'" class="sresult" value="'+msg[i].result+'" /></td>';
								str += '</tr>';
							}
							$("#tbodyresult").html(str);
							
							$(".sresult").change(function() {
								$.ajax({
									type : "post",
									url : "userServlet?method=updateResult",
									data :{num:$(this).attr("snum"),val:$(this).val(),coursename:coursename},
									success : function(msg){
										
									}
								});
							})
						}
					});
				})
			}
		});
	  	}
	  	function updatePwd() {
	  		$("#msg").css("display","none")
	  		$("#uppwd").css("display","block")
	  		$("#tip").css("display","block")
	  		$("#result").css("display","none")
	  		$("#teacher").css("display","none")
	  	}
	  	
	  	
	  	
	  
  	
  </script>
  
  
  <body>
  <div class="container-fluid">
	  <div class="row">
		  <div class="col-md-10 col-md-offset-1">
	  		<div class="jumbotron" style="background-color:#02f78e;margin:0">
			  <h2 style="font-family:微软雅黑;color:#F0F8FF";>
			  	&emsp;&emsp;&emsp;教 务 管 理 信 息 系 统之教师
			  </h2>
			  <p class="text-right" style="color:#F0F8FF;font-size:14px">
			 	 欢迎您：${sessionScope.name }！&emsp;
			  </p>
		  	</div>
	  	</div>
 	</div>
 </div>
  <HR style="FILTER: progid:DXImageTransform.Microsoft.Shadow(color:#987cb9,direction:145,strength:15)" width="80%" color=#987cb9 SIZE=1>
  
  <div class="container-fluid">
	  <div class="row">
		  <div class="col-md-2 col-md-offset-1">
		  	<div class="list-group">
			  <a href="javascript:void(0);" onclick="checkMsg()" class="list-group-item">✟&ensp;个人信息</a>
			  <a href="javascript:void(0);" onclick="checkResult()" class="list-group-item">✟&ensp;我的课程</a>
			  <a href="javascript:void(0);" onclick="updatePwd()" class="list-group-item">✟&ensp;重置密码</a>
			   <a href="javascript:void(0);" onclick="teacher()" class="list-group-item">✟&ensp;已评教信息</a>
			</div>
		  </div>
		 
		  <div class="col-md-4 col-md-offset-1" id="msg" style="display:none">
		    <table class="table table-striped">
		    	<tr>
		    		<th>用户名</th>
		    		<td>${sessionScope.username }</td>
		    	</tr>
		    	<tr>
		    		<th>姓    名</th>
		    		<td>${sessionScope.name }</td>
		    	</tr>
		    	<tr>
		    		<th>专    业</th>
		    		<td>${sessionScope.major }</td>
		    	</tr>
		    	<tr>
		    		<th>职工号</th>
		    		<td>${sessionScope.number }</td>
		    	</tr>
		    	<tr>
		    		<th>性    别</th>
		    		<td>${sessionScope.gender }</td>
		    	</tr>
		    	<tr>
		    		<th>年    龄</th>
		    		<td>${sessionScope.age }</td>
		    	</tr>
		    </table>
		    </div>
		    <div class="col-md-4 col-md-offset-1" id="uppwd" style="display:none">
		    	<form role="form" id="f" action="" method="post"  autocomplete="off">
				  	<div class="form-group">
				    <label for="exampleInputPassword">旧密码：</label>
				    <input type="password" class="form-control" name="pwd" id="exampleInputPassword" placeholder="请输入旧密码">
				    
				  </div>
				  <div class="form-group">
				    <label for="exampleInputPassword1">新密码：</label>
				    <input type="password" class="form-control" name="pwd1" id="exampleInputPassword1" placeholder="请输入新密码">
				  </div>
				  <div class="form-group">
				    <label for="exampleInputPassword2">重复密码：</label>
				    <input type="password" class="form-control" name="pwd2" id="exampleInputPassword2" placeholder="请输入重复输入新密码">
				   
				  </div>
				  <button type="button" id="btn" class="btn btn-default">保存</button>
				  <span id="sp3" style="color:red"></span><br/>
				</form>
				
   			</div>
   			<div class="col-md-3" id="tip" style="display:none">
   			<br/>
   			  <span id="sp" style="color:red"></span><br/><br/><br/><br/>
   			  <span id="sp1" style="color:red"></span><br/><br/><br/><br/>
   			  <span id="sp2" style="color:red;"></span><br/><br/><br/><br/>
   			  
   			</div>
   			<div class="col-md-4 col-md-offset-1" id="result" style="display:none">
			  
			
				<table class="table table-bordered">
		    		<tr>
		    			<th>学号</th>
		    			<th>姓名</th>
		    			<th>成绩</th>
		    		</tr>
		    		<tbody id="tbodyresult"></tbody>
		    	</table>
     		</div>
     		<div class="col-md-4 col-md-offset-1" id="teacher" style="display:none">
			    <table class="table table-bordered">
			    	<tr>
			    		<th>课程名</th>
			    		<th>教师</th>
			    		<th>对教师评价</th>
			    	</tr>
			    	<tbody id="asd">
			  
			    	</tbody>
			    </table>
     		</div>
 	</div>
 </div>
  
  <%--
    <table border="1">
    	<tr>
    		<th>用户名</th>
    		<td>${sessionScope.username }</td>
    	</tr>
    	<tr>
    		<th>姓    名</th>
    		<td>${sessionScope.name }</td>
    	</tr>
    	<tr>
    		<th>专    业</th>
    		<td>${sessionScope.major }</td>
    	</tr>
    	<tr>
    		<th>职工号</th>
    		<td>${sessionScope.number }</td>
    	</tr>
    	<tr>
    		<th>性    别</th>
    		<td>${sessionScope.gender }</td>
    	</tr>
    	<tr>
    		<th>年    龄</th>
    		<td>${sessionScope.age }</td>
    	</tr>
    </table>
    <a href="updatePwd.jsp">重置密码</a><br/>
    <table border="1">
    	<tr>
    		<th>我的课程</th>
    	</tr>
    	<tbody id="myCourse">
    		
    	</tbody>
    </table>
    <div id="resultTable" >
    	<table border="1">
    		<caption id="coursename"></caption>
    		<tr>
    			<th>学号</th>
    			<th>姓名</th>
    			<th>成绩</th>
    		</tr>
    		<tbody id="result"></tbody>
    	</table>
    </div>
  --%></body>
</html> 
