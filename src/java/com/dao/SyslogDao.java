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
		String hql = "From Syslog where 1=1 ";
		if(syslog!=null){
			if(syslog.getUserCode()!=null && !syslog.getUserCode().trim().isEmpty())
				hql += " and userCode like '%"+syslog.getUserCode().trim()+"%' ";
			if(syslog.getUserName()!=null && !syslog.getUserName().trim().isEmpty())
				hql += " and userName like '%"+syslog.getUserName().trim()+"%' ";
			if(syslog.getIp()!=null && !syslog.getIp().trim().isEmpty())
				hql += " and ip like '%"+syslog.getIp().trim()+"%' ";
			if(syslog.getContent()!=null && !syslog.getContent().trim().isEmpty())
				hql += " and content like '%"+syslog.getContent().trim()+"%' ";
		}
		hql += " order by id desc ";
		System.out.println(hql);
		return session.createQuery(hql).list();
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
