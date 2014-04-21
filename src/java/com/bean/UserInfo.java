package com.bean;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashSet;
import java.util.Set;

/**
 * UserInfo entity. @author MyEclipse Persistence Tools
 */

public class UserInfo implements java.io.Serializable {

	// Fields

	private Integer userId;
	private String userCode;
	private String userName;
	private String userPasswd;
	private Integer userRole;
	private String userRoleName;
	private Timestamp userBirth;
	private String userBirthString;
	private String userPhoto;
	private Integer userDepartment;
	private String userDepartmentName;
	private Timestamp lastUpdate;
	private Integer status;
	private String	ip;
	
	// Constructors

	/** default constructor */
	public UserInfo() {
	}

	/** minimal constructor */
	public UserInfo(String userCode, String userPasswd) {
		this.userCode = userCode;
		this.userPasswd = userPasswd;
	}

	/** full constructor */
	public UserInfo(String userCode,  String userName, String userPasswd, Integer userRole,
			Timestamp userBirth, String userPhoto, Integer userDepartment,
			Timestamp lastUpdate, Integer status) {
		this.userCode = userCode;
		this.userName = userName;
		this.userPasswd = userPasswd;
		this.userRole = userRole;
		this.userBirth = userBirth;
		this.userPhoto = userPhoto;
		this.userDepartment = userDepartment;
		this.lastUpdate = lastUpdate;
		this.status = status;
	}

	// Property accessors

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public void setUserId(String userId) {
		this.userId = Integer.parseInt(userId);
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPasswd() {
		return this.userPasswd;
	}

	public void setUserPasswd(String userPasswd) {
		this.userPasswd = userPasswd;
	}

	public Integer getUserRole() {
		return this.userRole;
	}

	public void setUserRole(Integer userRole) {
		this.userRole = userRole;
	}
	public void setUserRole(String userRole) {
		this.userRole = Integer.parseInt( userRole);
	}

	public String getUserPhoto() {
		return this.userPhoto;
	}

	public void setUserPhoto(String userPhoto) {
		this.userPhoto = userPhoto;
	}

	public Integer getUserDepartment() {
		return this.userDepartment;
	}

	public void setUserDepartment(Integer userDepartment) {
		this.userDepartment = userDepartment;
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

	public String getUserRoleName() {
		return userRoleName;
	}

	public void setUserRoleName(String userRoleName) {
		this.userRoleName = userRoleName;
	}

	public String getUserDepartmentName() {
		return userDepartmentName;
	}

	public void setUserDepartmentName(String userDepartmentName) {
		this.userDepartmentName = userDepartmentName;
	}
	
	public Timestamp getUserBirth() {
		return this.userBirth;
	}

	
	public void setUserBirth(Timestamp userBirth) {
		System.out.println("setUserBirth Timestamp = "+userBirth);
		this.userBirth = userBirth;
	}
	
	public void setUserBirth(String userBirth) {
		System.out.println("setUserBirth String = "+userBirth);  
	    DateFormat df = new SimpleDateFormat("yyyy-MM-dd");  
	    try {  
	        this.setUserBirth( new Timestamp(df.parse(userBirth).getTime()) );  
	    } catch (ParseException e) {  
	        e.printStackTrace();  
	    }  
		
	}

	public String getUserBirthString() {
		return userBirthString;
	}

	public void setUserBirthString(String userBirthString) {
		System.out.println("setUserBirthString String = "+userBirth);  
		this.userBirthString = userBirthString;
		if(userBirthString==null || userBirthString.trim().length()<10)
			return;
	    DateFormat df = new SimpleDateFormat("yyyy-MM-dd");  
	    try {  
	        this.setUserBirth( new Timestamp(df.parse(userBirthString).getTime()) );  
	    } catch (ParseException e) {  
	        e.printStackTrace();  
	    }  
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getUserCode() {
		return userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

}