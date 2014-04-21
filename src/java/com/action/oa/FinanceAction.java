/*
* @author : karl
* @creation : 2014-3-26 上午01:16:40
* @description : 
*
*/

package com.action.oa;

import java.util.Collection;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.ResourceBundle;

import com.action.system.ArticleAction;
import com.base.BaseAction;
import com.bean.ArticleInfo;
import com.bean.CategoryInfo;
import com.opensymphony.xwork2.inject.Container;
import com.opensymphony.xwork2.util.ValueStack;
import com.service.ArticleService;
import com.service.CategoryService;
import com.service.RightService;
import com.service.RulerService;
import com.service.SyslogService;
import com.util.Util;

public class FinanceAction extends ArticleAction {

	/* (non-Javadoc)
	 * @see com.action.ArticleAction#add()
	 */
	@Override
	public String add() throws Exception {
		return super.add();
	}

	/* (non-Javadoc)
	 * @see com.action.ArticleAction#beforeAdd()
	 */
	@Override
	public String beforeAdd() throws Exception {
		return super.beforeAdd();
	}

	/* (non-Javadoc)
	 * @see com.action.ArticleAction#beforeUpdate()
	 */
	@Override
	public String beforeUpdate() throws Exception {
		return super.beforeUpdate();
	}

	/* (non-Javadoc)
	 * @see com.action.ArticleAction#delete()
	 */
	@Override
	public String delete() throws Exception {
		return super.delete();
	}

	/* (non-Javadoc)
	 * @see com.action.ArticleAction#getArticleInfo()
	 */
	@Override
	public ArticleInfo getArticleInfo() {
		return super.getArticleInfo();
	}

	/* (non-Javadoc)
	 * @see com.action.ArticleAction#getArticleService()
	 */
	@Override
	public ArticleService getArticleService() {
		return super.getArticleService();
	}

	/* (non-Javadoc)
	 * @see com.action.ArticleAction#getCategoryList()
	 */
	@Override
	public List<CategoryInfo> getCategoryList() {
		return super.getCategoryList();
	}

	/* (non-Javadoc)
	 * @see com.action.ArticleAction#getCategoryService()
	 */
	@Override
	public CategoryService getCategoryService() {
		return super.getCategoryService();
	}

	/* (non-Javadoc)
	 * @see com.action.ArticleAction#getList()
	 */
	@Override
	public List<ArticleInfo> getList() {
		return super.getList();
	}

	/* (non-Javadoc)
	 * @see com.action.ArticleAction#handle()
	 */
	@Override
	public String handle() throws Exception {
		return super.handle();
	}

	/* (non-Javadoc)
	 * @see com.action.ArticleAction#query()
	 */
	@Override
	public String query() throws Exception {
		return super.query();
	}

	/* (non-Javadoc)
	 * @see com.action.ArticleAction#save()
	 */
	@Override
	public String save() throws Exception {
		return super.save();
	}

	/* (non-Javadoc)
	 * @see com.action.ArticleAction#setArticleInfo(com.bean.ArticleInfo)
	 */
	@Override
	public void setArticleInfo(ArticleInfo articleInfo) {
		super.setArticleInfo(articleInfo);
	}

	/* (non-Javadoc)
	 * @see com.action.ArticleAction#setArticleService(com.service.ArticleService)
	 */
	@Override
	public void setArticleService(ArticleService articleService) {
		super.setArticleService(articleService);
	}

	/* (non-Javadoc)
	 * @see com.action.ArticleAction#setCategoryList(java.util.List)
	 */
	@Override
	public void setCategoryList(List<CategoryInfo> categoryList) {
		super.setCategoryList(categoryList);
	}

	/* (non-Javadoc)
	 * @see com.action.ArticleAction#setCategoryService(com.service.CategoryService)
	 */
	@Override
	public void setCategoryService(CategoryService categoryService) {
		super.setCategoryService(categoryService);
	}

	/* (non-Javadoc)
	 * @see com.action.ArticleAction#setList(java.util.List)
	 */
	@Override
	public void setList(List<ArticleInfo> list) {
		super.setList(list);
	}

	/* (non-Javadoc)
	 * @see com.action.ArticleAction#update()
	 */
	@Override
	public String update() throws Exception {
		return super.update();
	}

	/* (non-Javadoc)
	 * @see com.action.ArticleAction#validate(java.lang.Object)
	 */
	@Override
	public boolean validate(Object obj) throws Exception {
		return super.validate(obj);
	}

	/* (non-Javadoc)
	 * @see com.action.ArticleAction#view()
	 */
	@Override
	public String view() throws Exception {
		return super.view();
	}

}
