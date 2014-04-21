/*
* @author : karl
* @creation : 2014-3-27 上午12:44:16
* @description : 
*
*/

package com.action.vlpr;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.base.BaseAction;
import com.base.SelectTree;
import com.bean.DeviceInfo;
import com.service.DeviceService;
import com.util.Util;

public class DeviceAction extends BaseAction {

	@Override
	public String add() throws Exception {
		return this.save();
	}

	@Override
	public String beforeAdd() throws Exception {
		request.setAttribute("gmapurl", sc.getInitParameter("gmapurl"));
		if(deviceInfo==null)
			deviceInfo = new DeviceInfo();
		deviceInfo.setPid(pid);
		deviceInfo.setPname(pname);
		return Util.EDIT;
	}
	
	Integer pid;
	String  pname;

	@Override
	public String beforeUpdate() throws Exception {
		request.setAttribute("gmapurl", sc.getInitParameter("gmapurl"));
		if(id!=null && id>0){
			deviceInfo = deviceService.get(id);
			if(deviceInfo!=null){
				DeviceInfo d = deviceService.get(deviceInfo.getPid());
				if(d!=null)
					deviceInfo.setPname(d.getName());
			}
			return Util.EDIT;
		}else
			return Util.ERROR; 
	}

	@Override
	public String delete() throws Exception {
		if(id!=null && id>0){
			deviceInfo = deviceService.get(id);
			if(deviceService.delete(id).equals(Util.SUCCESS))
				this.setMsg("删除成功");
			else
				this.setMsg("删除失败");
			this.setLogmsg("删除设备["+deviceInfo.getId()+"="+deviceInfo.getName()+"]");
			deviceInfo = null;
			return Util.LIST;
		}else
			return Util.ERROR; 
	}

	@Override
	public String handle() throws Exception {
		return this.query();
	}
	
	public String saveOrUpdate(){
		this.setLogmsg("修改或添加设备信息");
		if(deviceInfo==null)
			return Util.ERROR;
		this.setLogmsg("修改或添加设备信息");
		String result = deviceService.save(deviceInfo);
		if(result.equals(Util.SUCCESS)){
			this.setMsg("修改设备成功");
			this.addLogmsg("@id="+deviceInfo.getId()+"&name="+deviceInfo.getName());
			deviceInfo = null;
			return Util.LIST;
		}else{
			this.setMsg("修改设备失败");
			this.addLogmsg("@id="+deviceInfo.getId()+"&name="+deviceInfo.getName());
			return Util.EDIT;
		}
	}
	public String save(){
		if(deviceInfo==null)
			return Util.ERROR;
		this.setLogmsg("修改或添加设备信息");
		String result = deviceService.save(deviceInfo);
		if(result.equals(Util.SUCCESS)){
			this.setMsg("修改设备成功");
			this.addLogmsg("@id="+deviceInfo.getId()+"&name="+deviceInfo.getName());
			deviceInfo = null;
			return Util.LIST;
		}else{
			this.setMsg("修改设备失败");
			this.addLogmsg("@id="+deviceInfo.getId()+"&name="+deviceInfo.getName());
			return Util.EDIT;
		}
	}
	
	DeviceService deviceService;
	DeviceInfo deviceInfo;
	List<DeviceInfo> list;
	
	public String listTreeSelect(){
		this.setLogmsg("查询设备信息 listTreeSelect");
		list = deviceService.list(deviceInfo);
		List<SelectTree> listTreeSelect = new ArrayList<SelectTree>();
		for(int i=0; i<list.size(); i++){
			SelectTree e = new SelectTree();
			e.setId(list.get(i).getId());
			e.setText(list.get(i).getName());
			e.setPid(list.get(i).getPid());
			listTreeSelect.add(e);
		}
		JSONArray json = JSONArray.fromObject(listTreeSelect);
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
		return Util.NONE;
	}
	
	public String listTree(){
		this.setLogmsg("查询设备信息");
		list = deviceService.list(deviceInfo);
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
		return Util.NONE;
	}

	@Override
	public String query() throws Exception {
		request.setAttribute("gmapurl", sc.getInitParameter("gmapurl"));
		return Util.LIST;
	}

	@Override
	public String update() throws Exception {
		return this.save();
	}

	@Override
	public boolean validate(Object obj) throws Exception {
		return false;
	}

	@Override
	public String view() throws Exception {
		if(id!=null && id>0){
			deviceInfo = deviceService.get(id);
			return Util.VIEW;
		}else
			return Util.ERROR; 
	}

	/**
	 * @return the deviceService
	 */
	public DeviceService getDeviceService() {
		return deviceService;
	}

	/**
	 * @param deviceService the deviceService to set
	 */
	public void setDeviceService(DeviceService deviceService) {
		this.deviceService = deviceService;
	}

	/**
	 * @return the deviceInfo
	 */
	public DeviceInfo getDeviceInfo() {
		return deviceInfo;
	}

	/**
	 * @param deviceInfo the deviceInfo to set
	 */
	public void setDeviceInfo(DeviceInfo deviceInfo) {
		this.deviceInfo = deviceInfo;
	}

	/**
	 * @return the list
	 */
	public List<DeviceInfo> getList() {
		return list;
	}

	/**
	 * @param list the list to set
	 */
	public void setList(List<DeviceInfo> list) {
		this.list = list;
	}

	/**
	 * @return the pid
	 */
	public Integer getPid() {
		return pid;
	}

	/**
	 * @param pid the pid to set
	 */
	public void setPid(Integer pid) {
		this.pid = pid;
	}

	/**
	 * @return the pname
	 */
	public String getPname() {
		return pname;
	}

	/**
	 * @param pname the pname to set
	 */
	public void setPname(String pname) {
		this.pname = pname;
	}

	public static void main(String args[]){
		String str = "\u8bf7\u53d1\u9001\u90ae\u4ef6\u5230";
		System.out.println(str);
	}
	
}



