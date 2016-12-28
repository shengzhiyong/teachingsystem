<%@ page language="java" import="java.sql.*" import="java.util.Date"  import="java.text.*"
contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>评教系统</title>
<script src="js/jquery-1.11.1.min.js"></script>
</head>
<script type="text/javascript">

</script>
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
	  
	<%
	        Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/web?characterEncoding=UTF-8","root","123456");
			Statement stat = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
			ResultSet rs1 = stat.executeQuery("select shijian from time where id=1 ;");
		
		    Date date = new java.util.Date();
            long time = date.getTime();
            
  DateFormat format=new SimpleDateFormat("yyyyMMdd");
  String time1=format.format(date);

//mysq 时间戳只有10位 要做处理
            //String dateline = time + "";
            //dateline = dateline.substring(0, 8);
            rs1.next();
      int a=Integer.parseInt(rs1.getString("shijian"));
      int b=Integer.parseInt(time1);
   if((a-b)>0){
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String studentid = null;
		int num[];
		num = new int[5];
		int ifstart=0;
		try
		{
			
			studentid=request.getParameter("hide");
			
		
			ResultSet rs0 = stat.executeQuery("select * from pingjiao ;");
			for(int i=0;i<5;i++)
			{
				rs0.next();
				num[i]=rs0.getInt(2);
			}
			for(int i=0;i<5;i++)
			{
				if(num[i]==1)
					ifstart=1;
			}
			if(ifstart==0)
			{
				out.println("<h1 align=\"center\" style=\"color:blue;\">对不起!评教系统尚未开启！请联系管理老师。</h1>");
			}
			else
			{
				out.println("<h3>请注意：评分分数为1-100</h3><br/>");
				out.println("<form action=save.jsp method=post>");
				out.println("<input type=\"hidden\" name=\"studentid\" value=\""+studentid+"\" /> ");
				
				ResultSet rs = stat.executeQuery("select * from result where student_id='"+studentid+"' ;");
				rs.last();
				int rowCount = rs.getRow();
				rs.first();
				for(int i=0;i<rowCount;i++)
				{ 
					out.println("<br/><br/>科目:"+rs.getString(2)+"    教师姓名："+rs.getString(7)+"<br/><br/>");
					if(num[0]==1)
						out.println("备课得分：<input type=\"number\" name=\""+rs.getString(4)+"\" min=\"1\" max=\"100\"><br/>");
					if(num[1]==1)
						out.println("上课及时：<input type=\"number\" name=\""+rs.getString(4)+"\" min=\"1\" max=\"100\"><br/>");
					if(num[2]==1)
						out.println("讲课技巧：<input type=\"number\" name=\""+rs.getString(4)+"\" min=\"1\" max=\"100\"><br/>");
					if(num[3]==1)
						out.println("课后辅导：<input type=\"number\" name=\""+rs.getString(4)+"\" min=\"1\" max=\"100\"><br/>");
					if(num[4]==1)
						out.println("其他方面：<input type=\"number\" name=\""+rs.getString(4)+"\" min=\"1\" max=\"100\"><br/>");
					rs.next();
				}
				out.println("<br/><br/><input type=\"submit\" value=\"提交评教成绩\" />");
				rs.close();
				rs0.close();
				stat.close();
				conn.close();
				
				/*
				int rowCount = rs.getRow();
				if(rowCount==1)
				{
					
				}
				*/
				
			} 			
			
		}catch (Exception e)
		{
				out.println("<h3>什么情况？</h3>");
		} 
			
		}else{
			out.print("评教已结束");}
			
		
			
	%>
</body>
</html>