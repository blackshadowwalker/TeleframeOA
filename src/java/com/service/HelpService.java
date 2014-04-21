/*
* @author : karl
* @creation : 2014-04-03 18:41:16
* @ModuleName : 帮助 
* @description : 
* 	描述
*
*/

package com.service;

import java.util.List;

import com.base.BaseService;
import com.base.PageBean;
import com.bean.Help;

public interface HelpService extends BaseService {

	public Help get(Integer id);

	public List<Help > query(Help help, PageBean page);
	public List<Help > list(Help help);
	
	public String	add(Help help);

	public String 	delete(Integer id);

	public String	update(Help help);
	
}
