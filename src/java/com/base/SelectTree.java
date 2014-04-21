/*
* @author : karl
* @creation : 2014-3-27 下午05:38:43
* @description : 
*
*/

package com.base;

import net.sf.json.JSONObject;

public class SelectTree {
	private Integer id;
	private String text;
	private Integer pid;
	/**
	 * @return the id
	 */
	public Integer getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(Integer id) {
		this.id = id;
	}
	/**
	 * @return the text
	 */
	public String getText() {
		return text;
	}
	/**
	 * @param text the text to set
	 */
	public void setText(String text) {
		this.text = text;
	}
	/**
	 * @return the pid
	 */
	public Integer getPid() {
		return pid;
	}
	/**
	 * @param pid the pid to set
	 */
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	
	@Override
	public String toString() {
		return JSONObject.fromObject(this).toString();
	}

}
