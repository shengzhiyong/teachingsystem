package com.web.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.web.dao.IResultDao;
import com.web.model.Result;
import com.web.util.DBUtil;

public class ResultDaoImpl implements IResultDao {

	public void add(Result result) throws SQLException {
		String sql = "insert into result (coursename, major, teacher_id, student_id, result) values (?, ?, ?,?,?)";
		Connection conn = DBUtil.getConnection();
		PreparedStatement pst = conn.prepareStatement(sql);
		pst.setString(1, result.getCoursename());
		pst.setString(2, result.getMajor());
		pst.setInt(3, result.getTeacher_id());
		if(result.getStudent_id() != null) {
			pst.setInt(4, result.getStudent_id());
		} else {
			pst.setString(4, null);
		}
		if(result.getResult() != null) {
			pst.setString(5, result.getResult());
		} else {
			pst.setString(5, "");
		}
		pst.execute();
		pst.close();
	}

	public void delete(Result result) throws SQLException {
		String sql = "delete from result where id=?";
		Connection conn = DBUtil.getConnection();
		PreparedStatement pst = conn.prepareStatement(sql);
		pst.setLong(1, result.getId());
		pst.execute();
		pst.close();
	}

	public List<Result> select(Result result) throws SQLException {
		List<Result> resultList = new ArrayList<Result>();
		String sql = "select * from user u1, result, user u2 where teacher_id=u1.number and student_id=u2.number ";
		Connection conn = DBUtil.getConnection();
		List<Object> params = new ArrayList<Object>();
		if(result.getId() != null) {
			sql += " and result.id=? ";
			params.add(result.getId());
		}
		if(result.getCoursename() != null) {
			sql += " and coursename=? ";
			params.add(result.getCoursename());
		}
		if(result.getMajor() != null) {
			sql += " and u1.major=? ";
			params.add(result.getMajor());
		}
		if(result.getTeacher_id() != null) {
			sql += " and teacher_id=? ";
			params.add(result.getTeacher_id());
		}
		if(result.getStudent_id() != null) {
			sql += " and student_id=? ";
			params.add(result.getStudent_id());
		}
		if(result.getResult() != null) {
			sql += " and result=? ";
			params.add(result.getResult());
		}
		PreparedStatement pst = conn.prepareStatement(sql);
		if(params != null && params.size() > 0) {
			for(int i = 0; i < params.size(); i ++) {
				if(params.get(i) instanceof Long) {
					pst.setLong(i + 1, (Long)params.get(i));
				} else if(params.get(i) instanceof Double) {
					pst.setDouble(i + 1, (Double)params.get(i));
				} else {
					pst.setString(i + 1, params.get(i).toString());
				}
			}
		}
		ResultSet rs = pst.executeQuery();
		while(rs.next()) {
			Result r = new Result();
			r.setId(rs.getLong("result.id"));
			r.setCoursename(rs.getString("coursename"));
			r.setMajor(rs.getString("major"));
			r.setTeacher_id(rs.getInt("teacher_id"));
			r.setTeacherName(rs.getString("u1.name"));
			r.setStudent_id(rs.getInt("student_id"));
			r.setStudentName(rs.getString("u2.name"));
			r.setResult(rs.getString("result"));
			resultList.add(r);
		}
		pst.close();
		return resultList;
	}

	public void update(Result result) throws SQLException {
		String sql = "update result set ";
		Connection conn = DBUtil.getConnection();
		List<Object> params = new ArrayList<Object>();
		if(result.getCoursename() != null) {
			sql += " coursename=?,";
			params.add(result.getCoursename());
		}
		if(result.getMajor() != null) {
			sql += " major=?,";
			params.add(result.getMajor());
		}
		if(result.getTeacher_id() != null) {
			sql += " teacher_id=?,";
			params.add(result.getTeacher_id());
		}
		if(result.getStudent_id() != null) {
			sql += " student_id=?,";
			params.add(result.getStudent_id());
		}
		if(result.getResult() != null) {
			sql += " result=?,";
			params.add(result.getResult());
		}
		sql = sql.substring(0, sql.length() - 1);
		sql += " where id=?";
		params.add(result.getId());
		PreparedStatement pst = conn.prepareStatement(sql);
		if(params != null && params.size() > 0) {
			for(int i = 0; i < params.size(); i ++) {
				if(params.get(i) instanceof Long) {
					pst.setLong(i + 1, (Long)params.get(i));
				} else if(params.get(i) instanceof Double) {
					pst.setDouble(i + 1, (Double)params.get(i));
				} else {
					pst.setString(i + 1, params.get(i).toString());
				}
			}
		}
		pst.execute();
		pst.close();
	}

