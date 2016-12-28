package com.web.dao;

import java.sql.SQLException;
import java.util.List;

import com.web.model.Result;

public interface IResultDao {

	public void add(Result result) throws SQLException;
	
	public void delete(Result result) throws SQLException;
	
	public void update(Result result) throws SQLException;
	
	public List<Result> select(Result result) throws SQLException;
	
	public List<Result> selectByT(Result result) throws SQLException;

	public List<Result> selectByS(Result result) throws SQLException;
	
}