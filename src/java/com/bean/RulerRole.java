package com.bean;

import java.sql.Timestamp;

/**
 * RulerRole entity. @author MyEclipse Persistence Tools
 */

public class RulerRole implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer roleid;
	private Integer rulerid;
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
		this.roleid = roleId;
		this.rulerid = rulerid;
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

	public Integer getRoleId() {
		return this.roleid;
	}

	public void setRoleId(Integer roleId) {
		this.roleid = roleId;
	}

	public Integer getRulerId() {
		return this.rulerid;
	}

	public void setRulerId(Integer rulerid) {
		this.rulerid = rulerid;
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

	public Integer getRoleid() {
		return roleid;
	}

	public Integer getRulerid() {
		return rulerid;
	}

	public void setRoleid(Integer roleid) {
		this.roleid = roleid;
	}

	public void setRulerid(Integer rulerid) {
		this.rulerid = rulerid;
	}

}