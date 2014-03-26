package com.service;

import java.util.List;

import com.base.BaseService;
import com.bean.RulerInfo;
import com.bean.RulerRole;

public interface RulerService extends BaseService {
	
	public String add(RulerInfo rulerInfo);//曾
	
	public String delete(int id);//删
	
	public RulerInfo beforeUpdate(int id);//
	public String update(int id, RulerInfo rulerInfo);//改

	public List<RulerInfo> query(RulerInfo rulerInfo);//查
	
	
	//其他方法
	public List<RulerInfo> listTreeRuler();
	
	public List<RulerInfo> queryRulerList(List<Integer> list);//根据ruler id 的list 获取菜单列表
		
	public List<RulerRole> rulerRole(int roleId);//获取角色id为roleId的权限列表
	
}
