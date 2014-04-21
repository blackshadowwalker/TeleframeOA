/*
 * @author : karl
 * @creation : 2014-3-27 上午12:52:25
 * @description : 
 *
 */

package com.dao;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;

import com.base.BaseDao;
import com.bean.DeviceInfo;
import com.util.Util;

public class DeviceDao extends BaseDao {

	public DeviceInfo get(Integer id) {
		session = this.getSession();
		DeviceInfo d = (DeviceInfo) session.get(DeviceInfo.class, id);
		return d;
	}
	
	public List<DeviceInfo> getByPid(Integer pid) {
		session = this.getSession();
		String hql = " from DeviceInfo  where status!=0 and pid=:pid ";
		Query query = session.createQuery(hql);
		query.setLong("pid", pid);
		return  query.list();
	}

	public List<DeviceInfo> list(DeviceInfo deviceInfo) {
		session = this.getSession();
		String hql = " from DeviceInfo  where status!=0 ";
		if(deviceInfo!=null){
			if(deviceInfo.getName()!=null && !deviceInfo.getName().trim().isEmpty())
				hql += " and name like '%"+deviceInfo.getName()+"%' ";
		}
		return session.createQuery(hql).list();
	}

	public String update(DeviceInfo deviceInfo) {
		if(deviceInfo==null)
			return Util.FAILE;
		if(deviceInfo.getId()==null || deviceInfo.getId()<1)
			return Util.FAILE;

		session = this.getSession();
		if(deviceInfo.getPid()==null)
			deviceInfo.setPid(0);
		deviceInfo.setLastUpdate(new Timestamp(System.currentTimeMillis()));
		if(deviceInfo.getStatus()==null)
			deviceInfo.setStatus(1);
		System.out.println("id="+deviceInfo.getId()+", mapscaling="+deviceInfo.getMapScaling());
		session.update(deviceInfo);

		return Util.SUCCESS;
	}

	public String add(DeviceInfo deviceInfo) {
		if(deviceInfo==null)
			return Util.FAILE;
		session = this.getSession();
		if(deviceInfo.getPid()==null)
			deviceInfo.setPid(0);
		deviceInfo.setLastUpdate(new Timestamp(System.currentTimeMillis()));
		if(deviceInfo.getStatus()==null)
			deviceInfo.setStatus(1);
		session.save(deviceInfo);

		return Util.SUCCESS;
	}

	public String delete(Integer id) {

		if(id==null || id<1)
			return Util.FAILE;
		session = this.getSession();
		DeviceInfo deviceInfo = (DeviceInfo) session.get(DeviceInfo.class, id); 
		if(deviceInfo==null)
			return Util.FAILE;
		//check parent node & set children nodes set child.pid=this.pid 
		if(deviceInfo.getPid()==null)
			deviceInfo.setPid(0);
		List<DeviceInfo> list = this.getByPid(deviceInfo.getId());//get children
		if(list!=null){
			for(int i=0; i<list.size(); i++){
				DeviceInfo dev = list.get(i);
				dev.setPid(deviceInfo.getPid());//set child.pid = this.pid
				session.update(dev);
			}
		}
		deviceInfo.setStatus(0);
		deviceInfo.setLastUpdate(new Timestamp(System.currentTimeMillis()));
		session.update(deviceInfo);

		return Util.SUCCESS;
	}

	public String saveOrUpdate(DeviceInfo deviceInfo){
		session = this.getSession();
		if(deviceInfo.getPid()==null)
			deviceInfo.setPid(0);
		deviceInfo.setLastUpdate(new Timestamp(System.currentTimeMillis()));
		if(deviceInfo.getStatus()==null)
			deviceInfo.setStatus(1);
		session.saveOrUpdate(deviceInfo);
		return Util.SUCCESS;
	}

	public String save(DeviceInfo deviceInfo) {
		if(deviceInfo!=null && deviceInfo.getId()!=null && deviceInfo.getId()>0)
			return this.update(deviceInfo);
		else
			return this.add(deviceInfo);
	}

	public static void main(String args[]){
		String str = "\0xca\0xd4\0xd3\0xc3 \u8bf7\u8f93\u5165\u5185\u5bb9\uff1a";
		System.out.println(str);
	}


}
