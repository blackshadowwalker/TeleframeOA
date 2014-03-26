package com.service;

import java.util.List;

import com.base.BaseService;
import com.bean.FileInfo;
import com.bean.UserInfo;

public interface FileService extends BaseService  {
	
	public FileInfo query(int id) throws Exception;
	public List<FileInfo> query(FileInfo fileInfo) throws Exception;
	public FileInfo query(String md5, String sha1) throws Exception;
	
	public String add(FileInfo fileInfo) throws Exception;
	public String beforeAdd() throws Exception;
	public FileInfo beforeUpdate(int id) throws Exception;
	public String update(FileInfo fileInfo) throws Exception;
	public String delete(int id) throws Exception;

}
