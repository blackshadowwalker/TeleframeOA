package com.service;

import java.util.List;

import com.base.BaseService;
import com.bean.CategoryInfo;

public interface CategoryService extends BaseService {
	
	public CategoryInfo get(Integer id);

	public List<CategoryInfo > query(CategoryInfo categoryInfo);
	
	public List<CategoryInfo> beforeAdd();
	public String	add(CategoryInfo categoryInfo);

	public String 	delete(Integer id);

	public CategoryInfo  beforeUpdate(Integer id);
	public String	update(CategoryInfo categoryInfo);

}
