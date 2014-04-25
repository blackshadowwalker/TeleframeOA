/*
* @author : karl
* @creation : 2014-4-18 下午06:13:50
* @description : 
*
*/

package com.action.system;

import com.base.BaseAction;
import com.util.Util;

public class IndexAction extends BaseAction {


	@Override
	public String handle() throws Exception {
		return Util.SUCCESS;
	}

	@Override
	public String query() throws Exception {
		return null;
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

}
