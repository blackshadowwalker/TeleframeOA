package com.service;

import java.util.List;
import net.sf.json.JSONArray;

import com.base.BaseService;
import com.bean.DeptInfo;

public interface DeptService extends BaseService {
	//public abstract List<DeptInfo> queryDept();
	
	public abstract DeptInfo get(Integer id);
	public abstract List<DeptInfo> getList();
	public abstract JSONArray getDeptView(String deptName,String deptManager);
	public abstract String add(DeptInfo dept);
	public abstract DeptInfo deptBeforUpdate(int id);
	public abstract String deptUpdate(int id, DeptInfo dept);
	public abstract boolean delete(int id);
	
	public abstract String getPath(int id);
	public abstract List<DeptInfo> getPathList(int id);
}
