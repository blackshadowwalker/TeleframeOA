package com.action;

import java.io.PrintWriter;
import java.util.List;

import net.sf.json.JSONObject;

import com.base.BaseAction;
import com.bean.ArticleInfo;
import com.bean.CategoryInfo;
import com.service.ArticleService;
import com.service.CategoryService;
import com.util.Util;

public class ArticleAction extends BaseAction {

	ArticleService articleService;
	ArticleInfo articleInfo;
	List<ArticleInfo> list;
	List<CategoryInfo> CategoryList;

	CategoryService categoryService;

	@Override
	public String handle() throws Exception {
		if(method==null){
			if(id==null)
				return query();
			else
				return view();
		}
		return null;
	}

	public String save() throws Exception{
		if(articleInfo == null ){
			articleInfo = new ArticleInfo();
			
			String idstr = request.getParameter("id");
			if(idstr!=null && !idstr.trim().isEmpty())
				articleInfo.setId( Integer.parseInt(idstr) );
			articleInfo.setTitle( request.getParameter("title") );
			String category =  request.getParameter("category");
			if(category!=null)
				articleInfo.setCategory( Integer.parseInt(category) );
			articleInfo.setIntroduction( request.getParameter("introduction") );
			articleInfo.setTitlePicture( request.getParameter("titlePicture") );
			articleInfo.setContent(request.getParameter("content"));
		}
		articleInfo.setAuthor(user.getUserId());

		JSONObject json = new JSONObject();

		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");

		PrintWriter out = response.getWriter();		

		if( !this.validate(null) ){
			json.put("error", -1);
			json.put("msg", "表单不正确");
			System.out.println(json.toString());
			out.println(json.toString());
			out.close();
			return Util.NONE;
		}
		System.out.println(articleInfo.getIntroduction());

		String result = "";
		if(articleInfo.getId()==null || articleInfo.getId()<1){
			this.setLogmsg("添加文章 ["+articleInfo.getTitle()+"]");
			result = articleService.add(articleInfo);
		}else{
			this.setLogmsg("修改文章 ["+articleInfo.getTitle()+"]");
			result = articleService.update(articleInfo);
		}

		if( result.endsWith(Util.SUCCESS)){
			json.put("error", 0);
			json.put("msg", "success");
			json.put("id", articleInfo.getId());
			json.put("category", articleInfo.getCategory());
			this.setMsg("保存成功");
		}else{
			json.put("error", 2);
			if(result.endsWith(Util.EXIST))
				json.put("msg", "已经存在");
			else
				json.put("msg", "保存失败");
			this.setMsg("保存失败");
		}
		out.println(json.toString());
		out.close();
		return Util.NONE;
	}

	@Override
	public String add() throws Exception {
		return this.save();
	}

	@Override
	public String beforeAdd() throws Exception {

		CategoryList = categoryService.query(null);
		request.setAttribute("CategoryList", CategoryList);

		return Util.EDIT;
	}

	@Override
	public String beforeUpdate() throws Exception {
		CategoryList = categoryService.query(null);
		request.setAttribute("CategoryList", CategoryList);
		if(id==null || id <0)
			msg = "ID错误";
		else
			articleInfo = articleService.get(id);
		return Util.EDIT;
	}

	@Override
	public String delete() throws Exception {
		articleInfo = articleService.get(id);
		String result = articleService.delete(id);
		if(result!=null && result.endsWith(Util.SUCCESS))
			this.setMsg( "删除文章成功" );
		else
			this.setMsg( "删除文章失败" );
		
		return this.query();
	}


	@Override
	public String query() throws Exception {
		this.setLogmsg("查询");
		if(articleInfo!=null)
			request.setAttribute("category", articleInfo.getCategory());
		list = articleService.query(articleInfo);
		return Util.LIST;
	}

	@Override
	public String update() throws Exception {
		return this.save();
	}

	@Override
	public boolean validate(Object obj) throws Exception {
		boolean ret = true;
		if(articleInfo.getTitle()==null || articleInfo.getTitle().isEmpty()){
			this.addFieldError("articleInfo.title", "标题不能空");
			ret = false;
		}
		if(articleInfo.getCategory()==null || articleInfo.getCategory()<1){
			this.addFieldError("articleInfo.category","请选择类别");
			ret = false;
		}

		return ret;
	}

	@Override
	public String view() throws Exception {
		if(id==null || id<1){
			msg = "ID错误";
		}
		articleInfo = articleService.get(id);
		if(articleInfo==null)
			msg = "文章不存在";
		return Util.VIEW;
	}

	public ArticleService getArticleService() {
		return articleService;
	}

	public void setArticleService(ArticleService articleService) {
		this.articleService = articleService;
	}

	public ArticleInfo getArticleInfo() {
		return articleInfo;
	}

	public List<ArticleInfo> getList() {
		return list;
	}

	public void setArticleInfo(ArticleInfo articleInfo) {
		this.articleInfo = articleInfo;
	}

	public void setList(List<ArticleInfo> list) {
		this.list = list;
	}

	public CategoryService getCategoryService() {
		return categoryService;
	}

	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}

	public List<CategoryInfo> getCategoryList() {
		return CategoryList;
	}

	public void setCategoryList(List<CategoryInfo> categoryList) {
		CategoryList = categoryList;
	}

}
