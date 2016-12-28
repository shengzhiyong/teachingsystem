<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<script src="js/jquery-1.11.1.min.js"></script>
<head>


<meta charset="UTF-8">
<title>管理评教项目</title>

 <script type="text/javascript">
/* $(function(){
  
			if(!time.value){  
			  $("#sp").html("格式如20161228"); 
			} else {
				$("#sp").html(""); 
			}
		})*/
 
function  teacher() {
	  		$("#teacher").css("display","block")
	  		$("#teaorder").css("display","none")
	  		}
function  teaorder() {
	  		$("#teacher").css("display","none")
	  		$("#teaorder").css("display","block")	
	  		}

function checkForm()  
{  
	  var t1 = document.getElementsByTagName("input");  
       for(i=0;i<t1.length;i++)  
       {  
           if(t1[i].type == "checkbox")  
           {  
               if(!(t1[i].checked))  
               {  
                   t1[i].checked = true;  
                   t1[i].value = "0";  
               }  
           }  
       } 
       return true;  
}

function checkbox(obj)
{
  if(obj.checked){
    obj.value="1";
  }else{
    obj.value="0";  
}
}
</script>

</head>

<body>
<div class="container-fluid">
		  <div class="row">
			  <div class="col-md-10 col-md-offset-1">
		  		<div class="jumbotron" style="background-color:#003C9D;">
				  <h2 style="font-family:微软雅黑;color:#F0F8FF";>
				  	&emsp;&emsp;&emsp;教 务 管 理 信 息 系 统
				  </h2>
			  	</div>
		 	 </div>
	 	 </div>
	  </div>
	  

	<h4>若未开启任意一项，则评教不开启</h4>
	  <div class="container-fluid">
	  	<div class="row">
		  <div class="col-md-5 col-md-offset-4">
	
	<form action="pingjiao.jsp" method="post">
	<input type="checkbox" id="cb" name="pj" value="1" >开启备课得分评价
	<br>
	<input type="checkbox" id="cb" name="pj" value="1" >开启上课及时评价
	<br>
	<input type="checkbox" id="cb" name="pj" value="1" >开启讲课技巧评价
	<br>
	<input type="checkbox" id="cb" name="pj" value="1" >开启课后辅导评价
	<br>
	<input type="checkbox" id="cb" name="pj" value="1" >开启其他方面评价
	<br><br>
	  评教结束日期：<input  type="text"  id="time"   name="time">（规定格式如 20161123）<br>
	<input type="submit" value="完成修改" onclick="checkForm()">
	</form> 
	</div>
	</div>
	</div>
	<a href="javascript:void(0);" onclick="teacher()" class="list-group-item">✟&ensp;已评教信息</a>
	<a href="javascript:void(0);" onclick="teaorder()" class="list-group-item">✟&ensp;教师评分排名</a>
	<div class="col-md-4 col-md-offset-1" id="teacher" style="display:none">
	<%
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/web?characterEncoding=UTF-8","root","123456");
		Statement stat = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
		ResultSet rs0 = stat.executeQuery("select * from result ;");
		while(rs0.next())
		{
			out.println("教师名称："+rs0.getString(7)+"&nbsp&nbsp&nbsp");
			out.println("学生名称："+rs0.getString(5)+"&nbsp&nbsp&nbsp");
			out.println("科目名称："+rs0.getString(2)+"&nbsp&nbsp&nbsp");
			out.println("评教得分："+rs0.getString(1)+"&nbsp&nbsp&nbsp<br/>");	
		}
	%>
	</div>	
	<div class="col-md-4 col-md-offset-1" id="teaorder" style="display:none">
	<%
	
		ResultSet rs1 = stat.executeQuery("select teachername,avg(id)as fenshu from result group by teachername order by fenshu desc;");
		while(rs1.next())
		{
			out.println("教师名称："+rs1.getString(1)+"&nbsp&nbsp&nbsp");
			out.println("评教得分："+rs1.getString(2)+"&nbsp&nbsp&nbsp<br/>");	
		}
	%>
	</div>	
	<div class="col-md-3" id="tip" style="display:none">
   			<br/>
   			  <span id="sp" style="color:red"></span><br/><br/><br/><br/>
   			  <span id="sp1" style="color:red"></span><br/><br/><br/><br/>
   			  <span id="sp2" style="color:red;"></span><br/><br/><br/><br/>
   			  
   			</div>	  	  
</body>
</html>