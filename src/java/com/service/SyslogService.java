/*
* @author : karl
* @creation : 2014-3-25 下午04:41:15
* @description : 
*
*/

package com.service;


import java.util.List;

import com.base.BaseService;
import com.bean.Syslog;

public interface SyslogService extends BaseService  {
	
	public Syslog get(Integer id);
	public List<Syslog> list(Syslog syslog);
	
	public void log(Syslog syslog);

}