	public List<Result> selectByS(Result result) throws SQLException {
		List<Result> resultList = new ArrayList<Result>();
		String sql = "select * from user u1, result, user u2 where teacher_id=u1.number and student_id=u2.number ";
		Connection conn = DBUtil.getConnection();
		List<Object> params = new ArrayList<Object>();
		if(result.getId() != null) {
			sql += " and result.id=? ";
			params.add(result.getId());
		}
		if(result.getCoursename() != null) {
			sql += " and coursename=? ";
			params.add(result.getCoursename());
		}
		if(result.getMajor() != null) {
			sql += " and u1.major=? ";
			params.add(result.getMajor());
		}
		if(result.getTeacher_id() != null) {
			sql += " and teacher_id=? ";
			params.add(result.getTeacher_id());
		}
		if(result.getStudent_id() != null) {
			sql += " and student_id=? ";
			params.add(result.getStudent_id());
		}
		if(result.getResult() != null) {
			sql += " and result=? ";
			params.add(result.getResult());
		}
		PreparedStatement pst = conn.prepareStatement(sql);
		if(params != null && params.size() > 0) {
			for(int i = 0; i < params.size(); i ++) {
				if(params.get(i) instanceof Long) {
					pst.setLong(i + 1, (Long)params.get(i));
				} else if(params.get(i) instanceof Double) {
					pst.setDouble(i + 1, (Double)params.get(i));
				} else {
					pst.setString(i + 1, params.get(i).toString());
				}
			}
		}
		ResultSet rs = pst.executeQuery();
		while(rs.next()) {
			Result r = new Result();
			r.setId(rs.getLong("id"));
			r.setCoursename(rs.getString("coursename"));
			r.setMajor(rs.getString("major"));
			r.setTeacher_id(rs.getInt("teacher_id"));
			r.setTeacherName(rs.getString("u1.name"));
			r.setStudent_id(rs.getInt("student_id"));
			r.setStudentName(rs.getString("u2.name"));
			r.setResult(rs.getString("result"));
			resultList.add(r);
		}
		pst.close();
		return resultList;
	}

	public List<Result> selectByT(Result result) throws SQLException {
		List<Result> resultList = new ArrayList<Result>();
		String sql = "select * from user u1, result, user u2 where teacher_id=u1.number and student_id=u2.number ";
		Connection conn = DBUtil.getConnection();
		List<Object> params = new ArrayList<Object>();
		if(result.getId() != null) {
			sql += " and result.id=? ";
			params.add(result.getId());
		}
		if(result.getCoursename() != null) {
			sql += " and coursename=? ";
			params.add(result.getCoursename());
		}
		if(result.getMajor() != null) {
			sql += " and u1.major=? ";
			params.add(result.getMajor());
		}
		if(result.getTeacher_id() != null) {
			sql += " and teacher_id=? ";
			params.add(result.getTeacher_id());
		}
		if(result.getStudent_id() != null) {
			sql += " and student_id=? ";
			params.add(result.getStudent_id());
		}
		if(result.getResult() != null) {
			sql += " and result=? ";
			params.add(result.getResult());
		}
		PreparedStatement pst = conn.prepareStatement(sql);
		if(params != null && params.size() > 0) {
			for(int i = 0; i < params.size(); i ++) {
				if(params.get(i) instanceof Long) {
					pst.setLong(i + 1, (Long)params.get(i));
				} else if(params.get(i) instanceof Double) {
					pst.setDouble(i + 1, (Double)params.get(i));
				} else {
					pst.setString(i + 1, params.get(i).toString());
				}
			}
		}
		ResultSet rs = pst.executeQuery();
		while(rs.next()) {
			Result r = new Result();
			r.setId(rs.getLong("id"));
			r.setCoursename(rs.getString("coursename"));
			r.setMajor(rs.getString("major"));
			r.setTeacher_id(rs.getInt("teacher_id"));
			r.setTeacherName(rs.getString("u1.name"));
			r.setStudent_id(rs.getInt("student_id"));
			r.setStudentName(rs.getString("u2.name"));
			r.setResult(rs.getString("result"));
			resultList.add(r);
		}
		pst.close();
		return resultList;
	}

}
