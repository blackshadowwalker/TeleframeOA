package com.dao;

import java.sql.Timestamp;

import org.hibernate.Query;
import org.hibernate.Session;

import com.base.BaseDao;
import com.bean.RoleInfo;
import com.bean.UserInfo;
import com.bean.UserLogin;
import com.util.EncoderHandler;

public class LoginDao extends BaseDao {
	
	
	public UserInfo login(UserInfo user,String ip) throws Exception{
		
		Session session = this.getSession();
		UserLogin userLogin = new UserLogin();
		Query query = session.createQuery("from UserInfo u where u.userName=:name and u.userPasswd=:pwd");
		query.setParameter("name", user.getUserName());
		query.setParameter("pwd", EncoderHandler.MD5(user.getUserPasswd()));
		
		UserInfo user2= (UserInfo)query.uniqueResult();
		
		if(user2!=null){
			query = session.createQuery("from RoleInfo r where r.roleId= "+user2.getUserRole());
			RoleInfo roleInfo = (RoleInfo)query.uniqueResult();
//			System.out.println("query="+query.getQueryString());
			
			userLogin.setLoginId(user2.getUserId());
			userLogin.setLoginIp(ip);
			userLogin.setLoginTime(new Timestamp(System.currentTimeMillis()));
			session.save(userLogin);
			if(roleInfo!=null)
				user2.setUserRoleName(roleInfo.getRoleName());
			return user2;
		}
		else 
			return null;
	}
}
