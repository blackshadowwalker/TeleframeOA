/*
* @author : karl
* @creation : 2014-3-26 下午07:23:54
* @description : 行政规章制度
*
*/

package com.action.oa;

import java.io.PrintWriter;
import java.util.List;

import net.sf.json.JSONArray;

import com.action.system.ArticleAction;
import com.bean.ArticleInfo;
import com.bean.CategoryInfo;
import com.service.ArticleService;
import com.service.CategoryService;
import com.util.Util;

public class RegulationAction extends ArticleAction {

	String m ;
	
	@Override
	public String handle() throws Exception {
		
		if(m!=null && m.equals("getJson"))
			return this.getJson();
		
		if(id!=null && id>0)
			return this.view();

		return super.handle();
	}
	
	public String getJson() throws Exception{
		this.setLogmsg("查询行政规章制度");
		
		if(articleInfo==null)
			articleInfo = new ArticleInfo();
		articleInfo.setCategory(2);
		if(articleInfo!=null)
			request.setAttribute("category", articleInfo.getCategory());
		list = articleService.query(articleInfo);
		
		//response.setHeader("Access-Control-Allow-Origin", "*");
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.println(JSONArray.fromObject(list));
		out.close();
		
		return Util.NONE;
	}
	
	@Override
	public String view() throws Exception {
		if(id==null || id<1){
			msg = "ID错误";
		}
		articleInfo = articleService.get(id);
		if(articleInfo==null)
			msg = "文章不存在";
		
		String viewurl = request.getParameter("viewurl");
		if(viewurl==null || viewurl.trim().isEmpty())
			return Util.VIEW;
		
		request.getRequestDispatcher(viewurl).forward(request, response);
		return Util.NONE;
		
	}
	
	@Override
	public String query() throws Exception {
		if(articleInfo==null)
			articleInfo = new ArticleInfo();
		articleInfo.setCategory(2);
		return super.query();
	}
	
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


	public String getM() {
		return m;
	}

	public void setM(String m) {
		this.m = m;
	}

}
