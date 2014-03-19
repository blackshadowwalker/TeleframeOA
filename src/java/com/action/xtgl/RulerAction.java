package com.action.xtgl;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import net.sf.json.JSONArray;

import com.base.BaseAction;
import com.bean.RulerInfo;
import com.service.RulerService;
import com.util.Util;

public class RulerAction extends BaseAction {
	private static final long serialVersionUID = 1L;

	RulerService rulerService;
	List<RulerInfo> list;
	RulerInfo rulerInfo;
	
	Integer pid;
	String pname;
	
	@Override
	public String handle() throws Exception {
		
		System.out.println(this+".handle()");
		if(method==null || method.equals("query")){
			System.out.println("ruler action query");
			return query();
		}
		return Util.NONE;
		
	}
	
	public String listTree(){
		list = rulerService.listTreeRuler();
		String jsonstr="";
		System.out.println("listTree PrintWriter ");
		if(list!=null)
		{
			JSONArray json = JSONArray.fromObject(list);
			jsonstr = json.toString();
		}
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8"); 
		response.setHeader("pragma", "no-cache");  
		response.setHeader("cache-control", "no-cache");
		try {
			PrintWriter out = response.getWriter();
			out.write(jsonstr);
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println("listTree return ");
		return Util.NONE;
	}

	public String add() throws Exception {
		pid = rulerInfo.getManager();
		if(pid==null || pid<1)
			rulerInfo.setLevel(1);//默认添加的是一级菜单
		else
			rulerInfo.setLevel(2);
		System.out.println("rulerparent="+rulerInfo.getRulerid());
		String result = rulerService.add(rulerInfo);
		this.setPid(rulerInfo.getManager());
		this.setPname(rulerInfo.getManagerName());
		if(result.equals(Util.SUCCESS)){
			msg = "添加成功";
			return  Util.ADD;
		}else {
			msg = "添加失败";
			return Util.ADD;
		}
	}

	public String delete() throws Exception {
		System.out.println(id);
		String result = rulerService.delete(id);
		rulerInfo=null;
		if(result.equals(Util.SUCCESS)){
			msg = "删除成功";
			return  query();
		}else {
			msg = "删除失败";
			return Util.LIST;
		}
	}
 
	public String query() throws Exception {
		list = rulerService.query(rulerInfo);
		return Util.LIST;
	}
	

	public String beforeUpdate() throws Exception  {
		if(id<1){
			msg = "请求参数错误";
			return Util.ERROR;
		}
		rulerInfo = rulerService.beforeUpdate(id);
		session.put("rulerInfo", rulerInfo);
		return Util.UPDATE;
	}
	public String update() throws Exception {
		
		RulerInfo rf = (RulerInfo) session.get("rulerInfo");
		if(rf==null){
			msg = "修改失败";
			return Util.UPDATE;
		}
		int id = rf.getRulerid();
		String result = rulerService.update(id, rulerInfo);
		rulerInfo=null;
		if(result.equals(Util.SUCCESS)){
			msg = Util.UpdateSuccess;
			return query();
		}
		else{
			msg = "修改失败";
			return Util.UPDATE;
		}
	}
	
	
	public RulerService getRulerService() {
		return rulerService;
	}

	public void setRulerService(RulerService rulerService) {
		this.rulerService = rulerService;
	}

	public List<RulerInfo> getList() {
		return list;
	}

	public void setList(List<RulerInfo> list) {
		this.list = list;
	}

	public RulerInfo getRulerInfo() {
		return rulerInfo;
	}

	public void setRulerInfo(RulerInfo rulerInfo) {
		this.rulerInfo = rulerInfo;
	}

	@Override
	public String beforeAdd() throws Exception {
		return Util.ADD;
	}

	@Override
	public String view() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}


	public String getPname() {
		return pname;
	}


	public void setPname(String pname) {
		this.pname = pname;
	}

	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	@Override
	public boolean validate(Object obj) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

}
