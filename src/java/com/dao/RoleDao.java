package com.dao;

import java.sql.Timestamp;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.base.BaseDao;
import com.bean.RoleInfo;
import com.bean.RulerInfo;
import com.bean.RulerRole;
import com.util.Util;

public class RoleDao extends BaseDao {
	
	public RoleInfo get(Integer id) throws Exception{
		Session session=this.getSession();
		return (RoleInfo) session.get(RoleInfo.class, id);
	}
	@SuppressWarnings("unchecked")
	public List<RoleInfo> query(RoleInfo roleInfo) throws Exception{
		Session session=this.getSession();
		String hql="From RoleInfo Where status=1";
		if(roleInfo!=null && roleInfo.getRoleName()!=null && !roleInfo.getRoleName().trim().equals("")){
			hql+=" and roleName like '%"+roleInfo.getRoleName().trim()+"%'";
		}

		Query query = session.createQuery(hql);
		List<RoleInfo> list = (List<RoleInfo>)query.list();
		return list;
	}
	@SuppressWarnings("unchecked")
	public String beforeUpdate(int id) throws Exception{
		Session session=this.getSession();
		RoleInfo roleInfo = new RoleInfo();
		List<RulerInfo> list;
		List<RulerRole> list2;
		StringBuffer sb = new StringBuffer();
		roleInfo=(RoleInfo) session.get(roleInfo.getClass(), id);
		sb.append("{id:'").append(id).append("',");
		sb.append("name:'").append(roleInfo.getRoleName()).append("',");
		sb.append("array:[");
		list=session.createQuery("From RulerInfo r where r.status=1").list();
		list2=session.createQuery("From RulerRole rr Where rr.roleId="+id).list();
		for(int i=0;i<list.size();i++){
			if(list.get(i).getLevel()==1){
				sb.append("{id:").append(list.get(i).getRulerid()).append(",");
				sb.append("pId:").append(0).append(",");
				sb.append("name:'").append(list.get(i).getRulerName()).append("',");
				sb.append("rulerWord:'").append("uvid").append("',");
				sb.append("open:").append("true");
				for(int j=0;j<list2.size();j++){
					if(list.get(i).getRulerid()==list2.get(j).getRulerId()){
						sb.append(",").append("checked:true,");
						list2.remove(j);
						break;
					}
				}
				sb.append("}");
				for(int k=0;k<list.size();k++){
					if(list.get(k).getLevel()==2 &&  list.get(k).getManager() == list.get(i).getRulerid()){
						sb.append(",{id:").append(list.get(k).getRulerid()).append(",");
						sb.append("pId:").append(list.get(i).getRulerid()).append(",");
						sb.append("name:'").append(list.get(k).getRulerName()).append("'");
						for(int j=0;j<list2.size();j++){
							if(list.get(k).getRulerid()==list2.get(j).getRulerId()){
								sb.append(",").append("checked:true,");
								sb.append("rulerWord:'").append(list2.get(j).getRulerWord()).append("'");
								list2.remove(j);
								break;
							}
						}
						sb.append("}");
					}	
				}
				if(i<list.size()){
					sb.append(",");
				}
			}
		}
		sb.append("]}");
		return sb.toString();
	}
	public String update(RoleInfo roleInfo,String rightString) throws Exception{
		Session session = this.getSession();
		String [] array = rightString.split(";");
		RulerRole rulerRole;
		Timestamp lastUpdate = new Timestamp(System.currentTimeMillis());
		roleInfo.setLastUpdate(lastUpdate);
		roleInfo.setStatus(1);
		session.update(roleInfo);
		session.createQuery("delete RulerRole r where r.roleId='"+roleInfo.getRoleId()+"'").executeUpdate();
		for(int i=0;i<array.length;i++){
			rulerRole = new RulerRole();
			rulerRole.setRoleId(roleInfo.getRoleId());
			String rulerWord[] = array[i].split(",");
			if(rulerWord.length>0)
				rulerRole.setRulerId(Integer.parseInt(rulerWord[0]));
			if(rulerWord.length>1)
				rulerRole.setRulerWord(rulerWord[1]);
			rulerRole.setLastUpdate(lastUpdate);
			rulerRole.setStatus(1);
			session.save(rulerRole);
		}
		return Util.SUCCESS;
	}
	public String delete(int id) throws Exception{
		Session session = this.getSession();
		RoleInfo roleInfo = (RoleInfo) session.createQuery("from RoleInfo r where r.roleId="+id).uniqueResult();
		roleInfo.setLastUpdate(new Timestamp(System.currentTimeMillis()));
		roleInfo.setStatus(0);
		session.update(roleInfo);
		return Util.SUCCESS;
	}
	@SuppressWarnings("unchecked")
	public String beforeAdd() throws Exception{
		Session session=this.getSession();
		List<RulerInfo> list;
		StringBuffer sb = new StringBuffer();
		sb.append("{");
		sb.append("array:[");
		list=session.createQuery("From RulerInfo").list();
		for(int i=0;i<list.size();i++){
			if(list.get(i).getLevel()==1){
				sb.append("{id:").append(list.get(i).getRulerid()).append(",");
				sb.append("pId:").append(0).append(",");
				sb.append("name:'").append(list.get(i).getRulerName()).append("',");
				sb.append("rulerWord:'").append("uvid").append("',");
				sb.append("open:").append("true");

				sb.append("}");
				for(int k=0;k<list.size();k++){
					if(list.get(k).getLevel()==2 && list.get(k).getManager() == list.get(i).getRulerid()){
						sb.append(",{id:").append(list.get(k).getRulerid()).append(",");
						sb.append("pId:" ).append(list.get(k).getManager()).append(",");
						sb.append("name:'").append(list.get(k).getRulerName()).append("'");
						sb.append("}");
					}	
				}
				if(i<list.size()){
					sb.append(",");
				}
			}
		}
		sb.append("]}");
		return sb.toString();
	}
	public String add(RoleInfo roleInfo,String rightString) throws Exception{
		Session session = this.getSession();
		String [] array = rightString.split(";");
		RulerRole rulerRole;
		Timestamp lastUpdate = new Timestamp(System.currentTimeMillis());
		roleInfo.setLastUpdate(lastUpdate);
		roleInfo.setStatus(1);
		session.save(roleInfo);
		if(rightString!=null && rightString.length()>0)
		{
			roleInfo=(RoleInfo) session.createQuery("from RoleInfo r where r.lastUpdate='"+roleInfo.getLastUpdate()+"' and r.roleName='"+roleInfo.getRoleName()+"'").uniqueResult();
			for(int i=0;i<array.length;i++){
				rulerRole = new RulerRole();
				rulerRole.setRoleId(roleInfo.getRoleId());
				rulerRole.setRulerId(Integer.parseInt(array[i].split(",")[0]));
				if(array[i].split(",").length>=2)
					rulerRole.setRulerWord(array[i].split(",")[1]);
				rulerRole.setLastUpdate(lastUpdate);
				rulerRole.setStatus(1);
				session.save(rulerRole);
			}
		}
		return Util.SUCCESS;
	}
}
