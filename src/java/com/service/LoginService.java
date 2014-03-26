package com.service;

import com.base.BaseService;
import com.bean.UserInfo;


public interface LoginService extends BaseService {
	public UserInfo login(UserInfo user,String ip) throws Exception;
}
