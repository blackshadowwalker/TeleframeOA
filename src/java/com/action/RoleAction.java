package com.action;

import java.lang.reflect.Method;
import java.util.List;

import com.base.BaseAction;
import com.bean.RoleInfo;
import com.service.RoleService;
import com.util.Util;

public class RoleAction extends BaseAction {

	private static final long serialVersionUID = 1L;

	RoleService roleService;
	List<RoleInfo> list;
	RoleInfo roleInfo;
	String rightString;
	
	@Override
	public String handle() throws Exception {
		
		if(method==null  ){
			return query();
		}
		
		return Util.NONE;
	}

	public String add() throws Exception{
		System.out.println("rightString="+rightString);
		String result=roleService.add(roleInfo, rightString);
		roleInfo=null;
		if(result.equals(Util.SUCCESS)){
			msg = "操作成功";
			return query();
		}
		else {
			msg = "操作失败";
			return Util.ERROR;
		}
	}

	public String beforeAdd() throws Exception {
		rightString =roleService.beforeAdd();
		request.setAttribute("rightString", rightString);
		return Util.ADD;
	}

	public String delete() throws Exception {
		int id=roleInfo.getRoleId();
		String result=roleService.delete(id);
		roleInfo=null;
		if(result.equals(Util.SUCCESS)){
			msg = "操作成功";
			return query();
		}
		else {
			msg = "操作失败";
			return Util.ERROR;
		}
	}

	public String update() throws Exception {
		String result=roleService.update(roleInfo, rightString);
		roleInfo=null;
		if(result.equals(Util.SUCCESS)){
			msg = "操作成功";
			return query();
		}
		else {
			msg = "操作失败";
			return Util.ERROR;
		}
	}

	public String beforeUpdate() throws Exception {
		int id = roleInfo.getRoleId();
		rightString =roleService.beforeUpdate(id);
		request.setAttribute("rightString", rightString);
		return Util.UPDATE;
	}

	public String query() throws Exception {
		list=roleService.query(roleInfo);
		return Util.LIST;
	}


	public RoleService getRoleService() {
		return roleService;
	}

	public void setRoleService(RoleService roleService) {
		this.roleService = roleService;
	}

	public List<RoleInfo> getList() {
		return list;
	}

	public void setList(List<RoleInfo> list) {
		this.list = list;
	}

	public RoleInfo getRoleInfo() {
		return roleInfo;
	}

	public void setRoleInfo(RoleInfo roleInfo) {
		this.roleInfo = roleInfo;
	}

	public String getRightString() {
		return rightString;
	}

	public void setRightString(String rightString) {
		this.rightString = rightString;
	}

	@Override
	public String view() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean validate(Object obj) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	
	
}
