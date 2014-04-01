/*
 * @author : karl
 * @creation : 2014-3-25 下午05:02:40
 * @description : 
 *
 */

package com.action;

import java.util.List;

import com.base.BaseAction;
import com.bean.Syslog;
import com.service.SyslogService;
import com.util.Util;

public class SyslogAction extends BaseAction {

	Syslog 	syslog;
	List<Syslog> list = null;

	@Override
	public String handle() throws Exception {
		return query();
	}

	@Override
	public String query() throws Exception {
		list =  syslogService.list(syslog);
		if(list==null || list.size()<1)
			this.setMsg("无数据");
		this.setLogmsg("查询日志,"+this.getMsg());
		return Util.SUCCESS;
	}

	
	@Override
	public String add() throws Exception {
		syslogService.log(syslog);
		return Util.SUCCESS;
	}

	@Override
	public String beforeAdd() throws Exception {
		return null;
	}

	@Override
	public String beforeUpdate() throws Exception {
		return null;
	}

	@Override
	public String delete() throws Exception {
		return null;
	}

	
	@Override
	public String update() throws Exception {
		return null;
	}

	@Override
	public boolean validate(Object obj) throws Exception {
		return false;
	}

	@Override
	public String view() throws Exception {
		if(id!=null && id>0)
			syslog = syslogService.get(id);
		return Util.VIEW;
	}

	/**
	 * @return the syslog
	 */
	public Syslog getSyslog() {
		return syslog;
	}

	/**
	 * @param syslog the syslog to set
	 */
	public void setSyslog(Syslog syslog) {
		this.syslog = syslog;
	}

	/**
	 * @return the list
	 */
	public List<Syslog> getList() {
		return list;
	}

	/**
	 * @param list the list to set
	 */
	public void setList(List<Syslog> list) {
		this.list = list;
	}

}
