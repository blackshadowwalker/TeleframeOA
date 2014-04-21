/*
* @author : karl
* @creation : 2014-04-03 18:41:16
* @ModuleName : 帮助 
* @description : 
* 	描述
*
*/

package com.action.system;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.base.BaseAction;
import com.bean.Help;
import com.service.HelpService;
import com.util.Util;

public class HelpAction extends BaseAction {

	HelpService helpService;// ObjectService
	Help help;// object
	List<Help> list;// Object list

	@Override
	public String handle() throws Exception {
		if(method==null){
			if(id==null)
				return query();
			else
				return view();
		}
		return null;
	}

	/**
	 *  save: add or update 
	 * @return ;
	 * @throws Exception
	 */
	public String save() throws Exception{
		if(help==null)
			return Util.ERROR;
		
		if( !this.validate(null) ){
			this.setMsg("帮助表单不正确");
			return Util.EDIT;
		}
		
		//set object.id from request.getParameter("id");
		String idstr = request.getParameter("id");
		if(idstr!=null && !idstr.trim().isEmpty())
			help.setId( Integer.parseInt(idstr) );
		
		help.setUserCode(user.getUserCode());
		
		//call saveOrUpdate
		String result = Util.NONE;
		if(help!=null && help.getId()!=null && help.getId()>0){
			this.setLogmsg("修改帮助信息");
			result = helpService.update(help);
		}else{
			this.setLogmsg("添加帮助信息");
			result = helpService.add(help);
		}
		//result 
		if(result.equals(Util.SUCCESS)){
			this.setMsg("操作成功");
			this.addLogmsg("@id=" + help.getId());
			help = null;
			return this.query();
		}else{
			this.setMsg("操作失败");
			this.addLogmsg("@id=" + help.getId());
			return Util.EDIT;
		}
	}
	
	public String saveJson() throws Exception{
		
		JSONObject json = new JSONObject();
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();	
		
		if(help==null){
			json.put("error", -1);
			json.put("msg", "空数据");
			out.println(json.toString());
			out.close();
			return Util.NONE;
		}
		
		if( !this.validate(null) ){
			json.put("error", -1);
			json.put("msg", "帮助表单不正确");
			out.println(json.toString());
			out.close();
			return Util.NONE;
		}

		//set object.id from request.getParameter("id");
		String idstr = request.getParameter("id");
		if(idstr!=null && !idstr.trim().isEmpty())
			help.setId( Integer.parseInt(idstr) );
		
		String result = Util.NONE;
		if(help!=null && help.getId()!=null && help.getId()>0){
			this.setLogmsg("修改帮助信息");
			result = helpService.update(help);
		}else{
			this.setLogmsg("添加帮助信息");
			result = helpService.add(help);
		}
		//result 
		if(result.equals(Util.SUCCESS)){
			this.setMsg("帮助.操作成功");
			this.addLogmsg("@id=" + help.getId());
			json.put("error", 0);
			json.put("msg", this.getMsg());
			json.put("id", help.getId());
			help = null;
		}else{
			this.setMsg("帮助.操作失败");
			this.addLogmsg("@id=" + help.getId());
			json.put("error", 0);
			json.put("msg", this.getMsg());
		}
		out.println(json.toString());
		out.close();
		return Util.NONE;
	}
	
	
	/**
	 * 
	 * @return json 
	 */
	public String listTree(){
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8"); 
		response.setHeader("pragma", "no-cache");  
		response.setHeader("cache-control", "no-cache");
		
		this.setLogmsg("查询帮助信息");
		list = helpService.list(help);
		JSONArray json = JSONArray.fromObject(list);
		try {
			PrintWriter out = response.getWriter();	
			if(json!=null)
				out.write(json.toString());
			else
				out.write("[{}]");
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return Util.NONE;
	}

	@Override
	public String add() throws Exception {
		return this.save();
	}

	@Override
	public String beforeAdd() throws Exception {
	//	List ObjectList = helpService.beforeAdd();
	//	request.setAttribute("ObjectList", ObjectList);
		return Util.EDIT;
	}

	@Override
	public String beforeUpdate() throws Exception {
		if(id==null || id <0)
			msg = "帮助.id错误";
		else
			help = helpService.get(id);
		return Util.EDIT;
	}

	@Override
	public String delete() throws Exception {
		if(id!=null && id>0){
			help = helpService.get(id);
			String result = helpService.delete(id);
			if(result!=null && result.endsWith(Util.SUCCESS))
				this.setMsg( "删除帮助成功" );
			else
				this.setMsg( "删除帮助失败" );
			return this.query();
		}else
			return Util.ERROR; 
	}


	@Override
	public String query() throws Exception {
		this.setLogmsg("帮助查询");
		list = helpService.query(help, page);
		return Util.LIST;
	}

	@Override
	public String update() throws Exception {
		return this.save();
	}

	@Override
	public boolean validate(Object obj) throws Exception {
		boolean ret = true;
		/*
		if(help.getTitle()==null || help.getTitle().isEmpty()){
			this.addFieldError("help.title", "xx不能空");
			ret = false;
		}
		*/
		return ret;
	}

	@Override
	public String view() throws Exception {
		if(id==null || id<1){
			msg = "ID错误";
		}
		help = helpService.get(id);
		if(help==null)
			msg = "不存在";
		return Util.VIEW;
	}

	public HelpService getHelpService() {
		return helpService;
	}

	public void setHelpService(HelpService objectService) {
		this.helpService = objectService;
	}

	public Help getHelp() {
		return help;
	}

	public List<Help> getList() {
		return list;
	}

	public void setHelp(Help help) {
		this.help = help;
	}

	public void setList(List<Help> list) {
		this.list = list;
	}

}
