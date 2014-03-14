package com.action;

import java.lang.reflect.Method;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.base.BaseAction;
import com.bean.UserInfo;
import com.service.UserService;
import com.util.Util;

public class UserAction extends BaseAction {

	private static final long serialVersionUID = 1L;

	@Override
	public String handle() throws Exception {
		
		if(method==null || method.equals("query")){
			return query();
		}else{
			//reflect
			Method function = this.getClass().getDeclaredMethod(method);
			if(function!=null)
				function.invoke(this);
			else{
				// user add for process
			}
		}
		return Util.NONE;
		/*
		if(super.method.equals("query")){
			return query();
		}else if(super.method.equals("beforeAdd")){
			return beforeAdd();
		}else if(method.equals("add")){
			return add();
		}else if(method.equals("beforeUpdate")){
			return beforeUpdate();
		}else if(method.equals("update")){
			return update();
		}else if(method.equals("delete")){
			return delete();
		}
		return null;
		*/
	}

	public String delete() throws Exception {
		userService.delete(userInfo);
		userInfo=null;
		return query();
	}

	public String update() throws Exception {
		userService.update(userInfo);
		userInfo=null;
		return query();
	}

	public String beforeUpdate() throws Exception {
		request.setAttribute("str", userService.beforeAdd());
		int id=Integer.parseInt(request.getParameter("userId"));
		userInfo=userService.beforeUpdate(id);
		if(userInfo==null)
			return Util.ERROR;
		else 
			return Util.UPDATE;
	}

	public String add() throws Exception {
		String result=userService.add(userInfo);
		userInfo=null;
		if(result.equals("ok"))
			return query();
		else 
			return Util.ERROR;
	}

	public String beforeAdd() throws Exception {
		//获取部门列表和角色列表
		request.setAttribute("str", userService.beforeAdd());
		return Util.ADD;
	}

	public String query() throws Exception {
		list=userService.query(userInfo);
		return Util.LIST;
	}
	
	UserService userService;
	List<UserInfo> list;
	UserInfo userInfo;

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public List<UserInfo> getList() {
		return list;
	}

	public void setList(List<UserInfo> list) {
		this.list = list;
	}

	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

	@Override
	public String view() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
}	
