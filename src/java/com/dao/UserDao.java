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
import com.bean.UserLogin;
import com.util.EncoderHandler;
import com.util.Util;

public class UserDao extends BaseDao{
	
	private String MD5(String str){
//		return str;
		return EncoderHandler.MD5(str);
	}
	
	public UserInfo get(Integer id)throws Exception{
		if(id==null)
			return null;
		Session session = getSession();
		String hql =" select u.userId, u.userName, u.userPasswd, u.userRole, (select r.roleName from RoleInfo r where r.roleId=u.userRole), u.userBirth, " +
			"u.userDepartment, (select deptName from DeptInfo d where d.deptId=u.userDepartment), u.lastUpdate, u.userPhoto, u.status " +
			"from UserInfo u where u.userId=:userId and u.status=1";

//		Query query = session.createQuery("from UserInfo where userId=:userId");
		Query query = session.createQuery(hql);
		query.setString("userId", id.toString());

		List<Object> list = query.list();
		UserInfo user=null;
		if(list.size()==1){
			int k = 0;
			user = new UserInfo();
			Object[] object = (Object[])list.get(0);
			user.setUserId((Integer)object[k++]);
			user.setUserName((String)object[k++]);
			user.setUserPasswd((String)object[k++]);
			user.setUserRole((Integer)object[k++]);
			user.setUserRoleName((String)object[k++]);
			user.setUserBirth((Timestamp)object[k++]);
			user.setUserDepartment((Integer)object[k++]);
			user.setUserDepartmentName((String)object[k++]);
			user.setLastUpdate((Timestamp)object[k++]);
			user.setUserPhoto((String)object[k++]);
			user.setStatus((Integer)object[k++]);
		}
		return user;
		
	}
	
	public UserInfo checkUser(UserInfo user) throws Exception{
		
		Session session = this.getSession();
		UserLogin userLogin = new UserLogin();
		Query query = session.createQuery("from UserInfo u where u.userName=:name and u.userPasswd=:pwd");
		query.setParameter("name", user.getUserName());
		query.setParameter("pwd", MD5(user.getUserPasswd()));
		
		return (UserInfo)query.uniqueResult();
	}

	@SuppressWarnings("unchecked")
	public List<UserInfo> query(UserInfo userInfo) throws Exception{
		Session session = this.getSession();
//		String hql="select u.userId,u.userName,u.userPasswd,r.roleName,u.userBirth,d.deptName,u.lastUpdate from UserInfo u,RoleInfo r,DeptInfo d " +
//				"where (1=1 or u.userRole=r.roleId or u.userDepartment=d.deptId) and u.status=1";
		String hql =" select u.userId, u.userName, u.userPasswd, (select r.roleName from RoleInfo r where r.roleId=u.userRole), u.userBirth, " +
				"(select deptName from DeptInfo d where d.deptId=u.userDepartment), u.lastUpdate, u.userPhoto from UserInfo u where u.status=1";
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
			user.setUserPasswd((String)object[2]);
			user.setUserPasswd("******");
			user.setUserRoleName((String)object[3]);
			user.setUserBirth((Timestamp)object[4]);
			user.setUserDepartmentName((String)object[5]);
			user.setLastUpdate((Timestamp)object[6]);
			user.setUserPhoto((String)object[7]);
			list2.add(user);
		}
		return list2;
	}
	
	//获取部门列表和角色列表
	@SuppressWarnings("unchecked")
	public String beforeAdd() throws Exception{
		Session session = getSession();
		StringBuffer sb=new StringBuffer();
		List<DeptInfo> list=session.createQuery("from DeptInfo where status=1").list();
		for(int i=0;i<list.size();i++){
			sb.append(list.get(i).getDeptId()).append(",").append(list.get(i).getDeptName()).append(";");
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
		
		Query query =session.createQuery("from UserInfo where userName=:userName");
		query.setString("userName", userInfo.getUserName() );
		List<UserInfo> list = (List<UserInfo>) query.list();
		if(list!=null && list.size()>0)
			return Util.EXIST;
		
		userInfo.setStatus(1);
		userInfo.setLastUpdate(new Timestamp(System.currentTimeMillis()));
		userInfo.setUserPasswd(MD5(userInfo.getUserPasswd()));
		session.save(userInfo);
		return Util.SUCCESS;
	}
	
	public UserInfo beforeUpdate(Integer id) throws Exception{
		Session session = getSession();
		return this.get(id);
	}
	
	public String update(UserInfo userInfo) throws Exception{
		Session session = getSession();
		userInfo.setLastUpdate(new Timestamp(System.currentTimeMillis()));
		userInfo.setStatus(1);
		
//		Query query = session.createQuery("update Teacher t set t.name = 'yangtianb' where id = 3");  
//		query.executeUpdate();  
//		session.getTransaction().commit();  
		
		UserInfo user = this.get(userInfo.getUserId());
		if(user==null)
			return Util.FAILE;
		if( userInfo.getUserPasswd().trim().length()>=1)
			userInfo.setUserPasswd(EncoderHandler.MD5(userInfo.getUserPasswd()));//修改密码
		else
			userInfo.setUserPasswd(user.getUserPasswd());//不修改密码
		if(userInfo.getUserName()==null || userInfo.getUserName().isEmpty())
			userInfo.setUserName(user.getUserName());
		session.clear();
		session.update(userInfo);
		return Util.SUCCESS;
	}
	
	public String delete(Integer id) throws Exception{
		Session session=getSession();
		Query query=session.createQuery("update UserInfo set status=0 where userId=:id");
		query.setParameter("id", id);
		query.executeUpdate();
		return Util.SUCCESS;
	}
}
