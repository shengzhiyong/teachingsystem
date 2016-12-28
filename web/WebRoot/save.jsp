<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>提交评教结果</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
		
	//try{
		String studentid = request.getParameter("studentid");
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/web?characterEncoding=UTF-8","root","123456");
		Statement stat = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
		Statement stat2 = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
		ResultSet rs = stat.executeQuery("select * from result where student_id='"+studentid+"' ;");
		while(rs.next())
		{
			String teacher=rs.getString(4);
			String scorestr[]=request.getParameterValues(teacher);

			
			int score[]=new int[scorestr.length];
			for(int i=0;i<scorestr.length;i++)
			{
			   score[i]=Integer.parseInt(scorestr[i]);
			}
			int avescore=0;
			for(int i=0;i<score.length;i++)
			{
				avescore=avescore+score[i];
			}
			avescore=avescore/score.length;
			
			String sql="update result set ID="+avescore+" where student_id="+studentid+" AND teacher_id="+teacher+" ;";
			stat2.executeUpdate(sql);

			
		}
		rs.close();
		stat.close();
		stat2.close();
		conn.close();
		
		out.println("<h1 align=\"center\" style=\"color:blue;\">评教成绩提交完成！</h1>");
	//}catch(Exception e)
	//{
	//	out.println("<h1 align=\"center\" style=\"color:red;\">评教成绩提交失败！</h1>");
	//}
	%>
	<a href="student.jsp">返回</a>
</body>
</html>