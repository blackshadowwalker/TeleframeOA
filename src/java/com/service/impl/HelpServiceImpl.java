/*
* @author : karl
* @creation : 2014-04-03 18:41:16
* @ModuleName : 帮助 
* @description : 
* 	描述
*
*/

package com.service.impl;

import java.util.List;

import com.base.PageBean;
import com.bean.Help;
import com.dao.HelpDao;
import com.service.HelpService;

public class HelpServiceImpl implements HelpService {

	HelpDao helpDao;
	
	@Override
	public Help get(Integer id) {
		return helpDao.get(id);
	}

	@Override
	public List<Help> query(Help help, PageBean page) {
		return helpDao.query(help, page);
	}
	@Override
	public List<Help> list(Help help) {
		return helpDao.list(help);
	}

	public String	add(Help help){
		return helpDao.add(help);
	}

	public String 	delete(Integer id){
		return helpDao.delete(id);
	}

	public String	update(Help help){
		return helpDao.update(help);
	}
	
	
	// ========= getter and setter  =========
	public HelpDao getHelpDao() {
		return helpDao;
	}

	public void setHelpDao(HelpDao helpDao) {
		this.helpDao = helpDao;
	}


}
