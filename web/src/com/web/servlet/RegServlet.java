package com.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.model.Result;
import com.web.model.User;
import com.web.service.IResultService;
import com.web.service.IUserService;
import com.web.service.impl.ResultServiceImpl;
import com.web.service.impl.UserServiceImpl;

@SuppressWarnings("serial")
public class RegServlet extends HttpServlet {

	private IUserService userService = new UserServiceImpl();
	private IResultService resultService = new ResultServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		super.doGet(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		PrintWriter out = resp.getWriter();
		this.doRegister(req, resp, out);
		
	}
	
	
	private void doRegister(HttpServletRequest req, HttpServletResponse resp, PrintWriter out) {
		String username = req.getParameter("username");
		String password1 = req.getParameter("password");
		String permission = req.getParameter("permission");
		String number = req.getParameter("number");
		String major = req.getParameter("major");
		String name = req.getParameter("name");
		String gender = req.getParameter("gender");
		String age = req.getParameter("age");
		User user = new User();
		user.setUsername(username);
		user.setPassword(password1);
		user.setPermission(permission);
		if(number != null) {
			user.setNumber(Integer.parseInt(number));
		}
		user.setMajor(major);
		user.setName(name);
		user.setGender(gender);
		if(age != null) {
			user.setAge(Integer.parseInt(age));
		}
		userService.add(user);
		if("学生".equals(permission)) {
			Result result = new Result();
			result.setMajor(major);
			List<Result> list = resultService.select(result);
			List<Result> rl = new ArrayList<Result>();
			boolean flag = true;
			for(Result re : list) {
				for(Result x : rl) {
					if(re.getCoursename().equals(x.getCoursename())) {
						flag = false;
						break;
					}
				}
				if(flag) {
					rl.add(re);
					result.setCoursename(re.getCoursename());
					result.setStudent_id(Integer.parseInt(number));
					Result r1 = new Result();
					r1.setCoursename(re.getCoursename());
					List<Result> l = resultService.select(r1);
					double d = Math.random();
					int i = (int)(d*l.size());
					result.setTeacher_id(l.get(i).getTeacher_id());
					resultService.add(result);
				}
				flag = true;
			}
		}
		try {
			resp.getWriter().print("1");
		} catch (IOException e) {
			e.printStackTrace();
		}	
	
	}

}
