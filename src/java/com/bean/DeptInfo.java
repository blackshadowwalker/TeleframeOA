package com.bean;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

/**
 * DeptInfo entity. @author MyEclipse Persistence Tools
 */

public class DeptInfo implements java.io.Serializable {

	// Fields

	private Integer 	deptId;
	private String 		deptName;
	private Integer 	manager;
	private String 		managerName;
	private Timestamp  	lastUpdate;
	private String 		lastUpdateString;
	private Integer 	status;

	// Constructors

	/** default constructor */
	public DeptInfo() {
		manager = 0;
	}


	// Property accessors

	public String getDeptName() {
		return this.deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}


	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}


	public Integer getManager() {
		if(manager==null)
			return 0;
		return manager;
	}

	public String getManagerName() {
		return managerName;
	}

	public Timestamp getLastUpdate() {
		return lastUpdate;
	}

	public void setManager(Integer manager) {
		this.manager = manager;
	}

	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}

	private DateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	public void setLastUpdate(Timestamp lastUpdate) {
		this.setLastUpdateString(df.format(lastUpdate));
		this.lastUpdate = lastUpdate;
	}

	public String getLastUpdateString() {
		this.setLastUpdateString(df.format(this.lastUpdate));
		return lastUpdateString;
	}


	public void setLastUpdateString(String lastUpdateString) {
		this.lastUpdateString = lastUpdateString;
	}


	public Integer getDeptId() {
		return deptId;
	}

	public void setDeptId(Integer deptId) {
		this.deptId = deptId;
	}

}