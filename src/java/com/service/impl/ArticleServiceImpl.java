package com.service.impl;

import java.util.List;

import com.bean.ArticleInfo;
import com.bean.CategoryInfo;
import com.bean.Syslog;
import com.dao.ArticleDao;
import com.util.Util;

public class ArticleServiceImpl implements com.service.ArticleService {

	ArticleDao articleDao;
	
	@Override
	public ArticleInfo get(Integer id) {
		return articleDao.get(id);
	}
	
	@Override
	public String add(ArticleInfo articleInfo) {
		return articleDao.add(articleInfo);
	}

	@Override
	public List<CategoryInfo> beforeAdd() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArticleInfo beforeUpdate(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String delete(Integer id) {
		String result = articleDao.delete(id);
		return result;
	}

	@Override
	public List<ArticleInfo> query(ArticleInfo articleInfo) {
		return articleDao.query(articleInfo);
	}

	@Override
	public String update(ArticleInfo articleInfo) {
		return articleDao.update(articleInfo);
	}

	public ArticleDao getArticleDao() {
		return articleDao;
	}

	public void setArticleDao(ArticleDao articleDao) {
		this.articleDao = articleDao;
	}

}
