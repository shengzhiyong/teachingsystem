package com.web.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.web.dao.IUserDao;
import com.web.model.User;
import com.web.util.DBUtil;

public class UserDaoImpl implements IUserDao {

	public void add(User user) throws SQLException {
		String sql = "insert into user (username, password, permission, number, major, name, gender, age) values (?, ?, ?, ?, ?, ?, ?, ?)";
		Connection conn = DBUtil.getConnection();
		PreparedStatement pst = conn.prepareStatement(sql);
		pst.setString(1, user.getUsername());
		pst.setString(2, user.getPassword());
		pst.setString(3, user.getPermission());
		pst.setInt(4, user.getNumber());
		pst.setString(5, user.getMajor());
		pst.setString(6, user.getName());
		pst.setString(7, user.getGender());
		pst.setInt(8, user.getAge());
		pst.execute();
		pst.close();
	}

	public void delete(User user) throws SQLException {
		String sql = "delete from user where id=?";
		Connection conn = DBUtil.getConnection();
		PreparedStatement pst = conn.prepareStatement(sql);
		pst.setLong(1, user.getId());
		pst.execute();
		pst.close();
	}

	public List<User> select(User user) throws SQLException {
		List<User> result = new ArrayList<User>();
		String sql = "select * from user where 1=1 ";
		Connection conn = DBUtil.getConnection();
		List<Object> params = new ArrayList<Object>();
		if(user.getId() != null) {
			sql += " and id=? ";
			params.add(user.getId());
		}
		if(user.getUsername() != null) {
			sql += " and username=? ";
			params.add(user.getUsername());
		}
		if(user.getPassword() != null) {
			sql += " and password=? ";
			params.add(user.getPassword());
		}
		if(user.getPermission() != null) {
			sql += " and permission=? ";
			params.add(user.getPermission());
		}
		if(user.getNumber() != null) {
			sql += " and number=? ";
			params.add(user.getNumber());
		}
		if(user.getMajor() != null) {
			sql += " and major=? ";
			params.add(user.getMajor());
		}
		if(user.getName() != null) {
			sql += " and name=? ";
			params.add(user.getName());
		}
		if(user.getGender() != null) {
			sql += " and gender=? ";
			params.add(user.getGender());
		}
		if(user.getAge() != null) {
			sql += " and age=? ";
			params.add(user.getAge());
		}
		PreparedStatement pst = conn.prepareStatement(sql);
		if(params != null && params.size() > 0) {
			for(int i = 0; i < params.size(); i ++) {
				if(params.get(i) instanceof Long) {
					pst.setLong(i + 1, (Long)params.get(i));
				} else if(params.get(i) instanceof Integer) {
					pst.setInt(i + 1, (Integer)params.get(i));
				} else {
					pst.setString(i + 1, params.get(i).toString());
				}
			}
		}
		ResultSet rs = pst.executeQuery();
		while(rs.next()) {
			User u = new User();
			u.setId(rs.getLong("id"));
			u.setUsername(rs.getString("username"));
			u.setPassword(rs.getString("password"));
			u.setPermission(rs.getString("permission"));
			u.setNumber(rs.getInt("number"));
			u.setMajor(rs.getString("major"));
			u.setName(rs.getString("name"));
			u.setGender(rs.getString("gender"));
			u.setAge(rs.getInt("age"));
			result.add(u);
		}
		pst.close();
		return result;
	}

	public void update(User user) throws SQLException {
		String sql = "update user set ";
		Connection conn = DBUtil.getConnection();
		List<Object> params = new ArrayList<Object>();
		if(user.getUsername() != null) {
			sql += " username=?,";
			params.add(user.getUsername());
		}
		if(user.getPassword() != null) {
			sql += " password=?,";
			params.add(user.getPassword());
		}
		if(user.getPermission() != null) {
			sql += " permission=?,";
			params.add(user.getPermission());
		}
		if(user.getNumber() != null) {
			sql += " number=?,";
			params.add(user.getNumber());
		}
		if(user.getMajor() != null) {
			sql += " major=?,";
			params.add(user.getMajor());
		}
		if(user.getName() != null) {
			sql += " name=?,";
			params.add(user.getName());
		}
		if(user.getGender() != null) {
			sql += " gender=?,";
			params.add(user.getGender());
		}
		if(user.getAge() != null) {
			sql += " age=?,";
			params.add(user.getAge());
		}
		sql = sql.substring(0, sql.length() - 1);
		sql += " where id=?";
		params.add(user.getId());
		PreparedStatement pst = conn.prepareStatement(sql);
		if(params != null && params.size() > 0) {
			for(int i = 0; i < params.size(); i ++) {
				if(params.get(i) instanceof Long) {
					pst.setLong(i + 1, (Long)params.get(i));
				} else if(params.get(i) instanceof Integer) {
					pst.setInt(i + 1, (Integer)params.get(i));
				} else {
					pst.setString(i + 1, params.get(i).toString());
				}
			}
		}
		pst.execute();
		pst.close();
	}

}
