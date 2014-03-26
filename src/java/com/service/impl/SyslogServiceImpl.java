/*
* @author : karl
* @creation : 2014-3-25 下午04:45:01
* @description : 
*
*/

package com.service.impl;

import java.util.List;

import com.bean.Syslog;
import com.dao.SyslogDao;
import com.service.SyslogService;

public class SyslogServiceImpl implements SyslogService {

	SyslogDao syslogDao;
	@Override
	public Syslog get(Integer id) {
		return syslogDao.get(id);
	}

	@Override
	public List<Syslog> list(Syslog syslog) {
		return syslogDao.list(syslog);
	}

	@Override
	public void log(Syslog syslog) {
		syslogDao.log(syslog);
	}
	
	

	public SyslogDao getSyslogDao() {
		return syslogDao;
	}

	public void setSyslogDao(SyslogDao syslogDao) {
		this.syslogDao = syslogDao;
	}

}
