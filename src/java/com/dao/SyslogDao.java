/*
* @author : karl
* @creation : 2014-3-25 下午04:45:57
* @description : 
*
*/

package com.dao;

import java.sql.Timestamp;
import java.util.List;

import org.hibernate.Session;

import com.base.BaseDao;
import com.bean.Syslog;

public class SyslogDao extends BaseDao {

	public Syslog get(Integer id){
		this.session = this.getSession();
		if(id==null || id<1)
			return null;
		return (Syslog) this.session.get(Syslog.class, id);
	}
	public List<Syslog> list(Syslog syslog){
		this.session = this.getSession();
		return session.createQuery("From Syslog ").list();
	}
	
	public void  log(Syslog syslog){
		this.session = this.getSession();
		if(syslog!=null){
			syslog.setStatus(1);
			syslog.setCreatedOn(new Timestamp(System.currentTimeMillis()));
			session.save(syslog);
		}
	}
}
