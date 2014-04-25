package com.action.system;

import java.util.ArrayList;
import java.util.List;

import com.base.BaseAction;
import com.bean.RulerInfo;
import com.bean.RulerRole;
import com.bean.UserInfo;
import com.service.LoginService;
import com.service.RulerService;
import com.service.UserService;
import com.util.Util;

public class LoginAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	protected UserService userService;
	
	protected String RedirectUrl ;//after login redirect to this url
	Integer flag;
	
	@Override
	public String handle() throws Exception {
		String retMapping = Util.NONE;
		
		UserInfo u = (UserInfo) session.get("user");
		if(flag!=null && flag==1 && u!=null){
			user = u;
			
			//登录成功，返回指定页面
			if( RedirectUrl !=null && !RedirectUrl.isEmpty() ){
				response.sendRedirect(RedirectUrl);
				return Util.NONE;
			}
			return Util.SUCCESS;
		}
		
		if(method==null)
			return Util.LOGIN;
		if (method.equals("login")) {
			retMapping = login();
		}
		if (method.equals("logout")) {
			retMapping = logout();
		}
		
		return retMapping;
	}

	public String logout() {
		session.clear();
		return LOGIN;
	}

	/**
	 *  登录系统，获取所有权限和操作菜单，并存入session
	 * @return 
	 * @throws Exception
	 */
	public String login() throws Exception {

		List<Integer>  list =  new ArrayList<Integer>() ;
		List<RulerRole> rulerRoleList = null;
		List<RulerInfo> rulerInfolist = null;
		 
	    String ip = this.getIp();
		
	    if (user == null) {
	    	System.out.println("来自 IP="+ip + " 的用户请求登录");
			return LOGIN; // 浏览器输入 http://127.0.0.1/oa/LoginAction?method=login 返回空操作和空消息
		}
	    
	    if(user.getUserCode()==null || user.getUserCode().trim().isEmpty()){
	    	msg = "用户编号不能为空";
	    	return Util.LOGIN;
	    }
	    if(user.getUserPasswd()==null || user.getUserPasswd().trim().isEmpty()){
	    	msg = "密码不能为空";
	    	return Util.LOGIN;
	    }
		
		UserInfo userCheck = loginService.login(user, ip);
		if (userCheck == null) {
			msg = "用户名或密码错误";
			System.out.println(msg);
			return Util.LOGIN;
		} else {
			user = userService.get(userCheck.getUserId());
			user.setIp(ip);
			Integer roleId = user.getUserRole();//获取角色id
			rulerRoleList = rulerService.rulerRole(roleId);//获取所有权限
			if(rulerRoleList==null ){
				msg  = "您没有任何权限，如有疑问，请联系管理员";
				System.out.println(msg);
				return Util.LOGIN;
			}
			//获取所有权限
			System.out.println("-----------获取所有权限----------------");
			for(int i=0; i<rulerRoleList.size(); i++){
				list.add(rulerRoleList.get(i).getRulerId());//ruler id
				System.out.println(rulerRoleList.get(i).getRulerId()+"="+rulerRoleList.get(i).getRulerWord());
			}
			rulerInfolist = (List<RulerInfo>) rulerService.queryRulerList(list);//根据权限ID(ruler id)获取对应的菜单
			session.put("user", user);
			session.put("rulerRoleList", rulerRoleList);//所有权限
			session.put("rulerInfolist", rulerInfolist);//菜单
			//获取所有显示的菜单
			System.out.println("-----------获取所有显示的菜单----------------");
			for(int i=0; i<rulerInfolist.size(); i++)
				System.out.println(rulerInfolist.get(i).getRulerid()+": "+rulerInfolist.get(i).getRulerName()+"="+rulerInfolist.get(i).getUrl());
			System.out.println("-----------END----------------");
			
			//登录成功，返回指定页面
			if( RedirectUrl !=null && !RedirectUrl.isEmpty() ){
				response.sendRedirect(RedirectUrl);
				return Util.NONE;
			}
			
			return Util.SUCCESS;
		}
	}
	
	public String getIp(){
		String ip = request.getHeader("x-forwarded-for");  
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	        ip = request.getHeader("Proxy-Client-IP");  
	    }  
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	        ip = request.getHeader("WL-Proxy-Client-IP");  
	    }  
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	        ip = request.getRemoteAddr();  
	    } 
	    return ip;
	}

	LoginService loginService;
	RulerService rulerService;
	UserInfo user;
	RulerInfo ruInfo;

	public LoginService getLoginService() {
		return loginService;
	}

	public void setLoginService(LoginService loginService) {
		this.loginService = loginService;
	}

	public RulerService getRulerService() {
		return rulerService;
	}

	public void setRulerService(RulerService rulerService) {
		this.rulerService = rulerService;
	}

	public RulerInfo getRuInfo() {
		return ruInfo;
	}

	public void setRuInfo(RulerInfo ruInfo) {
		this.ruInfo = ruInfo;
	}

	public UserInfo getUser() {
		return user;
	}

	public void setUser(UserInfo user) {
		this.user = user;
	}

	@Override
	public String add() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String beforeAdd() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String beforeUpdate() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String delete() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String query() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String update() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String view() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean validate(Object obj) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	/**
	 * @return the redirectUrl
	 */
	public String getRedirectUrl() {
		return RedirectUrl;
	}

	/**
	 * @param redirectUrl the redirectUrl to set
	 */
	public void setRedirectUrl(String redirectUrl) {
		RedirectUrl = redirectUrl;
	}

	public Integer getFlag() {
		return flag;
	}

	public void setFlag(Integer flag) {
		this.flag = flag;
	}

}
