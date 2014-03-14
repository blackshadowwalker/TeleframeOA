package com.service.impl;

import java.util.List;

import com.bean.FileInfo;
import com.dao.FileDao;
import com.service.FileService;

public class FileServiceImpl implements FileService{

	FileDao fileDao;
	
	@Override
	public FileInfo query(int id) throws Exception {
		return fileDao.query(id);
	}
	
	@Override
	public List<FileInfo> query(FileInfo fileInfo) throws Exception {
		if(fileInfo!=null)
			return fileDao.query(fileInfo.getFileName());
		else
			return fileDao.query(null);
	}
	@Override
	public FileInfo query(String md5, String sha1) throws Exception {
		return fileDao.query(md5, sha1);
	}
	
	@Override
	public String add(FileInfo fileInfo) throws Exception {
		return fileDao.add(fileInfo);
	}
	@Override
	public String beforeAdd() throws Exception {
		return null;
	}
	@Override
	public FileInfo beforeUpdate(int id) throws Exception {
		return fileDao.beforeUpdate(id);
	}
	@Override
	public String delete(int id) throws Exception {
		return fileDao.delete(id);
	}
	@Override
	public String update(FileInfo fileInfo) throws Exception {
		return fileDao.update(fileInfo);
	}
	public FileDao getFileDao() {
		return fileDao;
	}
	public void setFileDao(FileDao fileDao) {
		this.fileDao = fileDao;
	}
	


}
