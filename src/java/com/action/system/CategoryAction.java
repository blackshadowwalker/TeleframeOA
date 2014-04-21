package com.action.system;

import com.base.BaseAction;
import com.service.ArticleService;
import com.service.CategoryService;

public class CategoryAction extends BaseAction {

	CategoryService categoryService;
	CategoryAction categoryAction;

	@Override
	public String handle() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String add() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String beforeAdd() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String beforeUpdate() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String delete() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String query() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String update() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean validate(Object obj) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String view() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public CategoryAction getCategoryAction() {
		return categoryAction;
	}

	public void setCategoryAction(CategoryAction categoryAction) {
		this.categoryAction = categoryAction;
	}

}
