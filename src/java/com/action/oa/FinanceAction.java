/*
* @author : karl
* @creation : 2014-3-26 上午01:16:40
* @description :  财务规章制度
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

public class FinanceAction extends ArticleAction {

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
		this.setLogmsg("查询财务规章制度");
		
		if(articleInfo==null)
			articleInfo = new ArticleInfo();
		articleInfo.setCategory(1);
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
	public String query() throws Exception {
		this.setLogmsg("查询财务规章制度");
		
		if(articleInfo==null)
			articleInfo = new ArticleInfo();
		articleInfo.setCategory(1);
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



	@Override
	public String save() throws Exception {
		return super.save();
	}


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


	public String getM() {
		return m;
	}


	public void setM(String m) {
		this.m = m;
	}

}
