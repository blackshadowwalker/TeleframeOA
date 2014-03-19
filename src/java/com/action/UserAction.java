package com.action;

import java.io.File;
import java.lang.reflect.Method;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.struts2.ServletActionContext;

import com.base.BaseAction;
import com.bean.FileInfo;
import com.bean.UserInfo;
import com.service.FileService;
import com.service.UserService;
import com.util.EncoderHandler;
import com.util.Util;

public class UserAction extends BaseAction {

	private static final long serialVersionUID = 1L;

	protected File photoFile=null;
	private FileService fileService;

	@Override
	public String handle() throws Exception {

		if(method==null ){
			return query();
		}

		return Util.NONE;
	}

	public String delete() throws Exception {
		userService.delete(id);
		userInfo=null;
		return query();
	}

	public String update() throws Exception {
		request.setAttribute("RulerAndRolerList", userService.beforeAdd());
		if(userInfo==null)
			return query();
		boolean bChangePassword =  ! userInfo.getUserPasswd().trim().isEmpty();
		if( !bChangePassword)
			userInfo.setUserPasswd("123456");
		userInfo.setUserName("123456");
		if( !this.validate(null))
			return Util.UPDATE;
		if( !bChangePassword)
			userInfo.setUserPasswd("");
		userInfo.setUserName(null);

		/*
		//保存用户头像
		if(photoFile!=null){
			String md5  = EncoderHandler.FileMD5(photoFile);
			String sha1 = EncoderHandler.FileSHA1(photoFile);
			FileInfo fileInfo = fileService.query(md5, sha1);
			fileInfo!=null){
				userInfo.setUserPhoto(fileInfo.getPath());
			}else{
				
			}
				
		}*/
		
		System.out.println("用户头像:"+userInfo.getUserPhoto());

		String result = userService.update(userInfo);
		if(result.endsWith(Util.SUCCESS)){
			msg = "修改成功";
			userInfo=null;
			return query();
		}else{
			msg = "修改失败";
			return Util.UPDATE;
		}

	}

	public String beforeUpdate() throws Exception {
		request.setAttribute("RulerAndRolerList", userService.beforeAdd());
		if(id==null)
			id=Integer.parseInt(request.getParameter("userInfo.userId"));
		if(id==null)
			return Util.ERROR;

		userInfo=userService.beforeUpdate(id);
		userInfo.setUserPasswd("");
		if(userInfo==null)
			return Util.ERROR;
		else 
			return Util.UPDATE;
	}

	public static void main(String args[]){
		String str = "￥#%%";

		String regx="!|！|@|◎|#|＃|(\\$)|￥|%|％|(\\^)|……|(\\&)|※|(\\*)|×|(\\()|（|(\\))|）|_|——|(\\+)|＋|(\\|)|§";

		Pattern p = Pattern.compile(regx, Pattern.CASE_INSENSITIVE);
		Matcher m = p.matcher(str);

		System.out.println(  m.find());


	}

	public boolean validate(Object obj) throws Exception{
		if(userInfo==null)
			return false;
		boolean ret = true;

		//检查输入的数据中是否有特殊字符
		String regx="!|！|@|◎|#|＃|(\\$)|￥|%|％|(\\^)|……|(\\&)|※|(\\*)|×|(\\()|（|(\\))|）|_|——|(\\+)|＋|(\\|)|§";
		Pattern p = Pattern.compile(regx, Pattern.CASE_INSENSITIVE);
		//java正则表达式大全   : http://jingyan.baidu.com/article/54b6b9c038b84f2d583b47f7.html

		//验证用户名
		if(userInfo.getUserName()==null || userInfo.getUserName().trim().isEmpty()){
			this.addFieldError("userInfo.userName", "用户名不能为空");
			ret = false;
		}
		//else if ( ! Pattern.matches("^[a-zA-Z]/w{5,17}$", userInfo.getUserName())  || !Pattern.matches("[\u4e00-\u9fa5]", userInfo.getUserName())){
		else if(  p.matcher(userInfo.getUserName()).find() || userInfo.getUserName().length()<2 ){

			//验证用户密码："^[a-zA-Z]/w{5,17}$"正确格式为：以字母开头^[a-zA-Z]，长度在6~18之间{5,17}，只能包含字符、数字和下划线/w。
			//只能输入汉字："^[\u4e00-\u9fa5]{0,}$"
			//匹配中文字符的正则表达式： [\u4e00-\u9fa5]
			this.addFieldError("userInfo.userName", "用户名格式不正确");
			ret = false;
		}

		//验证密码
		if(userInfo.getUserPasswd()==null || userInfo.getUserPasswd().trim().isEmpty()){
			this.addFieldError("userInfo.userPasswd", "密码不能为空");
			ret = false;
		}else if (  p.matcher(userInfo.getUserPasswd()).find() || userInfo.getUserPasswd().length()<6 ){
			//验证用户密码："^[a-zA-Z]/w{5,17}$"正确格式为：以字母开头^[a-zA-Z]，长度在6~18之间{5,17}，只能包含字符、数字和下划线/w。
			this.addFieldError("userInfo.userPasswd", "密码格式不正确");
			ret = false;
		}

		//验证Email地址："^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$"。

		return ret;
	}

	public String add() throws Exception {
		request.setAttribute("RulerAndRolerList", userService.beforeAdd());

		//		if( this.getFieldErrors().size()>0)
		//			return Util.ADD;
		if( ! this.validate(null) )
			return Util.ADD;

		System.out.println("UserAction add() size="+this.getFieldErrors().size());
		String result=userService.add(userInfo);
		userInfo.setUserPasswd("");
		if(result.equals(Util.SUCCESS)){
			msg = "添加成功";
			userInfo.setUserName("");
		}else if(result.endsWith(Util.EXIST)){
			msg = "添加失败，用户已存在";
		}else
			msg = "添加失败";
		return Util.ADD;
	}

	public String beforeAdd() throws Exception {
		//获取部门列表和角色列表
		request.setAttribute("RulerAndRolerList", userService.beforeAdd());
		return Util.ADD;
	}

	public String query() throws Exception {
		list=userService.query(userInfo);
		return Util.LIST;
	}

	UserService userService;
	List<UserInfo> list;
	UserInfo userInfo;

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public List<UserInfo> getList() {
		return list;
	}

	public void setList(List<UserInfo> list) {
		this.list = list;
	}

	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

	@Override
	public String view() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public File getPhotoFile() {
		return photoFile;
	}

	public void setPhotoFile(File photoFile) {
		this.photoFile = photoFile;
	}

	public FileService getFileService() {
		return fileService;
	}

	public void setFileService(FileService fileService) {
		this.fileService = fileService;
	}


}	
