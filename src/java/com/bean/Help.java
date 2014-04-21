package com.bean;

import java.sql.Timestamp;

/**
 * Help entity. @author MyEclipse Persistence Tools
 */

public class Help implements java.io.Serializable {

	// Fields

	private Integer id;
	private String title;
	private String keys;
	private String content;
	private String userCode;
	private String userName;
	private Timestamp lastUpdate;
	private Timestamp createOn;
	private Integer status;

	// Constructors

	/** default constructor */
	public Help() {
	}

	/** full constructor */
	public Help(String title, String keys, String content, String userCode,
			Timestamp lastUpdate, Timestamp createOn, Integer status) {
		this.title = title;
		this.keys = keys;
		this.content = content;
		this.userCode = userCode;
		this.lastUpdate = lastUpdate;
		this.createOn = createOn;
		this.status = status;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getKeys() {
		return this.keys;
	}

	public void setKeys(String keys) {
		this.keys = keys;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUserCode() {
		return this.userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

	public Timestamp getLastUpdate() {
		return this.lastUpdate;
	}

	public void setLastUpdate(Timestamp lastUpdate) {
		this.lastUpdate = lastUpdate;
	}

	public Timestamp getCreateOn() {
		return this.createOn;
	}

	public void setCreateOn(Timestamp createOn) {
		this.createOn = createOn;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	/**
	 * @return the userName
	 */
	public String getUserName() {
		return userName;
	}

	/**
	 * @param userName the userName to set
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}

}