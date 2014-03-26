/*
* @author : karl
* @creation : 2014-3-26 上午01:16:40
* @description : 
*
*/

package com.action;

import com.base.BaseAction;
import com.bean.ArticleInfo;
import com.service.ArticleService;
import com.service.CategoryService;
import com.util.Util;

public class FinanceAction extends BaseAction {

	@Override
	public String handle() throws Exception {
		if(method==null)
			return this.query();
		return Util.NONE;
	}

	@Override
	public String add() throws Exception {
		return null;
	}

	@Override
	public String beforeAdd() throws Exception {
		return null;
	}

	@Override
	public String beforeUpdate() throws Exception {
		return null;
	}

	@Override
	public String delete() throws Exception {
		return null;
	}

	protected ArticleInfo articleInfo;
	protected ArticleService articleService;
	protected CategoryService categoryService;
	@Override
	public String query() throws Exception {
		articleService.query(articleInfo);
		return Util.LIST;
	}

	@Override
	public String update() throws Exception {
		return null;
	}

	@Override
	public boolean validate(Object obj) throws Exception {
		return false;
	}

	@Override
	public String view() throws Exception {
		return null;
	}

	public ArticleInfo getArticleInfo() {
		return articleInfo;
	}

	public void setArticleInfo(ArticleInfo articleInfo) {
		this.articleInfo = articleInfo;
	}

	public ArticleService getArticleService() {
		return articleService;
	}

	public void setArticleService(ArticleService articleService) {
		this.articleService = articleService;
	}

	public CategoryService getCategoryService() {
		return categoryService;
	}

	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}

}
