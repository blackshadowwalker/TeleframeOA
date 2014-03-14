package com.service;

public interface RightService {
	public String getRights(int roleId,int rulerid) throws Exception;
	public String checkAction(String actionName, String methodName, int roleId) throws Exception;
}
