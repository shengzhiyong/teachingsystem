package com.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import com.web.model.Result;
import com.web.model.User;
import com.web.service.IResultService;
import com.web.service.IUserService;
import com.web.service.impl.ResultServiceImpl;
import com.web.service.impl.UserServiceImpl;

@SuppressWarnings("serial")
public class UserServlet extends HttpServlet {

	IUserService userService = new UserServiceImpl();
	IResultService resultService = new ResultServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String method = req.getParameter("method");
		if("updatePwd".equals(method)) {
			Long id = (Long)req.getSession().getAttribute("id");
			String pwd = req.getParameter("pwd");
			User user = new User();
			user.setId(id);
			user.setPassword(pwd);
			List<User> list = userService.select(user);
			PrintWriter out = resp.getWriter();
			if(list != null && list.size() > 0) {
				String pwd1 = req.getParameter("pwd1");
				user.setPassword(pwd1);
				userService.update(user);
				out.print("1");
			} else {
				out.print("0");
			}
		} else if("showC".equals(method)) {
			String num = req.getParameter("num");
			String per = req.getParameter("per");
			String major = req.getParameter("major");
			Result r = new Result();
			List<Result> list = null;
			if("教师".equals(per)) {
				
			} else if("学生".equals(per)) {
				r.setStudent_id((Integer.parseInt(num)));
				list = resultService.select(r);
			}
			String str = "";
			List<Result> rl = new ArrayList<Result>();
			if("教师".equals(per)) {
				r.setMajor(major);
				list = resultService.select(r);
			}
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
					}
					flag = true;
				}
				str = JSONArray.fromObject(rl).toString();
			resp.setCharacterEncoding("UTF-8");
			PrintWriter out = resp.getWriter();
			out.print(str);
		} else if("updateUser".equals(method)) {
			String num = req.getParameter("usernum");
			User r = new User();
			r.setNumber((Integer.parseInt(num)));
			List<User> list = userService.select(r);
			String str = "";
			str = JSONArray.fromObject(list).toString();
			resp.setCharacterEncoding("UTF-8");
			PrintWriter out = resp.getWriter();
			out.print(str);
		} else if ("saveUpdate".equals(method)) {
			String username = req.getParameter("username");
			String permission = req.getParameter("permission");
			String number = req.getParameter("number");
			
			String major = req.getParameter("major");
			String name = req.getParameter("name");
			String gender = req.getParameter("gender");
			String age = req.getParameter("age");
			String[] check = req.getParameterValues("check");
			User user = new User();
			user.setUsername(username);
			user.setPermission(permission);
			if(number != null) {
				user.setNumber(Integer.parseInt(number));
			}
			List<User> list = userService.select(user);
			user.setId(list.get(0).getId());
			user.setMajor(major);
			user.setName(name);
			user.setGender(gender);
			if(age != null) {
				user.setAge(Integer.parseInt(age));
			}
			/*if("教师".equals(permission)) {
				Result r = new Result();
				r.setTeacher_id(Integer.parseInt(number));
				List<Result> l = resultService.select(r);
				boolean flag = true;
				for(int i = 0; i < check.length; i ++) {
					for(Result e : l) {
						if(e.getCoursename().equals(check[i])) {
							flag = false;
							break;
						}
					}
					if(flag) {
						r.setCoursename(check[i]);
						r.setMajor(major);
						r.setStudent_id(99999999);
						resultService.add(r);
					}
					flag = true;
				}
			}*/
			userService.update(user);
			PrintWriter out = resp.getWriter();
			out.print("1");
		} else if("selectCByT".equals(method)) {
			String num = req.getParameter("num");
			Result r = new Result();
			r.setTeacher_id((Integer.parseInt(num)));
			List<Result> list = resultService.select(r);
			String str = "";
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
				}
				flag = true;
			}
			str = JSONArray.fromObject(rl).toString();
			resp.setCharacterEncoding("UTF-8");
			PrintWriter out = resp.getWriter();
			out.print(str);
		} else if("updateResult".equals(method)) {
			String number = req.getParameter("num");
			String val = req.getParameter("val");
			String coursename  =req.getParameter("coursename");
			Result result = new Result();
			result.setCoursename(coursename);
			result.setStudent_id(Integer.parseInt(number));
			List<Result> rl = resultService.select(result);
			Result r = new Result();
			r.setId(rl.get(0).getId());
			r.setResult(val);
			resultService.update(r);
			PrintWriter out = resp.getWriter();
			out.print("1");
		}
	}

	
	
}
