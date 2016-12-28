package com.web.dao;

import java.sql.SQLException;
import java.util.List;

import com.web.model.User;

public interface IUserDao {

	public void add(User user) throws SQLException;
	
	public void delete(User user) throws SQLException;
	
	public void update(User user) throws SQLException;
	
	public List<User> select(User user) throws SQLException;
	
}
