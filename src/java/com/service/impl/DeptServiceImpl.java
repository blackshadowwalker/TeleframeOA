package com.service.impl;

import java.util.List;
import net.sf.json.JSONArray;


import com.bean.DeptInfo;
import com.dao.DeptDao;
import com.service.DeptService;
public class DeptServiceImpl implements DeptService{

	DeptDao deptDao;
	public DeptDao getDeptDao() {
		return deptDao;
	}
	public void setDeptDao(DeptDao deptDao) {
		this.deptDao = deptDao;
	}
	
	@Override
	public List<DeptInfo> getList(){
		return deptDao.getList();
		
	}
	
	@Override
	public JSONArray getDeptView(String deptName,String deptManager){
		
		return deptDao.getDeptView(deptName,deptManager);
	}
	
	@Override
	public String add(DeptInfo dept){
		return deptDao.add(dept);
	}
	
	@Override
	public DeptInfo deptBeforUpdate(int id){
		
		return deptDao.beforUpdate(id);
	}
	
	public String deptUpdate(int id, DeptInfo dept){
		return deptDao.update(id,dept);
	}
	
	@Override
	public boolean delete(int id){
		return deptDao.delete(id);
	}
	@Override
	public DeptInfo get(Integer id) {
		return deptDao.get(id);
	}
	@Override
	public String getPath(int id) {
		return deptDao.getPath(id);
	}
	@Override
	public List<DeptInfo> getPathList(int id) {
		return deptDao.getPathList(id);
	}
	
	
}
