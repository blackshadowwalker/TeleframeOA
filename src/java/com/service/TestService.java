package com.service;

import java.util.List;

import com.base.BaseService;
import com.bean.TSNvr;

public interface TestService extends BaseService {
	public abstract List<TSNvr> queryNvr(); 
	public abstract TSNvr getById(int id);
}
