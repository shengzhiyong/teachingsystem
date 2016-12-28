package com.web.service.impl;

import java.sql.SQLException;
import java.util.List;

import com.web.dao.IResultDao;
import com.web.dao.impl.ResultDaoImpl;
import com.web.model.Result;
import com.web.service.IResultService;

public class ResultServiceImpl implements IResultService {

	private IResultDao resultDao = new ResultDaoImpl();
	
	public List<Result> select(Result result) {
		try {
			return resultDao.select(result);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public void add(Result result) {
		try {
			resultDao.add(result);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void update(Result result) {
		try {
			resultDao.update(result);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
