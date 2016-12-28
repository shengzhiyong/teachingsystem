package com.web.service.impl;

import java.sql.SQLException;
import java.util.List;

import com.web.dao.IUserDao;
import com.web.dao.impl.UserDaoImpl;
import com.web.model.User;
import com.web.service.IUserService;

public class UserServiceImpl implements IUserService {

	private IUserDao userDao = new UserDaoImpl();
	
	public List<User> select(User user) {
		try {
			return userDao.select(user);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public void add(User user) {
		try {
			userDao.add(user);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	public void update(User user) {
		try {
			userDao.update(user);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
