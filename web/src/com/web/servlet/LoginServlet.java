package com.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web.model.User;
import com.web.service.IUserService;
import com.web.service.impl.UserServiceImpl;

@SuppressWarnings("serial")
public class LoginServlet extends HttpServlet {

	private IUserService userService = new UserServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		PrintWriter out = resp.getWriter();
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		List<User> list = userService.select(user);
		if(list != null && list.size() > 0) {
			//登录成功，将当前用户信息存入session，并跳转
			HttpSession session = req.getSession();
			session.setAttribute("username", username);
			session.setAttribute("id", list.get(0).getId());
			session.setAttribute("permission", list.get(0).getPermission());
			session.setAttribute("number", list.get(0).getNumber());
			session.setAttribute("major", list.get(0).getMajor());
			session.setAttribute("name", list.get(0).getName());
			session.setAttribute("gender", list.get(0).getGender());
			session.setAttribute("age", list.get(0).getAge());
			String permission = list.get(0).getPermission();
			if("管理员".equals(permission)) {
				out.print('1');
			} else if("教师".equals(permission)) {
				out.print('2');
			} else if ("学生".equals(permission)) {
				out.print('3');
			}else if ("评教员".equals(permission)) {
				out.print('4');
			}
		} else {
			//登录失败，返回登录页面重新登录
			out.print('0');
		}
		
		
	}
	
}
