package com.action.oa;

import java.util.List;

import com.base.BaseAction;
import com.bean.ArticleInfo;
import com.service.ArticleService;
import com.util.Util;

public class SearchAction extends BaseAction {
	
	ArticleService articleService;
	ArticleInfo articleInfo;
	List<ArticleInfo > list;
	String wd;
	
	@Override
	public String handle() throws Exception {
		
		if(wd==null || wd.isEmpty()){
			this.setMsg("请输入要搜索的关键词");
			return Util.SUCCESS;
		}
		if(articleInfo==null)
			articleInfo = new ArticleInfo();
		
		List<ArticleInfo > listtemp;
		
		String wds [] = wd.trim().split(" ");
		for(int i=0; i<wds.length; i++)
		{
			articleInfo.setTitle(wds[i].trim());//set words
			listtemp = articleService.query(articleInfo);
			articleInfo.setTitle("");//clear
			if(list!=null)
				list.addAll(listtemp);
			else
				list=listtemp;
			
			articleInfo.setContent(wds[i].trim());//set words
			listtemp = articleService.query(articleInfo);
			articleInfo.setContent("");//clear
			
			if(listtemp==null)
				continue;
			
			if(list!=null)
				list.addAll(listtemp);
			else
				list=listtemp;
		}
		
		return Util.SUCCESS;
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


	public String getWd() {
		return wd;
	}


	public void setWd(String wd) {
		this.wd = wd;
	}


	public ArticleService getArticleService() {
		return articleService;
	}


	public ArticleInfo getArticleInfo() {
		return articleInfo;
	}


	public List<ArticleInfo> getList() {
		return list;
	}


	public void setArticleService(ArticleService articleService) {
		this.articleService = articleService;
	}


	public void setArticleInfo(ArticleInfo articleInfo) {
		this.articleInfo = articleInfo;
	}


	public void setList(List<ArticleInfo> list) {
		this.list = list;
	}

}
