package com.bean;

/**
 * CategoryInfo entity. @author MyEclipse Persistence Tools
 */

public class CategoryInfo implements java.io.Serializable {

	// Fields

	private Integer id;
	private String categoryName;
	private Integer status;

	// Constructors

	/** default constructor */
	public CategoryInfo() {
	}

	/** minimal constructor */
	public CategoryInfo(Integer status) {
		this.status = status;
	}

	/** full constructor */
	public CategoryInfo(String categoryName, Integer status) {
		this.categoryName = categoryName;
		this.status = status;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCategoryName() {
		return this.categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

}