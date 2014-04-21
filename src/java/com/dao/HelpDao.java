/*
* @author : karl
* @creation : 2014-04-03 18:41:16
* @ModuleName : 帮助 
* @description : 
* 	描述
*
*/

package com.dao;

import java.sql.Timestamp;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.base.BaseDao;
import com.base.PageBean;
import com.bean.Help;
import com.bean.ArticleInfo;
import com.bean.UserInfo;
import com.util.Util;

public class HelpDao extends BaseDao {

	public Help get(Integer id){
		this.session = this.getSession();
		if(id==null || id<1)
			return null;
		Help help = (Help) this.session.get(Help.class, id);
		if(help!=null){
			UserInfo user = (UserInfo) session.createQuery("From UserInfo where userCode=:userCode").setString("userCode", help.getUserCode()).uniqueResult();
			if(user!=null)
				help.setUserName(user.getUserName());
		}
		return help;
	}
	
	public List<Help> query(Help help, PageBean page){
		this.session = this.getSession();
		String hql = "From Help where 1=1 and status != 0";
		String where = "";
		if(help!=null){
	//		if(help.getUserCode()!=null && !help.getUserCode().trim().isEmpty())
	//		where += " and userCode like '%"+help.getUserCode().trim()+"%' ";
		}
		String order = " order by id desc ";
		String sql = hql+where+order;
		Long count = (Long) session.createQuery("select count(*) "+ sql).uniqueResult();
		if(page!=null && count!=null )
			page.setTotalRow(count.intValue());
		
		Query query = session.createQuery(sql);
		if(page!=null && page.getPageSize()>0 && page.getCurrentPage()>0){
			query.setFirstResult( (page.getCurrentPage()-1)*page.getPageSize());
			query.setMaxResults( page.getPageSize() );
		}
		List<Help> list = query.list();
		for(Help h : list){
			UserInfo user = (UserInfo)session.createQuery("From UserInfo where userCode=:userCode")
										.setString("userCode", h.getUserCode()).uniqueResult();
			if(user!=null)
				h.setUserName(user.getUserName());
		}
		
		return list;
	}
	
	public List<Help> list(Help help){
		this.session = this.getSession();
		String hql = "From Help where 1=1 and status!=0";
		if(help!=null){
		//	if(help.getUserCode()!=null && !help.getUserCode().trim().isEmpty())
		//		hql += " and userCode like '%"+help.getUserCode().trim()+"%' ";
		}
		hql += " order by id desc ";
		List list =session.createQuery(hql).list();
		return list;
	}
	
	public String  add(Help help){
		this.session = this.getSession();
		if(help!=null){
			if(help.getStatus()==null)
				help.setStatus(1);
			help.setCreateOn(new Timestamp(System.currentTimeMillis()));
			help.setLastUpdate(new Timestamp(System.currentTimeMillis()));
			session.save(help);
			return Util.SUCCESS;
		}else
			return Util.FAILE;
	}
	
	public String 	delete(Integer id){
		Session session = super.getSession();
		Help help = (Help) session.get(Help.class, id);
		if(help==null)
			return Util.FAILE;
		help.setStatus(0);
		help.setLastUpdate(new Timestamp(System.currentTimeMillis()));
	//	session.delete(help);  //or  session.update(help);
		session.update(help);
		return Util.SUCCESS;
	}
	
	public String update(Help help){
		Session session = super.getSession();
		help.setLastUpdate(new Timestamp(System.currentTimeMillis()));
		session.update(help);
		return Util.SUCCESS;
	}
	
}
