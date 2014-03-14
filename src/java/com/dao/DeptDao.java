package com.dao;

import java.text.DateFormat;
import java.text.SimpleDateFormat;

import net.sf.json.JSONArray;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.base.BaseDao;
import com.bean.Dept;
import com.bean.DeptInfo;
import com.bean.UserInfo;
import com.util.Util;
public class DeptDao extends BaseDao {
	
	public JSONArray queryAllDept(){
		Session session = super.getSession();

        String hql="select a.deptId,a.deptName,a.deptManager,(select b.deptName from DeptInfo b where a.deptManager=b.deptId),a.lastUpdate,a.status from DeptInfo a ";
        List<Object> list = session.createQuery(hql).list();
        
        Dept dept;
        List<Dept> listDept=new ArrayList<Dept>();
        for(int i=0;i<list.size();i++){
        	dept=new Dept();
        	Object[] object = (Object[])list.get(i);
        	dept.setDeptId((Integer)object[0]);
        	dept.setDeptName((String)object[1]);
        	dept.setPid((Integer)object[2]);
        	dept.setDeptManager((String)object[3]);
        	dept.setLastUpdate((String)object[4]);
        	dept.setStatus((Integer)object[5]);
        	listDept.add(dept);
        }

        JSONArray json = JSONArray.fromObject(listDept);
        return json;
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
		
		Dept dept;
        List<Dept> listDept=new ArrayList<Dept>();
        for(int i=0;i<list.size();i++){
        	dept=new Dept();
        	Object[] object = (Object[])list.get(i);
        	dept.setDeptId((Integer)object[0]);
        	dept.setDeptName((String)object[1]);
        	dept.setPid((Integer)object[2]);
        	dept.setDeptManager((String)object[3]);
        	dept.setLastUpdate((String)object[4]);
        	listDept.add(dept);
        }
		
		JSONArray json = JSONArray.fromObject(listDept);
		return json;
	}
	
	DateFormat dateFormat = new SimpleDateFormat("yy-MM-dd HH:mm:ss");
	
	public String add(Dept dept1){
		Session session = super.getSession();
		int n=0;
		int i;
		
		Query query = session.createQuery(" From DeptInfo where deptName=:deptName and deptManager=:deptmanager ");
		query.setString("deptName", dept1.getDeptName());
		query.setLong("deptmanager", dept1.getPid());
		List<DeptInfo> list=query.list();
		
		if(list!=null && list.size()>0)
			return Util.EXIST;
		
		DeptInfo dept=new DeptInfo();
		dept.setDeptName(dept1.getDeptName());
		dept.setDeptManager(dept1.getPid());
		dept.setLastUpdate(dateFormat.format(new Date()));
		dept.setStatus(dept1.getStatus());
	
		session.save(dept);	
		
		return Util.SUCCESS;
	}
	
	public List<Dept> deptBeforUpdate(int id){
		
		Session session = super.getSession();
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
        }	
		return listDept;
	}

	public String deptUpdate(int id,Dept dept){
		Session session = super.getSession();
		DeptInfo deptInfo=new DeptInfo();
		deptInfo.setDeptId(dept.getDeptId());
		deptInfo.setDeptName(dept.getDeptName());
		deptInfo.setStatus(dept.getStatus());
		int m=0;
		int i;
		List<DeptInfo> list=session.createQuery("From DeptInfo where status=1").list();
		for(i=0;i<list.size();i++){
			if(dept.getDeptManager().equals(list.get(i).getDeptName())){
				deptInfo.setDeptManager(list.get(i).getDeptId());
			}else
				m++;
			if(dept.getDeptManager().equals("") || dept.getDeptManager()==null){
				deptInfo.setDeptManager(null);
				m--;
			}
			if(deptInfo.getDeptName().equals(list.get(i).getDeptName()) && deptInfo.getDeptManager()==list.get(i).getDeptManager() )
				return "nameError";
		}
		if(m==i)
			return "managerError";

		DateFormat dateFormat = new SimpleDateFormat("yy-MM-dd HH-mm-ss");
		deptInfo.setLastUpdate(dateFormat.format(new Date()));
	
		session.clear();
		session.update("DeptInfo where deptId="+id,deptInfo);

		
		return "true";
	}

	public boolean deptDel(int id){
		Session session = super.getSession();
		List<DeptInfo> list=session.createQuery("From DeptInfo where status=1").list();
		List<UserInfo> listUser=session.createQuery("From UserInfo where status=1").list();
		Query query = session.createQuery("from DeptInfo where deptId=:id ");
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
			if(dept.getDeptId()==list.get(i).getDeptManager()){
				list.get(i).setDeptManager(dept.getDeptManager());
			}
		}
	
		dept.setStatus(0);
		//session.update("DeptInfo where deptId="+id,dept);
		
		return true;
	}
	
}
