package com.dao;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import net.sf.json.JSONArray;

import org.hibernate.Query;
import org.hibernate.Session;

import com.base.BaseDao;
import com.bean.RulerInfo;
import com.bean.RulerRole;
import com.util.Util;

@SuppressWarnings("unchecked")
public class RulerDao extends BaseDao {

	public List<RulerInfo> listTreeRuler() {

		Session session =this.getSession();
		Query query = session.createQuery(" from RulerInfo where status=1 ");
		List<RulerInfo> list = (List<RulerInfo>)query.list();
		//先按菜单级别排序
		Collections.sort(list, new Comparator<RulerInfo>() {
			@Override
			public int compare(RulerInfo r1, RulerInfo r2) {
				return r1.getLevel() - r2.getLevel();
			}
		});
		//再按order排序
		Collections.sort(list, new Comparator<RulerInfo>() {
			@Override
			public int compare(RulerInfo r1, RulerInfo r2) {
				return r1.getSortorder() - r2.getSortorder();
			}
		});
		return list;
	}
	/**
	 * 获取角色的菜单
	 * @param list2
	 * @return
	 */
	public List<RulerInfo> rulerList(List<Integer> list2){
		//System.out.println("list2="+list2);
		Session session =this.getSession();
		Query query = session.createQuery(" from RulerInfo p where p.rulerid in (:list2) and p.status=1 and p.echo=1 order by id ");
		query.setParameterList("list2", list2);
		List<RulerInfo> list = (List<RulerInfo>)query.list();
		
//		System.out.println("=========================排序前=========================");
//		for(int i=0; i<list.size(); i++)
//			System.out.println(list.get(i).getRulerid()+"-"+list.get(i).getRulerName()+"-"+
//					list.get(i).getLevel()+"-"+list.get(i).getSortorder());
		//先按菜单级别排序
		Collections.sort(list, new Comparator<RulerInfo>() {
			@Override
			public int compare(RulerInfo r1, RulerInfo r2) {
				return r1.getLevel() - r2.getLevel();
			}
		});
//		System.out.println("=========================先按菜单级别排序=========================");
//		for(int i=0; i<list.size(); i++)
//			System.out.println(list.get(i).getRulerid()+"-"+list.get(i).getRulerName()+"-"+
//					list.get(i).getLevel()+"-"+list.get(i).getSortorder());
		//再按order排序
		Collections.sort(list, new Comparator<RulerInfo>() {
			@Override
			public int compare(RulerInfo r1, RulerInfo r2) {
				return r1.getSortorder() - r2.getSortorder();
			}
		});
//		System.out.println("=========================再按order排序=========================");
//		for(int i=0; i<list.size(); i++)
//			System.out.println(list.get(i).getRulerid()+"-"+list.get(i).getRulerName()+"-"+
//					list.get(i).getLevel()+"-"+list.get(i).getSortorder());
		if(list!=null){

			return  list;
		}
		return null;
	}

	//根据角色ID获取所有权限/菜单
	public List<RulerRole> rulerRole(int roleid){
		List< RulerRole> list = null;
		Session session =this.getSession();
		Query query = session.createQuery(" from RulerRole r where r.roleId=:roleId  and r.status=1 order by id");
		query.setInteger("roleId", roleid);
		list=(List< RulerRole>)query.list();
		if(list!=null && list.size()>0){
			return list;
		}
		return null;
	}

	public List<RulerInfo> query(RulerInfo rulerInfo) {
		Session session = this.getSession();
		String hql="from RulerInfo where status=1 ";
		if(rulerInfo!=null ){
			if( rulerInfo.getRulerName()!=null && !rulerInfo.getRulerName().trim().isEmpty())
				hql += " and rulerName like '%"+rulerInfo.getRulerName().trim()+"%' ";
			if( rulerInfo.getUrl()!=null && !rulerInfo.getUrl().trim().isEmpty() )
				hql += " and url like '%"+rulerInfo.getUrl()+"%' "; 
		}
		Query query = session.createQuery(hql);
		List<RulerInfo> list = (List<RulerInfo>)query.list();

		return list;
	}

	DateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	public String delete(int id) {

		Session session = this.getSession();
		RulerInfo r = new RulerInfo();
		r.setRulerid(id);
		session.delete(r);
		return Util.SUCCESS;
		/*
		RulerInfo rulerInfo = (RulerInfo) session.createQuery("from RulerInfo r where r.rulerid="+id).uniqueResult();
		if(rulerInfo!=null){
			rulerInfo.setLastUpdate(df.format(new Timestamp(System.currentTimeMillis())));
			rulerInfo.setStatus(0);
			session.update(rulerInfo);
			return Util.SUCCESS;
		}else
			return Util.FAILE;
			*/
	}

	public String add(RulerInfo rulerInfo) {

		Session session =this.getSession();
		session.save(rulerInfo);

		return Util.SUCCESS;
	}

	public RulerInfo beforeUpdate(int id) {

		Session session = this.getSession();
		Query query = session.createQuery("from RulerInfo where rulerid=:rulerid");
		query.setParameter("rulerid", id);
		RulerInfo  rulerInfo = (RulerInfo) query.uniqueResult();
		return rulerInfo;
	}

	public String update(int id, RulerInfo rulerInfo) {
		Session session = this.getSession();
		rulerInfo.setRulerid(id);
		//rulerInfo.setLastupdate(df.format(new Timestamp(System.currentTimeMillis())));
		rulerInfo.setLastUpdate((new Timestamp(System.currentTimeMillis())));
		session.update(rulerInfo);
		return Util.SUCCESS;
	}
}
