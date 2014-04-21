package com.dao;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import net.sf.json.JSONArray;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.base.BaseDao;
import com.bean.DeptInfo;
import com.bean.UserInfo;
import com.util.Util;
public class DeptDao extends BaseDao {
	
	public DeptInfo get(Integer id){
		Session session = super.getSession();
		if(id==null || id<1)
			return null;
		return (DeptInfo)session.get(DeptInfo.class, id);
	}
	
	public String getPath(int id) {
		return null;
	}
	
	public List<DeptInfo> getPathList(int id) {
		return null;
	}
	
	public List<DeptInfo> getList(){
		Session session = super.getSession();

        String hql="select a.id,a.deptName,a.manager,(select b.deptName from DeptInfo b where a.manager=b.id), a.lastUpdate,a.status from DeptInfo a ";
        List<Object> list = session.createQuery(hql).list();
        
        DeptInfo dept;
        List<DeptInfo> listDept=new ArrayList<DeptInfo>();
        for(int i=0;i<list.size();i++){
        	dept=new DeptInfo();
        	Object[] object = (Object[])list.get(i);
        	dept.setDeptId((Integer)object[0]);
        	dept.setDeptName((String)object[1]);
        	dept.setManager((Integer)object[2]);
        	dept.setManagerName((String)object[3]);
        	dept.setLastUpdate((Timestamp)object[4]);
        	dept.setStatus((Integer)object[5]);
        	listDept.add(dept);
        }

        
        return listDept;
	}

	public JSONArray getDeptView(String deptName,String deptManager){
		Session session = super.getSession();
		String hql="";
	
		if(deptName!=null && !deptName.equals("")){
			hql="select a.deptId,a.deptName,a.deptManager as deptPid,(select b.deptName from DeptInfo as b where b.deptId=a.deptManager) as deptManager, a.lastUpdate ,a.status " +
					"from DeptInfo as a where a.deptName like '%" + deptName + "%'  ";
		}
		if(deptManager!=null && !deptManager.equals("")){
			hql="select a.deptId,a.deptName,a.deptManager as deptPid,(select c.deptName from DeptInfo as c where c.deptId=a.deptManager ) as deptManager, a.lastUpdate ,a.status " +
					"from DeptInfo as a where a.deptName like '%" + deptName + "%' and a.deptManager " +
							"in (select b.deptId from DeptInfo as b where b.deptName like '%"+ deptManager +"%' ) ";
		}
		/*if(deptName!=null && !deptName.equals("")){
			hql+="and deptName like '%"+deptName +"%' ";
		}
		if(deptManager!=null && !deptManager.equals("")){
			hql+="and deptName like '%"+deptName +"%' and deptManager like '%"+deptManager+"%' ";
		}*/
		List<Object> list =session.createQuery(hql).list(); 
		
		DeptInfo dept;
        List<DeptInfo> listDept=new ArrayList<DeptInfo>();
        for(int i=0;i<list.size();i++){
        	dept=new DeptInfo();
        	Object[] object = (Object[])list.get(i);
        	dept.setDeptId((Integer)object[0]);
        	dept.setDeptName((String)object[1]);
        	dept.setManager((Integer)object[2]);
        	dept.setManagerName((String)object[3]);
        	dept.setLastUpdate((Timestamp)object[4]);
        	listDept.add(dept);
        }
		
		JSONArray json = JSONArray.fromObject(listDept);
		return json;
	}
	
	DateFormat dateFormat = new SimpleDateFormat("yy-MM-dd HH:mm:ss");
	
	public String add(DeptInfo dept){
		Session session = super.getSession();
		int n=0;
		int i;
		
		Query query = session.createQuery(" From DeptInfo where deptName=:deptName and manager=:manager ");
		query.setString("deptName", dept.getDeptName());
		query.setLong("manager", dept.getManager());
		List<DeptInfo> list=query.list();
		
		if(list!=null && list.size()>0)
			return Util.EXIST;
		
		dept.setLastUpdate(new Timestamp(System.currentTimeMillis()));
	
		session.save(dept);	
		
		return Util.SUCCESS;
	}
	
	public DeptInfo beforUpdate(int id){
		
		Session session = super.getSession();
		/*
		String hql="select a.deptId,a.deptName,a.deptManager,(select b.deptName from DeptInfo b where a.deptManager=b.deptId),a.lastUpdate,a.status from DeptInfo a where a.deptId="+id;
		List<Object> listOne =session.createQuery(hql).list();
		Dept dept;
        List<Dept> listDept=new ArrayList<Dept>();
        for(int i=0;i<listOne.size();i++){
        	dept=new Dept();
        	Object[] object = (Object[])listOne.get(i);
        	dept.setDeptId((Integer)object[0]);
        	dept.setDeptName((String)object[1]);
        	dept.setPid((Integer)object[2]);
        	dept.setDeptManager((String)object[3]);
        	dept.setLastUpdate((String)object[4]);
        	dept.setStatus((Integer)object[5]);
        	listDept.add(dept);
        }	*/
		
		return (DeptInfo) session.get(DeptInfo.class, id);
	}

	public String update(int id, DeptInfo dept){
		
		System.out.println(" update dao "+dept);
		Session session = super.getSession();
		/*
		DeptInfo deptInfo=new DeptInfo();
		deptInfo.setId(dept.getId());
		deptInfo.setDeptName(dept.getDeptName());
		deptInfo.setStatus(dept.getStatus());
		int m=0;
		int i;
		List<DeptInfo> list=session.createQuery("From DeptInfo where status=1").list();
		for(i=0;i<list.size();i++){
			if(dept.getManager().equals(list.get(i).getDeptName())){
				deptInfo.setManager(list.get(i).getId());
			}else
				m++;
			if(dept.getManager().equals("") || dept.getManager()==null){
				deptInfo.setManager(null);
				m--;
			}
			if(deptInfo.getDeptName().equals(list.get(i).getDeptName()) && deptInfo.getManager()==list.get(i).getManager() )
				return "nameError";
		}
		if(m==i)
			return "managerError";
*/
		DateFormat dateFormat = new SimpleDateFormat("yy-MM-dd HH-mm-ss");
		dept.setLastUpdate(new Timestamp(System.currentTimeMillis()));
	
		session.clear();
		dept.setDeptId(id);
		session.update(dept);
		
		return Util.SUCCESS;
	}

	public boolean delete(int id){
		Session session = super.getSession();
		List<DeptInfo> list=session.createQuery("From DeptInfo where status=1").list();
		List<UserInfo> listUser=session.createQuery("From UserInfo where status=1").list();
		Query query = session.createQuery("from DeptInfo where id=:id ");
		query.setParameter("id", id);
		
		DeptInfo dept=(DeptInfo)query.uniqueResult();
		
		//当删除的部门有成员时提示  不允许删除
		for(int j=0;j<listUser.size();j++){
			if(dept.getDeptId()==listUser.get(j).getUserDepartment()){
				return false;
			}
		}
		
		//当删除的部门有子部门时修改子部门的上级部门
		for(int i=0;i<list.size();i++){
			if(dept.getDeptId()==list.get(i).getManager()){
				list.get(i).setManager(dept.getManager());
				session.update(list.get(i));
			}
		}
		dept.setStatus(0);
		session.delete(dept);
		
		return true;
	}
	
}
