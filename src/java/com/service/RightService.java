package com.service;

import com.base.BaseService;

public interface RightService extends BaseService {
	public String getRights(int roleId,int rulerid) throws Exception;
	public String checkAction(String actionName, String methodName, int roleId) throws Exception;
}
