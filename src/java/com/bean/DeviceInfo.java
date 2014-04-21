package com.bean;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

/**
 * DeviceInfo entity. @author MyEclipse Persistence Tools
 */

public class DeviceInfo implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private Integer pid;
	private String pname;
	private String roadNo;
	private String ip;
	private String mask;
	private String gateway;
	private String directory;
	private Integer markLimitSpeed;
	private Integer lawLimitSpeed;
	private String no;
	private String address;
	private String longitude;
	private String latitude;
	private Integer mapScaling;
	private String serverIp;
	private String serverNo;
	private String unitNo;
	private Integer x;
	private Integer y;
	private Timestamp lastUpdate;
	private String lastUpdateString;
	private Integer status;

	// Constructors

	/** default constructor */
	public DeviceInfo() {
		status = 1;
		pid = 0;
	}

	/** minimal constructor */
	public DeviceInfo(Integer pid) {
		this.pid = pid;
	}

	/** full constructor */
	public DeviceInfo(String name, Integer pid, String roadNo, String ip,
			String mask, String gateway, String directory,
			Integer markLimitSpeed, Integer lawLimitSpeed, String no,
			String address, String longitude, String latitude, String serverIp,
			String serverNo, String unitNo, Integer x, Integer y, Integer status) {
		this.name = name;
		this.pid = pid;
		this.roadNo = roadNo;
		this.ip = ip;
		this.mask = mask;
		this.gateway = gateway;
		this.directory = directory;
		this.markLimitSpeed = markLimitSpeed;
		this.lawLimitSpeed = lawLimitSpeed;
		this.no = no;
		this.address = address;
		this.longitude = longitude;
		this.latitude = latitude;
		this.serverIp = serverIp;
		this.serverNo = serverNo;
		this.unitNo = unitNo;
		this.x = x;
		this.y = y;
		this.status = status;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getPid() {
		return this.pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public String getRoadNo() {
		return this.roadNo;
	}

	public void setRoadNo(String roadNo) {
		this.roadNo = roadNo;
	}

	public String getIp() {
		return this.ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getMask() {
		return this.mask;
	}

	public void setMask(String mask) {
		this.mask = mask;
	}

	public String getGateway() {
		return this.gateway;
	}

	public void setGateway(String gateway) {
		this.gateway = gateway;
	}

	public String getDirectory() {
		return this.directory;
	}

	public void setDirectory(String directory) {
		this.directory = directory;
	}

	public Integer getMarkLimitSpeed() {
		return this.markLimitSpeed;
	}

	public void setMarkLimitSpeed(Integer markLimitSpeed) {
		this.markLimitSpeed = markLimitSpeed;
	}

	public Integer getLawLimitSpeed() {
		return this.lawLimitSpeed;
	}

	public void setLawLimitSpeed(Integer lawLimitSpeed) {
		this.lawLimitSpeed = lawLimitSpeed;
	}

	public String getNo() {
		return this.no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getLongitude() {
		return this.longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public String getLatitude() {
		return this.latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getServerIp() {
		return this.serverIp;
	}

	public void setServerIp(String serverIp) {
		this.serverIp = serverIp;
	}

	public String getServerNo() {
		return this.serverNo;
	}

	public void setServerNo(String serverNo) {
		this.serverNo = serverNo;
	}

	public String getUnitNo() {
		return this.unitNo;
	}

	public void setUnitNo(String unitNo) {
		this.unitNo = unitNo;
	}

	public Integer getX() {
		return this.x;
	}

	public void setX(Integer x) {
		this.x = x;
	}

	public Integer getY() {
		return this.y;
	}

	public void setY(Integer y) {
		this.y = y;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	/**
	 * @return the lastUpdate
	 */
	public Timestamp getLastUpdate() {
		return lastUpdate;
	}

	/**
	 * @param lastUpdate the lastUpdate to set
	 */
	public void setLastUpdate(Timestamp lastUpdate) {
		this.lastUpdate = lastUpdate;
		if(lastUpdate!=null){
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			this.setLastUpdateString(df.format(this.lastUpdate));
		}
	}

	/**
	 * @return the lastUpdateString
	 */
	public String getLastUpdateString() {
		return lastUpdateString;
	}

	/**
	 * @param lastUpdateString the lastUpdateString to set
	 */
	public void setLastUpdateString(String lastUpdateString) {
		this.lastUpdateString = lastUpdateString;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public Integer getMapScaling() {
		return mapScaling;
	}

	public void setMapScaling(Integer mapScaling) {
		this.mapScaling = mapScaling;
	}

}