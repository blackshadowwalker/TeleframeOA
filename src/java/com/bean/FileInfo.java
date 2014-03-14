package com.bean;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.util.FileUtil;

/**
 * FileInfo entity. @author MyEclipse Persistence Tools
 */

public class FileInfo implements java.io.Serializable {

	// Fields

	private Integer id;
	private String sha1;
	private String md5;
	private Long fileSize;
	private String fileFormatedSize;
	private String fileName;
	private String fileType;
	private Integer pathFlag;
	private String path;
	private Integer securityLevel;
	private String lastUpdate;
	private Timestamp ctTime;
	private Integer status;

	// Constructors

	/** default constructor */
	public FileInfo() {
		pathFlag = 2;
		securityLevel = 0;
		status = 1;
	}

	/** minimal constructor */
	public FileInfo(Integer pathFlag, Integer status) {
		this.pathFlag = pathFlag;
		this.status = status;
	//	this.lastUpdate = new Date();
	}

	/** full constructor */
	public FileInfo(String fileName, String sha1, String md5, Long fileSize, String fileType, Integer pathFlag,
			String path, Integer securityLevel, Integer status) {
		this.fileName = fileName;
		this.sha1 = sha1;
		this.md5 = md5;
		this.fileSize = fileSize;
		this.fileType = fileType;
		this.pathFlag = pathFlag;
		this.path = path;
		this.securityLevel = securityLevel;
		this.status = status;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getFileName() {
		return this.fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileType() {
		return this.fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}

	public Integer getPathFlag() {
		return this.pathFlag;
	}

	public void setPathFlag(Integer pathFlag) {
		this.pathFlag = pathFlag;
	}

	public String getPath() {
		return this.path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public Integer getSecurityLevel() {
		return this.securityLevel;
	}

	public void setSecurityLevel(Integer securityLevel) {
		this.securityLevel = securityLevel;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getLastUpdate() {
		return lastUpdate;
	}

	public void setLastUpdate(String lastUpdateTime) {
		this.lastUpdate = lastUpdateTime;
	}

	public Timestamp getCtTime() {
		return ctTime;
	}

	public void setCtTime(Timestamp ctTime) {
		this.ctTime = ctTime;
	}

	public String getSha1() {
		return sha1;
	}

	public String getMd5() {
		return md5;
	}

	public void setSha1(String sha1) {
		this.sha1 = sha1;
	}

	public void setMd5(String md5) {
		this.md5 = md5;
	}

	public Long getFileSize() {
		return fileSize;
	}

	public void setFileSize(Long fileSize) {
		this.fileSize = fileSize;
	}

	public String getFileFormatedSize() {
		this.fileFormatedSize = FileUtil.FormatSize(this.fileSize*1.0);
		System.out.println(this.fileFormatedSize);
		return fileFormatedSize;
	}

	public void setFileFormatedSize(String fileFormatedSize) {
		this.fileFormatedSize = fileFormatedSize;
	}

}