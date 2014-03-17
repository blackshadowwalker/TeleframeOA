package com.dao;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.base.BaseDao;
import com.bean.DeptInfo;
import com.bean.RoleInfo;
import com.bean.UserInfo;
import com.util.EncoderHandler;
import com.util.Util;

public class UserDao extends BaseDao{

	@SuppressWarnings("unchecked")
	public List<UserInfo> query(UserInfo userInfo) throws Exception{
		Session session = this.getSession();
		String hql="select u.userId,u.userName,u.userPasswd,r.roleName,u.userBirth,d.deptName,u.lastUpdate from UserInfo u,RoleInfo r,DeptInfo d where u.userRole=r.roleId and u.userDepartment=d.deptId and u.status=1";
		if(userInfo!=null && userInfo.getUserName()!=null && !userInfo.getUserName().equals("")){
			System.out.println(userInfo.getUserName());
			hql+=" and u.userName like '%"+userInfo.getUserName()+"%'";
		}
		List<Object> list = session.createQuery(hql).list();
		List<UserInfo> list2 = new ArrayList<UserInfo>();
		UserInfo user;
		for(int i=0;i<list.size();i++){
			user = new UserInfo();
			Object[] object = (Object[])list.get(i);
			user.setUserId((Integer)object[0]);
			user.setUserName((String)object[1]);
			user.setUserPasswd((String)object[2]); // user.setUserPasswd("");
			user.setUserRoleName((String)object[3]);
			user.setUserBirth((String)object[4]);
			user.setUserDepartmentName((String)object[5]);
			user.setLastUpdate((Timestamp)object[6]);
			list2.add(user);
		}
		return list2;
	}
	
	@SuppressWarnings("unchecked")
	public String beforeAdd() throws Exception{
		Session session = getSession();
		StringBuffer sb=new StringBuffer();
		List<DeptInfo> list=session.createQuery("from DeptInfo where status=1").list();
		for(int i=0;i<list.size();i++){
			sb.append(list.get(i).getId()).append(",").append(list.get(i).getDeptName()).append(";");
		}
		sb.append("#");
		
		List<RoleInfo> list2=session.createQuery("from RoleInfo where status=1").list();
		for(int i=0;i<list2.size();i++){
			sb.append(list2.get(i).getRoleId()).append(",").append(list2.get(i).getRoleName()).append(";");
		}
		return sb.toString();
	}
	
	public String add(UserInfo userInfo) throws Exception{
		Session session = getSession();
		Timestamp lastUpdate = new Timestamp(System.currentTimeMillis());
		userInfo.setStatus(1);
		userInfo.setLastUpdate(lastUpdate);
		userInfo.setUserPasswd(EncoderHandler.MD5(userInfo.getUserPasswd()));
		session.save(userInfo);
		return Util.SUCCESS;
	}
	
	public UserInfo beforeUpdate(int id) throws Exception{
		Session session = getSession();
		Query query=session.createQuery("From UserInfo where userId=:id");
		query.setParameter("id", id);
		UserInfo userInfo = (UserInfo) query.uniqueResult();
	//	if(userInfo!=null)	userInfo.setUserPasswd("");
		return userInfo;
	}
	
	public String update(UserInfo userInfo) throws Exception{
		Session session = getSession();
		userInfo.setLastUpdate(new Timestamp(System.currentTimeMillis()));
		userInfo.setStatus(1);
	//	userInfo.setUserPasswd(EncoderHandler.MD5(userInfo.getUserPasswd()));
		session.update(userInfo);
		return "ok";
	}
	
	public String delete(UserInfo userInfo) throws Exception{
		Session session=getSession();
		Query query=session.createQuery("update UserInfo set status=0 where userId=:id");
		query.setParameter("id", userInfo.getUserId());
		query.executeUpdate();
		return "ok";
	}
}
