package com.action;

import java.util.List;

import com.base.BaseAction;
import com.bean.TSNvr;
import com.service.TestService;

public class TestAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	
	TestService testService;
	List<TSNvr> list;
	TSNvr nvr;
	
	@Override
	public String handle() throws Exception {
		if(method.equals("query")){
			return query();
		}if(method.equals("getById")){
			return getById();
		}
		return null;
	}
	
	public String getById() {
		
		nvr=testService.getById(nvr.getId());
		return "getById";
	}

	public String query() {
		list=testService.queryNvr();
		return "List";
	}

	
	
	//spring 注入
	public TestService getTestService() {
		return testService;
	}

	
	public void setTestService(TestService testService) {
		this.testService = testService;
	}


	public List<TSNvr> getList() {
		return list;
	}


	public void setList(List<TSNvr> list) {
		this.list = list;
	}
	
	public TSNvr getNvr() {
		return nvr;
	}

	public void setNvr(TSNvr nvr) {
		this.nvr = nvr;
	}

	@Override
	public String add() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String beforeAdd() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String beforeUpdate() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String delete() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String update() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String view() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
