package com.action.system;

import java.io.File;
import java.lang.reflect.Method;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import net.sf.json.JSONObject;

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
	public String person() throws Exception{
		if(request.getParameter("save")==null){
			//	userInfo= user;//userService.beforeUpdate(id);
			userInfo = userService.get(user.getUserId());
			userInfo.setUserPasswd("");
			return Util.PERSON;
		}else{
			UserInfo userTemp = userInfo;
			userInfo = userService.get(user.getUserId());
			if( userTemp.getUserPasswd()!=null && !userTemp.getUserPasswd().trim().isEmpty()) 
			{
				userTemp.setUserPasswd(userTemp.getUserPasswd().trim());
				if(userTemp.getUserPasswd().length()<5){
					this.addFieldError("userInfo.userPasswd", "密码至少6位");
					return Util.PERSON;
				}else{
					userInfo.setUserPasswd(userTemp.getUserPasswd());
				}
			}
			if(userTemp.getUserName()!=null && !userTemp.getUserName().trim().isEmpty())
				userInfo.setUserName(userTemp.getUserName());//用户名
			if(userTemp.getUserBirth()!=null )
				userInfo.setUserBirth(userTemp.getUserBirth());//用户生日
			if(userTemp.getUserPhoto()!=null && userTemp.getUserPhoto().trim().length()>3)
				userInfo.setUserPhoto(userTemp.getUserPhoto());//用户头像
			String result = userService.update(userInfo);
			if(result!=null && result.endsWith(Util.SUCCESS)){
				this.setMsg("修改成功");
				this.setLogmsg("修改个人信息["+ userInfo.getUserCode()+"="+userInfo.getUserName()+"]成功");
				this.request.setAttribute("error", 1);
				user = userInfo;
				session.put("user", user);
			}else{
				this.setMsg("修改失败 ");
				this.setLogmsg("修改个人信息["+ userInfo.getUserCode()+"="+userInfo.getUserName()+"]失败");
			}
			return Util.PERSON;
		}
	}

	public String delete() throws Exception {
		userInfo = userService.get(id);
		if(userInfo!=null && userService.delete(id)==Util.SUCCESS)
			this.setLogmsg("删除用户["+ userInfo.getUserCode()+"="+userInfo.getUserName()+"]成功");
		userInfo = null;
		return query();
	}

	public String update() throws Exception {
		request.setAttribute("RulerAndRolerList", userService.beforeAdd());
		if(userInfo==null)
			return query();

		if( !this.validate(null)){
			return Util.UPDATE;
		}

		this.setLogmsg("修改用户信息：["+ userInfo.getUserCode()+"="+userInfo.getUserName()+"]");

		if(userInfo.getUserId()==null)
			userInfo.setUserId(id);
		if(userInfo.getUserId()==null || userInfo.getUserId()<0)
			return Util.ERROR;

		String result = userService.update(userInfo);
		if(result.endsWith(Util.SUCCESS)){
			msg = "修改成功";
			userInfo=null;
			this.addLogmsg("->["+JSONObject.fromObject(userInfo)+"]"+this.getMsg());
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
		else {
			session.put("userId", id);
			return Util.UPDATE;
		}
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
		if( userInfo.getUserPasswd()!=null && !userInfo.getUserPasswd().trim().isEmpty()) 
		{
			if (  p.matcher(userInfo.getUserPasswd()).find() || userInfo.getUserPasswd().length()<6 ){
				//验证用户密码："^[a-zA-Z]/w{5,17}$"正确格式为：以字母开头^[a-zA-Z]，长度在6~18之间{5,17}，只能包含字符、数字和下划线/w。
				this.addFieldError("userInfo.userPasswd", "密码格式不正确");
				ret = false;
			}
		}

		//验证Email地址："^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$"。

		return ret;
	}

	public String add() throws Exception {
		request.setAttribute("RulerAndRolerList", userService.beforeAdd());

		//验证用户编号
		if(userInfo.getUserCode()==null || userInfo.getUserCode().trim().isEmpty())
		{
			this.addFieldError("userInfo.userCode", "用户编号不能为空");
			return Util.ADD;
		}
		
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
			this.addFieldError("userInfo.userCode", msg);
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
