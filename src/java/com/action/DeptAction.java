package com.action;

import java.io.IOException;
import java.lang.reflect.Method;
import java.util.List;

import com.base.BaseAction;
import com.bean.DeptInfo;
import com.service.DeptService;
import com.util.Util;

import net.sf.json.JSONArray;


/**
 * @author karl
 * @date  2014-3-12下午05:37:32
 */
public class DeptAction extends BaseAction {

	private static final long serialVersionUID = 1L;

	DeptService deptService;
	DeptInfo deptInfo;
	List<DeptInfo> list;

	String name;
	Integer pid;
	String pname;

	@Override
	public String handle() throws Exception {
		StackTraceElement traceElement = ((new Exception()).getStackTrace())[1]; 
		System.out.println(this.getClass().getName()+"."+traceElement.getMethodName()+":"+traceElement.getLineNumber());
		if(method==null || method.equals("query")){
			return query();
		}else{
			//reflect
			Method function = this.getClass().getDeclaredMethod(method);
			if(function!=null){
				String ret = (String)function.invoke(this);
				return ret;
			}else{
				// user add for process
			}
		}
		return Util.NONE;

	}

	@Override
	public String query() throws Exception {
		return Util.LIST;
	}
	@Override
	public String add() throws Exception {
		String res=deptService.add(deptInfo);
		this.pid = deptInfo.getManager();
		this.pname = deptInfo.getManagerName();
		if(res.equals(Util.SUCCESS)){
			msg =  "添加成功" ;
		}else{
			msg =  "已经存在" ;
		}
		System.out.println(msg);
		return Util.ADD;
	}
	@Override
	public String beforeAdd() throws Exception {
		
		return Util.ADD;
	}
	@Override
	public String beforeUpdate() throws Exception {
		list = deptService.getList();
		request.setAttribute("list", list);

		deptInfo = deptService.deptBeforUpdate(id);
		if(deptInfo!=null){
			msg = "";
			if((deptInfo.getManager()!=null && deptInfo.getManager()>0))
			{
				DeptInfo pDept = deptService.get(deptInfo.getManager());
				if(pDept!=null )
					deptInfo.setManagerName(pDept.getDeptName());
			}
		}else{
			msg = "获取信息失败";
		}
		System.out.println("beforeUpdate : " + deptInfo.getDeptName());
		return Util.UPDATE;
	}
	@Override
	public String update() throws Exception {
		System.out.println("update @ id="+id);
		String str=deptService.deptUpdate(id, deptInfo);
		if(str.equals(Util.SUCCESS)){
			msg = "修改成功";
			return query();
		}else if(str.equals("managerError")){
			request.setAttribute("managerError", "managerError");
			return "updateManagerError";
		}
		if(str.equals("nameError")){
			request.setAttribute("nameError", "nameError");
			return "updateNameError";
		}
		return Util.ERROR;
	}

	@Override
	public String delete() throws Exception {
		boolean flag=deptService.delete(id);

		if(flag==true){
			msg = "删除成功";
			return query();
		}if(flag==false){
			request.setAttribute("HaveUsers","HaveUsers");
			return query();
		}
		else
			return Util.ERROR;
	}


	@Override
	public String view() throws Exception {
		name=deptInfo.getDeptName();
		pname=deptInfo.getManagerName();

		return Util.VIEW;
	}

	private void listTree(){

		list = deptService.getList();
		JSONArray json = JSONArray.fromObject(list);
		String jsonstr=json.toString();
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8"); 
		response.setHeader("pragma", "no-cache");  
		response.setHeader("cache-control", "no-cache");
		try {
			response.getWriter().write(jsonstr);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
/*
	private void listTreeView(){

		JSONArray json=deptService.getDeptView(name, pname);
		String jsonstr=json.toString();
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8"); 
		response.setHeader("pragma", "no-cache");  
		response.setHeader("cache-control", "no-cache");

		try {
			response.getWriter().write(jsonstr);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
*/

	//spring 注入
	public DeptService getDeptService() {
		return deptService;
	}

	public void setDeptService(DeptService deptService) {
		this.deptService = deptService;
	}

	public List<DeptInfo> getList() {
		return list;
	}

	public void setList(List<DeptInfo> list) {
		this.list = list;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public DeptInfo getDeptInfo() {
		return deptInfo;
	}

	public void setDeptInfo(DeptInfo deptInfo) {
		this.deptInfo = deptInfo;
	}


}
