package com.service.impl;

import com.dao.RightDao;
import com.service.RightService;

public class RightServiceImpl implements RightService {

	@Override
	public String getRights(int roleId,int rulerid) throws Exception {
		return rightDao.getRights(roleId,rulerid);
	}
	RightDao rightDao ;
	public RightDao getRightDao() {
		return rightDao;
	}
	public void setRightDao(RightDao rightDao) {
		this.rightDao = rightDao;
	}
	@Override
	public String checkAction(String actionName, String methodName, int roleId)
			throws Exception {
		return rightDao.checkAction(actionName, methodName, roleId);
	}
	
	
}
