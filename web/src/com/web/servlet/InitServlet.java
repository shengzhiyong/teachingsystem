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
public class InitServlet extends HttpServlet {

	IResultService resultService = new ResultServiceImpl();
	IUserService userService = new UserServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		super.doGet(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String method = req.getParameter("method");
		Result result = new Result();
		String str = "";
		if("studentInit".equals(method)) {
			Integer number = Integer.parseInt(req.getParameter("id"));
			result.setStudent_id(number);
			List<Result> list = resultService.select(result);
			str = JSONArray.fromObject(list).toString();
		} else if("teacherInit".equals(method)) {
			Integer id = Integer.parseInt(req.getParameter("id"));
			result.setTeacher_id(id);
			List<Result> list = resultService.select(result);
			List<Result> resultList = new ArrayList<Result>();
			boolean flag = true;
			for(Result r : list) {
				for(Result l : resultList) {
					if(r.getCoursename().equals(l.getCoursename())) {
						flag = false;
						break;
					}
				}
				if(flag) {
					resultList.add(r);
				} else {
					flag = true;
				}
			}
			str = JSONArray.fromObject(resultList).toString();
		} else if("showResult".equals(method)) {
			String coursename = req.getParameter("coursename");
			Integer id = Integer.parseInt(req.getParameter("id"));
			result.setTeacher_id(id);
			result.setCoursename(coursename);
			List<Result> list = resultService.select(result);
			List<Result> rl = new ArrayList<Result>();
			boolean flag = true;
			for(Result r:list) {
				if(r.getStudent_id() == 99999999) {
					continue;
				}
				for(Result x:rl) {
					if(r.getStudent_id().equals(x.getStudent_id())) {
						flag = false;
						break;
					}
				}
				if(flag) {
					rl.add(r);
				}
				flag = true;
			}
			str = JSONArray.fromObject(rl).toString();
		} else if("sysuserInit".equals(method)) {
			List<User> list = userService.select(new User());
			str = JSONArray.fromObject(list).toString();
		} else if("sysuserInitByT".equals(method)) {
			User user = new User();
			user.setPermission("教师");
			List<User> list = userService.select(user);
			str = JSONArray.fromObject(list).toString();
		} else if("sysuserInitByS".equals(method)) {
			User user = new User();
			user.setPermission("学生");
			List<User> list = userService.select(user);
			str = JSONArray.fromObject(list).toString();
		} else if("sysuserInitByM".equals(method)) {
			List<Result> list = resultService.select(new Result());
			List<Result> rl = new ArrayList<Result>();
			boolean flag = true;
			for(Result r : list) {
				for(Result x : rl) {
					if(r.getMajor().equals(x.getMajor())) {
						flag = false;
						break;
					}
				}
				if(flag) {
					rl.add(r);
				}
				flag = true;
			}
			str = JSONArray.fromObject(rl).toString();
		} else if("sysuserInitSelectCByM".equals(method)) {
			String major = req.getParameter("major");
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
				}
				flag = true;
			}
			str = JSONArray.fromObject(rl).toString();
		} else if("sysuserInitByTSelectC".equals(method)) {
			String coursename = req.getParameter("coursename");
			String major = req.getParameter("major");
			String condition = req.getParameter("condition");
			Result r = new Result();
			r.setCoursename(coursename);
			r.setMajor(major);
			List<Result> list = resultService.select(r);
			List<Result> rl = new ArrayList<Result>();
			List<User> ul = new ArrayList<User>();
			boolean flag = true;
			User u = new User();
			if("t".equals(condition)) {
				for(Result re : list) {
					for(Result x : rl) {
						if(re.getTeacher_id().equals(x.getTeacher_id())) {
							flag = false;
							break;
						}
					}
					if(flag) {
						rl.add(re);
						u.setNumber(re.getTeacher_id());
						ul.add(userService.select(u).get(0));
					}
					flag = true;
				}
			} else if("s".equals(condition)) {
				for(Result l : list) {
					u.setNumber(l.getStudent_id());
					ul.add(userService.select(u).get(0));
				}
			}
			str = JSONArray.fromObject(ul).toString();
		}

		resp.setCharacterEncoding("UTF-8");
		PrintWriter out = resp.getWriter();
		out.print(str);
	}

	 

}
