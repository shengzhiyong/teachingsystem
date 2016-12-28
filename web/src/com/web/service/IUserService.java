package com.web.service;

import java.util.List;

import com.web.model.User;

public interface IUserService {

	public void add(User user);
	
	public List<User> select(User user); 
	
	public void update(User user);
	
}
