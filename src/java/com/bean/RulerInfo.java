package com.bean;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

/**
 * RulerInfo entity. @author MyEclipse Persistence Tools
 */

public class RulerInfo implements java.io.Serializable {

	// Fields

	private Integer rulerid;
	private String rulerName;
	private String url;
	private Integer level;
	private Integer echo;
	private Integer manager;
	private String managerName;
	private String target;
	private Integer sortorder;
	private Timestamp lastupdate;
	private String lastupdateString;
	private Integer status;

	// Constructors

	/** default constructor */
	public RulerInfo() {
		level = 1;
		manager = 0;
		echo = 1;
		sortorder = 0;
		status = 1;
	}

	/** full constructor */
	public RulerInfo(String rulerName, String rulerUrl, Integer rulerLevel,
			Integer rulerEcho, Integer rulerManager, String rulerTarget,
			Integer order, Timestamp lastUpdate, Integer status) {
		this.rulerName = rulerName;
		this.url = rulerUrl;
		this.level = rulerLevel;
		this.echo = rulerEcho;
		this.manager = rulerManager;
		this.target = rulerTarget;
		this.sortorder = order;
		this.lastupdate = lastUpdate;
		this.status = status;
	}

	// Property accessors
	public Integer getRulerid() {
		return rulerid;
	}
	public void setRulerid(Integer rulerid) {
		this.rulerid = rulerid;
	}
	public void setRulerid(String rulerid) {
		this.rulerid = Integer.parseInt(rulerid);
	}

	public String getUrl() {
		return url;
	}

	public Integer getLevel() {
		return level;
	}

	public Integer getEcho() {
		return echo;
	}

	public Integer getManager() {
		return manager;
	}

	public String getManagerName() {
		return managerName;
	}

	public String getTarget() {
		return target;
	}

	public Integer getSortorder() {
		return sortorder;
	}


	public Integer getStatus() {
		return status;
	}



	public void setUrl(String url) {
		this.url = url;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public void setEcho(Integer echo) {
		this.echo = echo;
	}

	public void setManager(Integer manager) {
		this.manager = manager;
	}

	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}

	public void setTarget(String target) {
		this.target = target;
	}

	public void setSortorder(Integer sortorder) {
		this.sortorder = sortorder;
	}


	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getRulerName() {
		return rulerName;
	}


	public void setRulerName(String rulerName) {
		this.rulerName = rulerName;
	}
	
	public void setLastupdate(String lp) {
		this.setLastupdate(Timestamp.valueOf(lp));//此处
	}
	public void setLastupdate(Timestamp lastupdate) {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		lastupdateString = df.format(lastupdate);
		this.lastupdate = lastupdate;
	}
	public Timestamp getLastupdate() {
		return lastupdate;
	}

	public String getLastupdateString() {
		return lastupdateString;
	}

	


}