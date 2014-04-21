package com.dao;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.base.BaseDao;
import com.bean.ArticleInfo;
import com.bean.CategoryInfo;
import com.bean.DeptInfo;
import com.util.Util;

public class ArticleDao extends BaseDao {

	public ArticleInfo get(Integer id){
		Session session = super.getSession();
		if(id==null || id<1)
			return null;
		String hql ="select a.id, a.title, a.category, " +
			"(select b.categoryName From CategoryInfo b where b.id=a.category ) as categoryName ," +
			"a.titlePicture, a.introduction, a.author, " +
			"(select c.userName from UserInfo c where c.userId = a.author) as authorName," +
			"a.content, a.lastUpdate, a.ctTime, a.status " +
			" From ArticleInfo a where a.id=:id and a.status!=0";
		Query query = session.createQuery(hql);
		query.setLong("id", id);
		List<Object> list = query.list();
		ArticleInfo info = null;
		if(list!=null && list.size()>0){
			int k=0;
			Object[] object = (Object[])list.get(0);
			info = new ArticleInfo();
			info.setId((Integer)object[k++]);
			info.setTitle((String)object[k++]);
			info.setCategory((Integer)object[k++]);
			info.setCategoryName((String)object[k++]);
			info.setTitlePicture((String)object[k++]);
			info.setIntroduction((String)object[k++]);
			info.setAuthor((Integer)object[k++]);
			info.setAuthorName((String)object[k++]);
			info.setContent((String)object[k++]);
			info.setLastUpdate((Timestamp)object[k++]);
			info.setCtTime((Timestamp)object[k++]);
			info.setStatus((Integer)object[k++]);
		
		}
		return info;
	}

	public List<ArticleInfo > query(ArticleInfo articleInfo){
		Session session = super.getSession();
		String hql ="select a.id, a.title, a.category, " +
				"(select b.categoryName From CategoryInfo b where b.id=a.category ) ," +
				"a.titlePicture, a.introduction, a.author, " +
				"(select c.userName from UserInfo c where c.userId = a.author)," +
				"a.content, a.lastUpdate, a.ctTime, a.status " +
				" From ArticleInfo a where a.status!=0 ";
		if(articleInfo!=null){
			if(articleInfo.getCategory()!=null && articleInfo.getCategory()>0)
				hql += " and a.category="+articleInfo.getCategory() +" ";
			if(articleInfo.getTitle()!=null && articleInfo.getTitle().trim().length()>0)
				hql += " and a.title like '%"+articleInfo.getTitle()+"%' ";
			if(articleInfo.getContent()!=null && articleInfo.getContent().trim().length()>0)
				hql += " and a.content like '%"+articleInfo.getContent()+"%' ";
		}
		
	//	List<ArticleInfo> list = session.createQuery("From ArticleInfo where status!=0").list();
		List<Object> list1 = session.createQuery(hql).list();
		List<ArticleInfo> list = null;
		if(list1!=null && list1.size()>0){
			list = new ArrayList<ArticleInfo>();
			for(int i=0; i<list1.size(); i++){
				int k=0;
				Object[] object = (Object[])list1.get(i);
				ArticleInfo info = new ArticleInfo();
				info.setId((Integer)object[k++]);
				info.setTitle((String)object[k++]);
				info.setCategory((Integer)object[k++]);
				info.setCategoryName((String)object[k++]);
				info.setTitlePicture((String)object[k++]);
				info.setIntroduction((String)object[k++]);
				info.setAuthor((Integer)object[k++]);
				info.setAuthorName((String)object[k++]);
				info.setContent((String)object[k++]);
				info.setLastUpdate((Timestamp)object[k++]);
				info.setCtTime((Timestamp)object[k++]);
				info.setStatus((Integer)object[k++]);
				list.add(info);
			}
		}
		return list;
	}

	public List<CategoryInfo> beforeAdd(){
		return null;
	}
	public String	add(ArticleInfo articleInfo){
		Session session = super.getSession();

		articleInfo.setCtTime(new Timestamp(System.currentTimeMillis()));
		articleInfo.setLastUpdate(new Timestamp(System.currentTimeMillis()));
		session.save(articleInfo);	

		return Util.SUCCESS;
	}

	public String 	delete(Integer id){
		Session session = super.getSession();
		ArticleInfo article = (ArticleInfo) session.get(ArticleInfo.class, id);
		if(article==null)
			return Util.FAILE;
		article.setStatus(0);
		article.setLastUpdate(new Timestamp(System.currentTimeMillis()));
		session.update(article);
	//	session.delete(article);
		return Util.SUCCESS;
	}

	public ArticleInfo  beforeUpdate(Integer id){
		return null;
	}
	public String	update(ArticleInfo articleInfo){
		Session session = super.getSession();

		articleInfo.setLastUpdate(new Timestamp(System.currentTimeMillis()));
		session.update(articleInfo);
		return Util.SUCCESS;
	}

}
