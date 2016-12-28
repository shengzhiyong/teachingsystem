package com.web.service;

import java.util.List;

import com.web.model.Result;

public interface IResultService {

	public void add(Result result);
	
	public void update(Result result);
	
	public List<Result> select(Result result);
	
}
