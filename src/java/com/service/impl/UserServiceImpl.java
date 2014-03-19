package com.service.impl;

import java.util.List;

import com.bean.UserInfo;
import com.dao.UserDao;
import com.service.UserService;

public class UserServiceImpl implements UserService {

	@Override
	public List<UserInfo> query(UserInfo userInfo) throws Exception {
		return userDao.query(userInfo);
	}
	
	@Override
	public String beforeAdd() throws Exception {
		return userDao.beforeAdd();
	}

	@Override
	public String add(UserInfo userInfo) throws Exception {
		return userDao.add(userInfo);
	}
	
	@Override
	public UserInfo beforeUpdate(int id) throws Exception {
		return userDao.beforeUpdate(id);
	}
	

	@Override
	public String delete(Integer id) throws Exception {
		return userDao.delete(id);
	}

	@Override
	public String update(UserInfo userInfo) throws Exception {
		return userDao.update(userInfo);
	}

	UserDao userDao ;

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

}
