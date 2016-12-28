<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'sysuser.jsp' starting page</title>
    
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
	
	var condition = null

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
		
		var un = document.getElementById("username");   
		var pwd0 = document.getElementById("password");   
		var per = document.getElementById("permission");   
		var num = document.getElementById("number");   
		var maj = document.getElementById("major");   
		var name = document.getElementById("name");   
		var gender = document.getElementById("gender");   
		var age = document.getElementById("age");   
  		
		
  		$("#btnReg").click(function(){
  			var a=0,b=0,c=0,d=0,e=0,f=0,g=0,h=0
  			$("#sp11").html("");
  			if(!un.value){  
			  $("#sp12").html("请输入用户名！"); 
			} else {
				a=1
				$("#sp12").html(""); 
			}
  			if(!pwd0.value){  
			  $("#sp4").html("请输入密码！"); 
			} else {
				b=1
				$("#sp4").html(""); 
			}
  			var flag1=false
  			for(var i=0;i<document.getElementsByName("permission").length;i++) {
  				if(document.getElementsByName("permission")[i].checked) {
  					flag1=true
  					break
  				}
  			}
  			if(flag1) {
  				c=1
				$("#sp5").html(""); 
  			} else {
  				$("#sp5").html("请选择权限！"); 
  			}
  			
  			if(!num.value){  
			  $("#sp6").html("请输入学号/职工号，管理员请填0！"); 
			} else {
				d=1
				$("#sp6").html(""); 
			}
  			if(document.getElementsByName("permission")[0].checked == false && maj.value=='无') {
  				$("#sp7").html("非管理员用户请选择专业！"); 
  			} else {
  				e=1
				$("#sp7").html(""); 
  			}
  			if(!name.value){  
			  $("#sp8").html("请输入用户真实姓名！"); 
			} else {
				f=1
				$("#sp8").html(""); 
			}
  			var flag2=false
  			for(var i=0;i<document.getElementsByName("gender").length;i++) {
  				if(document.getElementsByName("gender")[i].checked) {
  					flag2=true
  					break
  				}
  			}
  			if(flag2) {
  				g=1
				$("#sp9").html(""); 
  			} else {
  				$("#sp9").html("请选择性别！"); 
  			}
  			if(!age.value){  
			  $("#sp10").html("请输入年龄！"); 
			} else if(!isNaN(age.value)){
				h=1
				$("#sp10").html(""); 
			} else {
				$("#sp10").html("请输入数字！");
			}
  			if(a&b&c&d&e&f&g&h != 0) {
  				$.ajax({
  				type : "post",
  				url : "regServlet",
  				data : $("#regForm").serialize(),
  				dataType : "json",
  				success : function(msg){
  					if(msg == 1){
  						$("#sp11").html("注册成功！");
  					}
  				}
  			});
  			}
  			
  			
  		});
  		
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
  		
  		var major = null;
  		var coursename = null;
  			
  		$(".ddbtn1").mouseenter(function(){
  			$(".ddm1").css("display","block")
  			$.ajax({
				type : "post",
				url : "initServlet?method=sysuserInitByM",
				dataType : "json",
				success : function(msg) {
					var str = "";
					for(var i = 0; i < msg.length; i ++) {
						str += '<li major="' + msg[i].major + '">';
			    		str += '<a href="javascript:void(0);" >';
			    		str += msg[i].major;
			    		str += '</a></li>';
					}
					$(".ddm1").html(str);
					$(".ddm1").find('li').click(function() {
						major = $(this).attr("major")
						$.ajax({
							type : "post",
							url : "initServlet?method=sysuserInitSelectCByM",
							data : {major:$(this).attr("major")},
							dataType : "json",
							success : function(msg) {
								var str = "";
								for(var i = 0; i < msg.length; i ++) {
									str += '<li cn="' + msg[i].coursename + '">';
						    		str += '<a href="javascript:void(0);">';
						    		str += msg[i].coursename;
						    		str += '</a></li>';
								}
								$(".ddm2").html(str);
									
								}
							})
			  			})
			  			}
					})
				
  			})
  		
  		$(".ddm1").mouseleave(function(){
  			$(".ddm1").css("display","none")
  		})
  		$(".ddbtn2").mouseenter(function(){
  			$(".ddm2").css("display","block")
  			$(".ddm2").find('li').click(function() {
  				coursename = $(this).attr("cn")
  			})
  		})
  		$(".ddm2").mouseleave(function(){
  			$(".ddm2").css("display","none")
  		})
  		
  		$("#selectBtn").click(function() {
			 $.ajax({
				type : "post",
				url : "initServlet?method=sysuserInitByTSelectC",
				data:{
				 condition : condition,
				 coursename : coursename,
				 major : major
				 },
				dataType : "json",
				success : function(msg) {
					var str = "";
					for(var i = 0; i < msg.length; i ++) {
						str += '<tr class="aUser" usernum="'+msg[i].number+'" userper="'+msg[i].permission+'">';
			    		str += '	<td>' + msg[i].permission + '</td>';
			    		str += '	<td>' + msg[i].username + '</td>';
			    		str += '	<td>' + msg[i].name + '</td>';
			    		str += '	<td>' + msg[i].major + '</td>';
			    		str += '	<td>' + msg[i].number + '</td>';
			    		str += '	<td>' + msg[i].gender + '</td>';
			    		str += '	<td>' + msg[i].age + '</td>';
			    		str += '</tr>';
					}
					$("#tbody").html(str);
					$(".aUser").click(function(event){
						var usernum = $(this).attr("usernum");
						var userper = $(this).attr("userper");
						var usermajor = null;
						$("#tup").html("");
						$("#span").html("");
						$("#msg").css("display","none")
				  		$("#uppwd").css("display","none")
				  		$("#tip").css("display","none")
				  		$("#tip1").css("display","none")
				  		$("#result").css("display","none")
				  		$("#add").css("display","none")
				  		$("#updateUser").css("display","block")
				  		$.ajax({
							type : "post",
							url : "userServlet?method=updateUser",
							data : {usernum:usernum},
							dataType : "json",
							success : function(msg) {
								var u = msg[0];
								$("#upusername").val(u.username);
								if(u.permission == '管理员') {
									document.getElementById("per1").checked = true;
								} else if(u.permission == '教师') {
									document.getElementById("per2").checked = true;
								} else if(u.permission == '学生') {
									document.getElementById("per3").checked = true;
								}
								$("#upnum").val(u.number);
								$("#major").val(u.major);
								
								var count=$("#upmajor option").length;
								for(var i=0;i<count;i++) {         
									if($("#upmajor").get(0).options[i].text == u.major)  {  
								         $("#upmajor ").get(0).options[i].selected = true; 
								         usermajor = $("#upmajor ").get(0).options[i].text;
								          break;  
								    }  
								}
								$("#upmajor option[text='jQuery']").attr("selected", true);
								
								$("#upname").val(u.name);
								if(u.gender == '男') {
									document.getElementById("gen1").checked = true;
								} else if(u.gender == '女') {
									document.getElementById("gen2").checked = true;
								}
								$("#upage").val(u.age);
								
								$("#btnShowC").click(function(){
									$.ajax({
										type : "post",
										url : "userServlet?method=showC",
										data : {num:u.number,per:u.permission,major:usermajor},
										dataType : "json",
										success : function(msg) {
											var str="";
											if(u.permission == '教师') {
												for(var i=0;i<msg.length;i++) {
													str += '<tr>';
													if(i == 0) {
														str += '<th  rowspan="'+msg.length+'">课程</th>';
													}
													str += '<td>';
													str += '<div class="checkbox"><label><input name="check" type="checkbox" value="'+msg[i].coursename+'"/>'+msg[i].coursename+'</label></div>';
													str += '</td>';
													str += '</tr>';
												}
												var shu = msg.length;
												$("#tup").html(str);
												$.ajax({
													type : "post",
													url : "userServlet?method=selectCByT",
													data : {num:u.number},
													dataType : "json",
													success : function(msg1) {
														for(var j = 0;j<msg1.length;j++) {
															
														for(var i=0;i<shu;i++) {
															if(document.getElementsByName("check")[i].value == msg1[j].coursename) {
																document.getElementsByName("check")[i].click();
															}
														}
															
														}
														
													}
												})
											} else if(u.permission == '学生') {
												for(var i=0;i<msg.length;i++) {
													str += '<tr>';
													str += '<th>' + msg[i].coursename + '</th>';
													if(msg[i].result != null) {
														str += '<td>' + msg[i].result + '</td>';
													} else {
														str += '<td>未登记</td>';
													}
													str += '</tr>';
												}
												$("#tup").html(str);
											}
												
											}
										})
								})
								$("#btnUpdate").click(function() {
									$.ajax({
										type : "post",
										url : "userServlet?method=saveUpdate",
										data : $("#updateform").serialize(),
										dataType : "json",
										success : function(msg) {
											if(msg == 1) {
												$("#span").html("修改成功！");
											}
											}
										})
								})
									
							}
						})
						
					})
				}
			})		
		})
  		
  	});
  	
  		function addUser() {
  			$("#msg").css("display","none")
	  		$("#uppwd").css("display","none")
	  		$("#tip").css("display","none")
	  		$("#tip1").css("display","block")
	  		$("#result").css("display","none")
	  		$("#add").css("display","block")
	  		$("#updateUser").css("display","none")
  		}
  		function updataUser() {
  			$("#msg").css("display","none")
	  		$("#uppwd").css("display","none")
	  		$("#tip").css("display","none")
	  		$("#tip1").css("display","block")
	  		$("#result").css("display","none")
	  		$("#add").css("display","none")
	  		$("#updateUser").css("display","block")
  		}
  	
  	 	function checkMsg() {
	  		$("#msg").css("display","block")
	  		$("#uppwd").css("display","none")
	  		$("#tip").css("display","none")
	  		$("#tip1").css("display","none")
	  		$("#result").css("display","none")
	  		$("#add").css("display","none")
	  		$("#updateUser").css("display","none")
	  	}
	  	function updatePwd() {
	  		$("#msg").css("display","none")
	  		$("#uppwd").css("display","block")
	  		$("#tip").css("display","block")
	  		$("#tip1").css("display","none")
	  		$("#result").css("display","none")
	  		$("#add").css("display","none")
	  		$("#updateUser").css("display","none")
	  	}
	  	
	  	function checkResultByT() {
	  		$("#msg").css("display","none")
	  		$("#uppwd").css("display","none")
	  		$("#tip").css("display","none")
	  		$("#tip1").css("display","none")
	  		$("#result").css("display","block")
	  		$("#add").css("display","none")
	  		$("#updateUser").css("display","none")
	  		condition = 't'
	  		 $.ajax({
				type : "post",
				url : "initServlet?method=sysuserInitByT",
				dataType : "json",
				success : function(msg) {
					var str = "";
					for(var i = 0; i < msg.length; i ++) {
						str += '<tr class="aUser" usernum="'+msg[i].number+'" userper="'+msg[i].permission+'">';
			    		str += '	<td>' + msg[i].permission + '</td>';
			    		str += '	<td>' + msg[i].username + '</td>';
			    		str += '	<td>' + msg[i].name + '</td>';
			    		str += '	<td>' + msg[i].major + '</td>';
			    		str += '	<td>' + msg[i].number + '</td>';
			    		str += '	<td>' + msg[i].gender + '</td>';
			    		str += '	<td>' + msg[i].age + '</td>';
			    		str += '</tr>';
					}
					$("#tbody").html(str);
					$(".aUser").click(function(event){
						var usernum = $(this).attr("usernum");
						var userper = $(this).attr("userper");
						var usermajor = null;
						$("#tup").html("");
						$("#span").html("");
						$("#msg").css("display","none")
				  		$("#uppwd").css("display","none")
				  		$("#tip").css("display","none")
				  		$("#tip1").css("display","none")
				  		$("#result").css("display","none")
				  		$("#add").css("display","none")
				  		$("#updateUser").css("display","block")
				  		$.ajax({
							type : "post",
							url : "userServlet?method=updateUser",
							data : {usernum:usernum},
							dataType : "json",
							success : function(msg) {
								var u = msg[0];
								$("#upusername").val(u.username);
								if(u.permission == '管理员') {
									document.getElementById("per1").checked = true;
								} else if(u.permission == '教师') {
									document.getElementById("per2").checked = true;
								} else if(u.permission == '学生') {
									document.getElementById("per3").checked = true;
								}
								$("#upnum").val(u.number);
								$("#major").val(u.major);
								
								var count=$("#upmajor option").length;
								for(var i=0;i<count;i++) {         
									if($("#upmajor").get(0).options[i].text == u.major)  {  
								         $("#upmajor ").get(0).options[i].selected = true;  
								          break;  
								    }  
								}
								$("#upmajor option[text='jQuery']").attr("selected", true);
								
								$("#upname").val(u.name);
								if(u.gender == '男') {
									document.getElementById("gen1").checked = true;
								} else if(u.gender == '女') {
									document.getElementById("gen2").checked = true;
								}
								$("#upage").val(u.age);
								$("#btnShowC").click(function(){
									$.ajax({
										type : "post",
										url : "userServlet?method=showC",
										data : {num:u.number,per:u.permission,major:usermajor},
										dataType : "json",
										success : function(msg) {
											var str="";
												for(var i=0;i<msg.length;i++) {
													str += '<tr>';
													if(i == 0) {
														str += '<th  rowspan="'+msg.length+'">课程</th>';
													}
													str += '<td>';
													str += '<div class="checkbox"><label><input name="check" type="checkbox" value="'+msg[i].coursename+'"/>'+msg[i].coursename+'</label></div>';
													str += '</td>';
													str += '</tr>';
												}
												var shu = msg.length;
												$("#tup").html(str);
												$.ajax({
													type : "post",
													url : "userServlet?method=selectCByT",
													data : {num:u.number},
													dataType : "json",
													success : function(msg1) {
														for(var j = 0;j<msg1.length;j++) {
															
														for(var i=0;i<shu;i++) {
															if(document.getElementsByName("check")[i].value == msg1[j].coursename) {
																document.getElementsByName("check")[i].click();
															}
														}
															
														}
														
													}
												})
											} 
												
											
										})
								})
								$("#btnUpdate").click(function() {
									$.ajax({
										type : "post",
										url : "userServlet?method=saveUpdate",
										data : $("#updateform").serialize(),
										dataType : "json",
										success : function(msg) {
											if(msg == 1) {
												$("#span").html("修改成功！");
											}
											}
										})
								})
									
							}
						})
						
					})
				}
			});
	  	}
	  	
	  	
	  	
	  	function checkResultByS() {
	  		$("#msg").css("display","none")
	  		$("#uppwd").css("display","none")
	  		$("#tip").css("display","none")
	  		$("#tip1").css("display","none")
	  		$("#result").css("display","block")
	  		$("#add").css("display","none")
	  		$("#updateUser").css("display","none")
	  		condition = 's'
	  		 $.ajax({
				type : "post",
				url : "initServlet?method=sysuserInitByS",
				dataType : "json",
				success : function(msg) {
					var str = "";
					for(var i = 0; i < msg.length; i ++) {
						str += '<tr class="aUser" usernum="'+msg[i].number+'" userper="'+msg[i].permission+'">';
			    		str += '	<td>' + msg[i].permission + '</td>';
			    		str += '	<td>' + msg[i].username + '</td>';
			    		str += '	<td>' + msg[i].name + '</td>';
			    		str += '	<td>' + msg[i].major + '</td>';
			    		str += '	<td>' + msg[i].number + '</td>';
			    		str += '	<td>' + msg[i].gender + '</td>';
			    		str += '	<td>' + msg[i].age + '</td>';
			    		str += '</tr>';
					}
					$("#tbody").html(str);
					$(".aUser").click(function(event){
						var usernum = $(this).attr("usernum");
						var userper = $(this).attr("userper");
						var usermajor = null;
						$("#tup").html("");
						$("#span").html("");
						$("#msg").css("display","none")
				  		$("#uppwd").css("display","none")
				  		$("#tip").css("display","none")
				  		$("#tip1").css("display","none")
				  		$("#result").css("display","none")
				  		$("#add").css("display","none")
				  		$("#updateUser").css("display","block")
				  		$.ajax({
							type : "post",
							url : "userServlet?method=updateUser",
							data : {usernum:usernum},
							dataType : "json",
							success : function(msg) {
								var u = msg[0];
								$("#upusername").val(u.username);
								if(u.permission == '管理员') {
									document.getElementById("per1").checked = true;
								} else if(u.permission == '教师') {
									document.getElementById("per2").checked = true;
								} else if(u.permission == '学生') {
									document.getElementById("per3").checked = true;
								}
								$("#upnum").val(u.number);
								$("#major").val(u.major);
								
								var count=$("#upmajor option").length;
								for(var i=0;i<count;i++) {         
									if($("#upmajor").get(0).options[i].text == u.major)  {  
								         $("#upmajor ").get(0).options[i].selected = true;  
								          break;  
								    }  
								}
								$("#upmajor option[text='jQuery']").attr("selected", true);
								
								$("#upname").val(u.name);
								if(u.gender == '男') {
									document.getElementById("gen1").checked = true;
								} else if(u.gender == '女') {
									document.getElementById("gen2").checked = true;
								}
								$("#upage").val(u.age);
								$("#btnShowC").click(function(){
									$.ajax({
										type : "post",
										url : "userServlet?method=showC",
										data : {num:u.number,per:u.permission},
										dataType : "json",
										success : function(msg) {
											var str="";
												for(var i=0;i<msg.length;i++) {
													str += '<tr>';
													str += '<th>' + msg[i].coursename + '</th>';
													if(msg[i].result != null) {
														str += '<td>' + msg[i].result + '</td>';
													} else {
														str += '<td>未登记</td>';
													}
													str += '</tr>';
												}
												$("#tup").html(str);
											
												
											}
										})
								})
								$("#btnUpdate").click(function() {
									$.ajax({
										type : "post",
										url : "userServlet?method=saveUpdate",
										data : $("#updateform").serialize(),
										dataType : "json",
										success : function(msg) {
											if(msg == 1) {
												$("#span").html("修改成功！");
											}
											}
										})
								})
									
							}
						})
						
					})
				}
			});
	  	}
	  	
	  	
	  
	  	

  </script>
  <body>
  
  <div class="container-fluid">
	  <div class="row">
		  <div class="col-md-10 col-md-offset-1">
	  		<div class="jumbotron" style="background-color:#ffdc35;margin:0">
			  <h2 style="font-family:微软雅黑;color:#F0F8FF";>
			  	&emsp;&emsp;&emsp;教 务 管 理 信 息 系 统
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
			  <a href="javascript:void(0);" onclick="updatePwd()" class="list-group-item">✟&ensp;重置密码</a>
			  <a href="javascript:void(0);" class="list-group-item">✟&ensp;信息检索</a>
			  <a href="javascript:void(0);" onclick="checkResultByT()" class="list-group-item">&emsp;&emsp;○ 教师</a>
			  <a href="javascript:void(0);" onclick="checkResultByS()" class="list-group-item">&emsp;&emsp;○ 学生</a>
			  <a href="javascript:void(0);" onclick="addUser()" class="list-group-item">✟&ensp;添加用户</a>
			  <a href="javascript:void(0);" onclick="updataUser()" class="list-group-item">✟&ensp;修改用户</a>
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
				<%--	
   				 <form id="f" action="" method="post">
					<span>请输入旧密码：</span>
					<input type="password" id="pwd" name="pwd" />
					<span id="sp"></span><br/>
					<span>请输入新密码：</span>
					<input type="password" id="pwd1" name="pwd1" />
					<span id="sp1"></span><br/>
					<span>重复输入新密码：</span>
					<input type="password" id="pwd2" name="pwd2" />
					<span id="sp2"></span><br/>
					<input type="button" id="btn" value="保存" />
					<span id="sp3"></span><br/>
				</form>
   			--%>
   			</div>
   			
   			<div class="col-md-8" id="result" style="display:none">
   			&emsp;&emsp;
   				<div class="btn-group">
				  <button type="button" class="btn btn-default dropdown-toggle ddbtn1" data-toggle="dropdown">
				    专业 <span class="caret"></span>
				  </button>
				  <ul class="dropdown-menu ddm1" role="menu">
				  </ul>
				</div>
				&emsp;&emsp;
   				<div class="btn-group">
				  <button type="button" class="btn btn-default dropdown-toggle ddbtn2" data-toggle="dropdown">
				    课程 <span class="caret"></span>
				  </button>
				  <ul class="dropdown-menu ddm2" role="menu">
				  </ul>
				</div>
				&emsp;&emsp;
				<button type="button" class="btn btn-info" id="selectBtn">筛选</button>
				<br/><br/>
			    <table class="table table-bordered">
			    	<tr>
			    		<th>权限</th>
			    		<th>用户名</th>
			    		<th>姓名</th>
			    		<th>专业</th>
			    		<th>学号/职工号</th>
			    		<th>性别</th>
			    		<th>年龄</th>
			    	</tr>
			    	<tbody id="tbody">
			    		
			    	</tbody>
			    </table>
     		</div>
     		<div class="col-md-4 col-md-offset-1" id="add" style="display:none">
     			<form role="form" id="regForm" action="">
     			<div class="form-group">
				    <label for="exampleInputEmail1">id</label>
				    <input type="email" class="form-control" id="id" name="id" placeholder="">
				  </div>
				  <div class="form-group">
				    <label for="exampleInputEmail1">用户名</label>
				    <input type="email" class="form-control" id="username" name="username" placeholder="请输入用户名">
				  </div>
				  <div class="form-group">
				    <label for="exampleInputEmail1">初始密码</label>
				    <input type="email" class="form-control" value="0000" id="password" name="password">
				  </div>
				  <div class="form-group">
				    <label for="exampleInputEmail1">权限</label>
				    &ensp;
				     <label class="radio-inline">
					  <input type="radio" name="permission" value="管理员"> 管理员
					</label>
					<label class="radio-inline">
					  <input type="radio" name="permission" value="教师"> 教师
					</label>
					<label class="radio-inline">
					  <input type="radio" name="permission" value="学生"> 学生
					</label>
					<label class="radio-inline">
					  <input type="radio" name="permission" value="评教员"> 评教员
					</label>
				  </div>
				  <div class="form-group">
				    <label for="exampleInputEmail1">学号/职工号</label>
				    <input type="email" class="form-control" id="number" name="number" placeholder="管理员此项请填0">
				  </div>
				  <div class="form-group">
				    <label for="exampleInputEmail1">专业</label>
			   		 <select id="major" name="major" class="form-control">
					  <option value="无">管理员选此项</option>
					  <option value="计算机">计算机</option>
					  <option value="数学">数学</option>
					  <option value="化学">化学</option>
					  <option value="物理">物理</option>
					  <option value="医学">医学</option>
					</select>
				  </div>
				  <div class="form-group">
				    <label for="exampleInputEmail1">姓名</label>
				    <input type="email" class="form-control" id="name" name="name" placeholder="请输入用户真实姓名">
				  </div>
				  <div class="form-group">
				    <label for="exampleInputEmail1">性别</label>
				    &ensp;
				    <label class="radio-inline">
					  <input type="radio" name="gender" id="gender" value="男"> 男
					</label>
					<label class="radio-inline">
					  <input type="radio" name="gender" id="gender" value="女"> 女
					</label>
				  </div>
				  <div class="form-group">
				    <label for="exampleInputEmail1">年龄</label>
				    <input type="email" class="form-control" id="age" name="age" placeholder="请输入用户年龄">
				  </div>
				 
				  <button type="button" class="btn btn-default" id="btnReg">注册用户</button>
				</form>
     		</div>
     		<div class="col-md-4 col-md-offset-1" id="updateUser" style="display:none">
     		<form id="updateform" action="">
     			<table class="table table-striped">
     				<tr>
     					<th>用户名</th>
     					<td class='toupdate'>
     						<input type='text' name="username" id="upusername"  />
     					</td>
     				</tr>
     				<tr>
     					<th>密码</th>
     					<td class='toupdate'>
     						<input type='text' value='****' readonly />
     					</td>
     				</tr>
     				<tr>
	     				<th>权限</th>
	     				<td class='toupdate'>
						     <label class="radio-inline">
							  <input type="radio" id="per1" name="permission" value="管理员"> 管理员
							</label>
							<label class="radio-inline">
							  <input type="radio" id="per2" name="permission" value="教师"> 教师
							</label>
							<label class="radio-inline">
							  <input type="radio" id="per3" name="permission" value="学生"> 学生
							</label>
	     				</td>
	     			</tr>
     				<tr>
	     				<th>学号/职工号</th>
	     				<td class='toupdate'>
	     					<input type='text' name="number" id="upnum"  />
	     				</td>
     				</tr>
     				<tr>
	     				<th>专业</th>
	     				<td class='toupdate'>
					   		<select id="upmajor" name="major" class="form-control">
							  <option value="无">管理员选此项</option>
							  <option value="计算机">计算机</option>
							  <option value="数学">数学</option>
							  <option value="化学">化学</option>
							  <option value="物理">物理</option>
							  <option value="医学">医学</option>
							</select>
	     				</td>
     				</tr>
     				<tr>
	     				<th>姓名</th>
	     				<td class='toupdate'>
	     					<input type='text' name="name" id="upname" />
	     				</td>
     				</tr>
     				<tr>
	     				<th>性别</th>
	     				<td class='toupdate'>
						    <label class="radio-inline">
							  <input type="radio" name="gender" id="gen1" value="男"> 男
							</label>
							<label class="radio-inline">
							  <input type="radio" name="gender" id="gen2" value="女"> 女
							</label>
	     				</td>
     				</tr>
     				<tr>
	     				<th>年龄</th>
	     				<td class='toupdate'>
	     					<input type='text' name="age" id="upage" />
	     				</td>
     				</tr>
     				<tr><td><button type="button" class="btn btn-default" id="btnShowC">显示课程</button></td></tr>
     				<tbody id="tup"></tbody>
     			</table>
     			</form>
     			<button type="button" class="btn btn-default" id="btnUpdate">保存</button>
     			<span id="span" style="color:red;"></span>
     		</div>
     		<div class="col-md-3" id="tip" style="display:none">
   			<br/>
   			  <span id="sp" style="color:red"></span><br/><br/><br/><br/>
   			  <span id="sp1" style="color:red"></span><br/><br/><br/><br/>
   			  <span id="sp2" style="color:red;"></span><br/><br/><br/><br/>
   			   <span id="sp3" style="color:red;"></span><br/><br/><br/><br/>
   			</div>
     		<div class="col-md-3" id="tip1" style="display:none">
   			<br/>
   			   <span id="sp12" style="color:red;"></span><br/><br/><br/><br/>
   			  <span id="sp4" style="color:red;"></span><br/><br/><br/>
   			  <span id="sp5" style="color:red;"></span><br/><br/><br/>
   			  <span id="sp6" style="color:red;"></span><br/><br/><br/><br/>
   			  <span id="sp7" style="color:red;"></span><br/><br/><br/>
   			  <span id="sp8" style="color:red;"></span><br/><br/><br/>
   			  <span id="sp9" style="color:red;"></span><br/><br/><br/>
   			  <span id="sp10" style="color:red;"></span><br/><br/><br/>
   			  <span id="sp11" style="color:red;"></span><br/><br/><br/>
   			</div>
 	</div>
 </div>
  </body>
</html>