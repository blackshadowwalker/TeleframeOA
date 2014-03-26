package com.bean;

import java.sql.Timestamp;

/**
 * Syslog entity. @author MyEclipse Persistence Tools
 */
public class Syslog  implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer userId;
	private String ip;
	private String userName;
	private String content;
	private Timestamp createdOn;
	private Integer status;
	private UserInfo user;

	// Constructors
	public void setUser(UserInfo user) {
		if(user==null)
			return ;
		this.setUserId(user.getUserId());
		this.setIp(user.getIp());
		this.setUserName(user.getUserName());
		this.user = user;
	}

	/** default constructor */
	public Syslog() {
		status = 1;
	}

	/** full constructor */
	public Syslog(Integer userId, String ip, String userName,
			String content, Timestamp createdOn, Integer status) {
		this.userId = userId;
		this.ip = ip;
		this.userName = userName;
		this.content = content;
		this.createdOn = createdOn;
		this.status = status;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getIp() {
		return this.ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getCreatedOn() {
		return this.createdOn;
	}

	public void setCreatedOn(Timestamp createdOn) {
		this.createdOn = createdOn;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public UserInfo getUser() {
		return user;
	}



}
