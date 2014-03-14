package com.dao;

import org.hibernate.Query;
import org.hibernate.Session;

import com.base.BaseDao;
import com.bean.RulerInfo;
import com.bean.RulerRole;
import com.util.Util;

public class RightDao extends BaseDao {
	
	public String getRights(int roleId,int rulerid) throws Exception{
		Session session = super.getSession();
		Query query = session.createQuery("From RulerRole r where r.roleid=:roleId and r.rulerid=:rulerid");
		query.setInteger("roleId", roleId);
		query.setInteger("rulerid", rulerid);
		RulerRole rulerRole = (RulerRole) query.uniqueResult();
		if(rulerRole!=null){
			return rulerRole.getRulerWord();
		}
		return null;
	}
	
	//检查数据库中是否拥有该actionName
	public String checkAction(String actionName, String methodName, int roleId){
		Session session = super.getSession();
		String sql = "From RulerInfo where ruler_url like :action ";
		Query query = session.createQuery(sql);
		query.setString("action", "/"+actionName+"%");
		
		RulerInfo rulerInfo = (RulerInfo) query.uniqueResult();
		
		if(rulerInfo!=null){
			return Util.SUCCESS;
			/*
			int rulerid = rulerInfo.getRulerId();
			query = session.createQuery("From RulerRole r where r.roleId=:roleId and r.rulerid=:rulerid");
			query.setInteger("roleId", roleId);
			query.setInteger("rulerid", rulerid);
			RulerRole rulerRole = (RulerRole) query.uniqueResult();
			if(rulerRole==null)
				return Util.FAILE;
			// query  add  delete update
			if(methodName.endsWith("query") && rulerRole!=null)
				return Util.SUCCESS;
			char ch = 'v';
			if(methodName.endsWith("beforeAdd") || methodName.endsWith("add"))
				ch = 'i';
			else if(methodName.endsWith("beforeUpdate") || methodName.endsWith("update") )
				ch = 'u';
			else  if(methodName.endsWith("delete") )
				ch = 'd';
			else  if(methodName.endsWith("view") )
				ch = 'v';
			else
				return Util.NULL;
			int index = rulerRole.getRulerWord().indexOf(ch);
			if(index>=0)
				return Util.SUCCESS;
			else
				return Util.FAILE;
				*/
			
		}else
			return Util.NULL;
	}
}

