package com.bean;

import java.sql.Timestamp;

/**
 * RulerRole entity. @author MyEclipse Persistence Tools
 */

public class RulerRole implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer roleId;
	private Integer rulerId;
	private String rulerWord;
	private Timestamp lastUpdate;
	private Integer status;

	// Constructors

	/** default constructor */
	public RulerRole() {
	}

	/** full constructor */
	public RulerRole(Integer roleId, Integer rulerid, String rulerWord,
			Timestamp lastUpdate, Integer status) {
		this.roleId = roleId;
		this.rulerId = rulerid;
		this.rulerWord = rulerWord;
		this.lastUpdate = lastUpdate;
		this.status = status;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}


	public String getRulerWord() {
		return this.rulerWord;
	}

	public void setRulerWord(String rulerWord) {
		this.rulerWord = rulerWord;
	}

	public Timestamp getLastUpdate() {
		return this.lastUpdate;
	}

	public void setLastUpdate(Timestamp lastUpdate) {
		this.lastUpdate = lastUpdate;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getRoleId() {
		return roleId;
	}

	public Integer getRulerId() {
		return rulerId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public void setRulerId(Integer rulerId) {
		this.rulerId = rulerId;
	}
	public void setRoleId(String roleId) {
		this.roleId = Integer.parseInt(roleId);
	}

	public void setRulerId(String rulerId) {
		this.rulerId = Integer.parseInt(rulerId); ;
	}



}