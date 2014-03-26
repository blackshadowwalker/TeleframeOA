package com.service;

import java.util.List;

import com.base.BaseService;
import com.bean.ArticleInfo;
import com.bean.CategoryInfo;

public interface ArticleService extends BaseService {

	public ArticleInfo get(Integer id);

	public List<ArticleInfo > query(ArticleInfo articleInfo);
	
	public List<CategoryInfo> beforeAdd();
	public String	add(ArticleInfo articleInfo);

	public String 	delete(Integer id);

	public ArticleInfo  beforeUpdate(Integer id);
	public String	update(ArticleInfo articleInfo);
	
}
