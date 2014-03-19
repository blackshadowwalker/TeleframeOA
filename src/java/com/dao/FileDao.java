package com.dao;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.base.BaseDao;
import com.bean.FileInfo;
import com.bean.RoleInfo;
import com.bean.RulerInfo;
import com.bean.TSNvr;
import com.util.Util;


public class FileDao extends BaseDao {

	private static String  TABLE = "FileInfo";

	public FileInfo query(int id) throws Exception{
		Session session = this.getSession();
		FileInfo fileInfo = (FileInfo) session.get(FileInfo.class, id);
		if(fileInfo!=null){
			return fileInfo;
		}else
			return null;
	}

	public List<FileInfo> query(String fileName) throws Exception{
		Session session=this.getSession();
		String hql="";
		Query query =null;
		if(fileName==null || fileName.trim().isEmpty()){
			hql = "From "+TABLE+" Where status=1";
			query = session.createQuery(hql);
		}
		else{
			hql = "From "+TABLE+" Where status=1 and fileName like  :fileName";
			query = session.createQuery(hql);
			query.setString("fileName", "%"+fileName+"%");
		}
		List<FileInfo> list=query.list(); 
		return list;
	}

	public FileInfo query(String md5, String sha1) throws Exception{
		Session session=this.getSession();
		String hql="";
		hql = "From "+TABLE+" Where status=1 and md5=:md5 and sha1=:sha1";
		Query query = session.createQuery(hql);
		query.setString("md5", md5);
		query.setString("sha1", sha1);
		FileInfo fileInfo = (FileInfo) query.uniqueResult();
		if(fileInfo==null)
			return null;
		
		return fileInfo;
	}

	public String add(FileInfo fileInfo) throws Exception{
		Session session =this.getSession();
		DateFormat sd = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		fileInfo.setLastUpdate( sd.format(new Date()));
		fileInfo.setCtTime( new Timestamp(System.currentTimeMillis()) );
		session.save(fileInfo);
		return Util.SUCCESS;
	}
	public String delete(int id) throws Exception{
		Session session = this.getSession();
		FileInfo fileInfo = (FileInfo) session.get(FileInfo.class, id);
		if(fileInfo!=null){
			session.delete(fileInfo);//
			return Util.SUCCESS;
		}else
			return Util.FAILE;

		/*
		FileInfo fileInfo = (FileInfo)session.createQuery("from "+TABLE+" r where r.id="+ id).uniqueResult();
		if(fileInfo!=null){
			fileInfo.setLastUpdate(new Timestamp(System.currentTimeMillis()));
			fileInfo.setStatus(0);
			session.update(fileInfo);
			return Util.SUCCESS;
		}else
			return Util.FAILE;
		 */
	}

	public FileInfo beforeUpdate(int id) throws Exception{
		Session session = this.getSession();
		FileInfo fileInfo = (FileInfo) session.get(FileInfo.class, id);
		if(fileInfo!=null){
			return fileInfo;
		}else
			return null;

	}

	public String update(FileInfo fileInfo) throws Exception{
		Session session = this.getSession();
		DateFormat sd = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		fileInfo.setLastUpdate( sd.format(new Date()));
		session.update(fileInfo);

		return Util.SUCCESS;
	}

}
