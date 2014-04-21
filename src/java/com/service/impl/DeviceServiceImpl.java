/*
* @author : karl
* @creation : 2014-3-27 上午12:50:22
* @description : 
*
*/

package com.service.impl;

import java.util.List;

import com.bean.DeviceInfo;
import com.dao.DeviceDao;
import com.service.DeviceService;

public class DeviceServiceImpl implements DeviceService{

	DeviceDao deviceDao;
	
	@Override
	public DeviceInfo get(Integer id) {
		return deviceDao.get(id);
	}

	@Override
	public List<DeviceInfo> list(DeviceInfo deviceInfo) {
		return deviceDao.list(deviceInfo);
	}

	/**
	 * @return the deviceDao
	 */
	public DeviceDao getDeviceDao() {
		return deviceDao;
	}

	/**
	 * @param deviceDao the deviceDao to set
	 */
	public void setDeviceDao(DeviceDao deviceDao) {
		this.deviceDao = deviceDao;
	}

	@Override
	public String add(DeviceInfo deviceInfo) {
		return deviceDao.add(deviceInfo);
	}

	@Override
	public String delete(Integer id) {
		return deviceDao.delete(id);
	}

	@Override
	public String save(DeviceInfo deviceInfo) {
		return deviceDao.save(deviceInfo);
	}

	@Override
	public String update(DeviceInfo deviceInfo) {
		return deviceDao.update(deviceInfo);
	}

	@Override
	public String saveOrUpdate(DeviceInfo deviceInfo) {
		return deviceDao.saveOrUpdate(deviceInfo);
	}

	@Override
	public String getPath(Integer id) {
		return deviceDao.getPath(id);
	}

	@Override
	public List<DeviceInfo> getPathList(Integer id) {
		return deviceDao.getPathList(id);
	}

}
