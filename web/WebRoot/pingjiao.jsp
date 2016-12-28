<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改评教项目</title>
</head>
<body>

	<%
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		//try{
			String changes[]=request.getParameterValues("pj");
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/web?characterEncoding=UTF-8","root","123456");
			Statement stat = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
			String time = request.getParameter("time");
			String sql2="update time set shijian="+time+" where ID=1 ;";
			stat.executeUpdate(sql2);
			for(int i=0;i<5;i++)
			{
				int n=i+1;
				String sql="update pingjiao set yn="+changes[i]+" where ID="+n+" ;";
				stat.executeUpdate(sql);
				
			}
		
	
		conn.close();
		out.println("<h1 align=\"center\" style=\"color:red;\">评教项目修改成功！</h1>");
		
		//}catch(Exception e)
		//{
		//	out.println("<h1 align=\"center\" style=\"color:blue;\">评教项目修改失败！</h1>");
		//}
	%>
<a href="pingjiaozhe.jsp">返回</a>
</body>
</html>