package com.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.base.BaseDao;
import com.bean.CategoryInfo;
import com.bean.RulerInfo;

public class CategoryDao extends BaseDao {

	public List<CategoryInfo > query(CategoryInfo categoryInfo){
		Session session =this.getSession();
		Query query = session.createQuery(" from CategoryInfo c where c.status=1 ");
		return  (List<CategoryInfo>)query.list();
	}
	
}
