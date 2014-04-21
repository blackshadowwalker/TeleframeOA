/*
* @author : karl
* @creation : 2014-3-27 上午12:48:22
* @description : 
*
*/

package com.service;

import java.util.List;

import com.base.BaseService;
import com.bean.DeviceInfo;

public interface DeviceService extends BaseService{
	
	public DeviceInfo get(Integer id);
	public List<DeviceInfo> list(DeviceInfo deviceInfo);
	
	public String saveOrUpdate(DeviceInfo deviceInfo);
	public String save(DeviceInfo deviceInfo);
	public String add(DeviceInfo deviceInfo);
	public String update(DeviceInfo deviceInfo);
	public String delete(Integer id);

	public String getPath(Integer id);
	public List<DeviceInfo> getPathList(Integer id);
	
}
