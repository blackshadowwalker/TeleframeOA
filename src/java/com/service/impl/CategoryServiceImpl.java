package com.service.impl;

import java.util.List;

import com.bean.CategoryInfo;
import com.dao.CategoryDao;
import com.service.CategoryService;

public class CategoryServiceImpl implements CategoryService {
	
	CategoryDao categoryDao;

	@Override
	public String add(CategoryInfo categoryInfo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CategoryInfo> beforeAdd() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CategoryInfo beforeUpdate(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String delete(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CategoryInfo get(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CategoryInfo> query(CategoryInfo categoryInfo) {
		return categoryDao.query(categoryInfo);
	}

	@Override
	public String update(CategoryInfo categoryInfo) {
		// TODO Auto-generated method stub
		return null;
	}

	public CategoryDao getCategoryDao() {
		return categoryDao;
	}

	public void setCategoryDao(CategoryDao categoryDao) {
		this.categoryDao = categoryDao;
	}

}
