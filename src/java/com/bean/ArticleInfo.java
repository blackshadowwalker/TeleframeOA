package com.bean;

import java.sql.Timestamp;

/**
 * ArticleInfo entity. @author MyEclipse Persistence Tools
 */

public class ArticleInfo implements java.io.Serializable {

	// Fields

	private Integer id;
	private String title;
	private Integer category;
	private String categoryName;
	private String titlePicture;
	private String introduction;
	private Integer author;
	private String authorName;
	private String content;
	private Timestamp lastUpdate;
	private Timestamp ctTime;
	private Integer status;
	private String statusName;

	// Constructors

	/** default constructor */
	public ArticleInfo() {
		this.status = 1;
	}

	/** minimal constructor */
	public ArticleInfo(Integer status) {
		this.status = status;
	}

	/** full constructor */
	public ArticleInfo(String title, Integer category, String titlePicture,
			String introduction, Integer author, String content,
			Timestamp lastUpdate, Timestamp ctTime, Integer status) {
		this.title = title;
		this.category = category;
		this.titlePicture = titlePicture;
		this.introduction = introduction;
		this.author = author;
		this.content = content;
		this.lastUpdate = lastUpdate;
		this.ctTime = ctTime;
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

	public Integer getCategory() {
		return this.category;
	}

	public void setCategory(Integer category) {
		this.category = category;
	}

	public String getTitlePicture() {
		return this.titlePicture;
	}

	public void setTitlePicture(String titlePicture) {
		this.titlePicture = titlePicture;
	}

	public String getIntroduction() {
		return this.introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public Integer getAuthor() {
		return this.author;
	}

	public void setAuthor(Integer author) {
		this.author = author;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getLastUpdate() {
		return this.lastUpdate;
	}

	public void setLastUpdate(Timestamp lastUpdate) {
		this.lastUpdate = lastUpdate;
	}

	public Timestamp getCtTime() {
		return this.ctTime;
	}

	public void setCtTime(Timestamp ctTime) {
		this.ctTime = ctTime;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		if(status==null)
			return ;
		switch(status){
		case 0:
			statusName = "已删除";
			break;
		case 1:
			statusName = "已发表";
			break;
		case 2:
			statusName = "草稿";
			break;
		}
		this.status = status;
	}

	public String getAuthorName() {
		return authorName;
	}

	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getStatusName() {
		return statusName;
	}

	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}

}