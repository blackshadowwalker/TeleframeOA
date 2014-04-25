package com.service.impl;

import java.util.List;

import com.bean.RoleInfo;
import com.dao.RoleDao;
import com.service.RoleService;

public class RoleServiceImpl implements RoleService {

	public RoleInfo get(Integer id)throws Exception {
		return roleDao.get(id);
	}
	
	@Override
	public List<RoleInfo> query(RoleInfo roleInfo) throws Exception {
		return roleDao.query(roleInfo);
	}
	@Override
	public String beforeUpdate(int id) throws Exception {
		return roleDao.beforeUpdate(id);
	}
	@Override
	public String update(RoleInfo roleInfo, String rightString) throws Exception {
		return roleDao.update(roleInfo, rightString);
	}
	@Override
	public String delete(int id) throws Exception {
		return roleDao.delete(id);
	}
	@Override
	public String beforeAdd() throws Exception {
		return roleDao.beforeAdd();
	}
	@Override
	public String add(RoleInfo roleInfo, String rightString) throws Exception {
		return roleDao.add(roleInfo, rightString);
	}
	
	RoleDao roleDao;

	public RoleDao getRoleDao() {
		return roleDao;
	}

	public void setRoleDao(RoleDao roleDao) {
		this.roleDao = roleDao;
	}

}
