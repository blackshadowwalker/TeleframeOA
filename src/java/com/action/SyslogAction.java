/*
* @author : karl
* @creation : 2014-3-25 下午05:02:40
* @description : 
*
*/

package com.action;

import com.base.BaseAction;
import com.service.SyslogService;

public class SyslogAction extends BaseAction {
	
	SyslogService syslogService;

	@Override
	public String add() throws Exception {
		return null;
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
	public String handle() throws Exception {
		return null;
	}

	@Override
	public String query() throws Exception {
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
		return null;
	}

	public SyslogService getSyslogService() {
		return syslogService;
	}

	public void setSyslogService(SyslogService syslogService) {
		this.syslogService = syslogService;
	}

}
