package com.action.system;

import java.lang.reflect.Method;
import java.util.List;

import com.base.BaseAction;
import com.bean.FileInfo;
import com.bean.UserInfo;
import com.service.FileService;
import com.service.UserService;
import com.util.Util;


public class FileAction extends BaseAction {

	FileService fileService;
	List<FileInfo> list;
	FileInfo fileInfo;
	
	@Override
	public String handle() throws Exception {
		if(method==null  ){
			if(id!=null && id>0){
				FileInfo f = fileService.query(id);
				//设置接收的编码格式    
				request.setCharacterEncoding("UTF-8");
				//设置发送的编码格式    
				response.setContentType("text/html");
				response.setCharacterEncoding("UTF-8");

				this.fileInfo = f;
				return Util.SHOWFILE;
			}else
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
	}
	
	public String delete() throws Exception {
		if(fileInfo!=null && fileInfo.getId()>0)
		{
			if(fileService.delete(fileInfo.getId())==Util.SUCCESS)
				request.setAttribute("msg", "删除成功");
			else
				request.setAttribute("msg", "删除失败");
		}else{
			request.setAttribute("msg", "操作错误");
		}
		return this.query();
	}

	public String update() throws Exception {
		String result = fileService.update(fileInfo);
		if(result.endsWith(Util.SUCCESS))
			request.setAttribute("msg", "操作成功");
		else
			request.setAttribute("msg", "删除失败");
		this.fileInfo = null;
		return query();
	}

	public String beforeUpdate() throws Exception {
		int id = 0;
		if(fileInfo!=null)
			id = fileInfo.getId();
		else{
			String s = request.getParameter("id");
			if(s!=null)
				id = Integer.parseInt(s);
		}
		if(id<1)
			return Util.FAILE;
		fileInfo=fileService.beforeUpdate(id);
		if(fileInfo==null)
			return Util.ERROR;
		else 
			return Util.UPDATE;
	}

	public String add() throws Exception {
		String result=fileService.add(fileInfo);
		if(result.endsWith(Util.SUCCESS))
			request.setAttribute("msg", "操作成功");
		else
			request.setAttribute("msg", "删除失败");
		return this.query();
	}

	public String beforeAdd() throws Exception {
		return Util.ADD;
	}

	public String query() throws Exception {
		list=fileService.query(fileInfo);
		return Util.LIST;
	}
	
	
	public FileService getfileService() {
		return fileService;
	}

	public void setfileService(FileService fileService) {
		this.fileService = fileService;
	}

	public List<FileInfo> getList() {
		return list;
	}

	public void setList(List<FileInfo> list) {
		this.list = list;
	}

	public FileInfo getFileInfo() {
		return fileInfo;
	}

	public void setFileInfo(FileInfo fileInfo) {
		this.fileInfo = fileInfo;
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
