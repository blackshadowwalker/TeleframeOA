package com.base;

import java.lang.reflect.Method;
import java.util.List;
import java.util.Map;

import javassist.Modifier;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.bean.RulerInfo;
import com.bean.RulerRole;
import com.bean.UserInfo;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.service.RightService;
import com.util.Util;

public abstract class BaseAction extends ActionSupport {

	private static final long serialVersionUID = 1L;

	protected HttpServletRequest request;
	protected HttpServletResponse  response;
	protected String method = null;
	protected RightService rightService = null;
	protected String msg="";
	protected Map<String, Object> session = null;
	protected UserInfo user = null;
	protected Integer	page = 0;
	protected String str = null;
	protected Integer  id;
	protected String goBackUrl = null;
	protected String target = null;

	protected Integer pageIndex = 0;
	protected Integer pageSize=0;
	protected String sortOrder=null;
	protected String sortField=null;

	List<RulerRole> rulerRoleList = null;
	List<RulerInfo> rulerInfolist = null;
	String rightWord = null;

	String action =null;

	// override functions for standard
	public abstract String handle() throws Exception;
	public abstract String query() throws Exception;
	public abstract String beforeAdd() throws Exception;
	public abstract String add() throws Exception;
	public abstract String beforeUpdate() throws Exception;
	public abstract String update() throws Exception;
	public abstract String delete() throws Exception;
	public abstract String view() throws Exception;
	public abstract boolean validate(Object obj) throws Exception;

	@Override
	public String execute() throws Exception {

		request = ServletActionContext.getRequest();
		response = ServletActionContext.getResponse();
		request.setCharacterEncoding("utf-8");

		msg = "";
		request.setAttribute("faile", "");
		session = ActionContext.getContext().getSession();

	//	this.setGoBackUrl(request.getHeader("Referer"));

		user = (UserInfo) session.get("user");

		method = request.getParameter("method");

		Object actionClass = (Object) ActionContext.getContext().get("action");
		if(actionClass!=null)
			action = actionClass.getClass().getSimpleName();

		System.out.println("action="+  action+"?method="+method);
		if(action.endsWith("LoginAction") || action.endsWith("UploadAction") 
				||  action.endsWith("VehicleAction")){//LoginAction 或其他公共访问的权限
			return handle();
		}
		//----- 截至以上代码是 登录、退出等操作 -------------
		if(user==null)
			return LOGIN;
		
		this.setGoBackUrl(action);

		//------- 下面的代码是检测用户是否拥有该操作权限和输出操作权限iudv----------
		rulerInfolist = (List<RulerInfo>) session.get("rulerInfolist");//菜单
		rulerRoleList = (List<RulerRole>) session.get("rulerRoleList");//所以权限

		//检查权限和输出操作权限iudv
		String checkRet = this.checkRights(action, method);
		if(checkRet==Util.FAILE)
		{
			msg = "警告：非法操作，请重新登录系统或联系管理员";
			System.out.println(msg);
			return Util.FAILE;
		}else if(checkRet==Util.NULL){
			System.out.println("Util.NULL");
			return handle();
		}
		if(method==null)
			return handle();

		//reflect
		Method function = null;
		try{
			function = this.getClass().getDeclaredMethod(method);
		}catch(NoSuchMethodException ne){
			function = null;
		}catch(SecurityException se){
			function = null;
		}catch(Exception e){
			function = null;
		}
		if(function==null){
			System.out.println("function==null  "+this+".handle()");
			return handle();
		}
		
		if(function.getModifiers() == Modifier.PUBLIC || function.getModifiers() == Modifier.PROTECTED){
			if(function.getReturnType()==String.class){
				System.out.println(function.getName()+".invoke("+this+")");
				Object obj = function.invoke(this);
				System.out.println(obj);
				return  (String) obj;
			}else{
				function.invoke(this.getClass());
				return Util.NONE;
			}
		}else
			return handle();

	}

	String getRightWord(String actionName){
		//根据actionName获取actionID
		int actionID = 0;
		for(int i=0; i<rulerInfolist.size(); i++){
			if(rulerInfolist.get(i).getUrl().startsWith("/"+actionName))
				actionID = rulerInfolist.get(i).getRulerid();
		}
		if(actionID <1 )
			return null;

		request.setAttribute("r_id", actionID);
		request.getSession().setAttribute("r_id", actionID);

		//根据actionID获取rightWord
		String rightWord = null;
		for(int i=0; i<rulerRoleList.size(); i++){
			if(rulerRoleList.get(i).getRulerId() == actionID){
				rightWord = rulerRoleList.get(i).getRulerWord();
				break;
			}
		}
		return rightWord;
	}

	String checkRights(String actionName, String methodName)
	{
		if(rulerRoleList==null || rulerInfolist==null){
			return Util.FAILE;
		}
		rightWord = getRightWord(actionName);
		if(rightWord==null){
			//权限中不存在此action
			try {
				//如果数据库中存在此Action，则用户没有该权限，否则表面有该权限，如LoginAction存在但没有在数据库中，任何用户用户该权限
				if(rightService.checkAction(actionName, methodName, user.getUserRole())==Util.SUCCESS)
					return Util.FAILE;
				else
					return Util.SUCCESS;
			} catch (Exception e) {
				e.printStackTrace();
			}
			return Util.FAILE;
		}

		//点击菜单默认执行查询操作
		if(methodName==null || methodName.endsWith("query")){ // 菜单权限
			for(int i=0; i<rulerInfolist.size(); i++){
				//判断权限是否运行执行(存在)此action
				if(rulerInfolist.get(i).getUrl().startsWith("/"+actionName)){
					request.setAttribute("u", rightWord.indexOf("u"));
					request.setAttribute("v", rightWord.indexOf("v"));
					request.setAttribute("i", rightWord.indexOf("i"));
					request.setAttribute("d", rightWord.indexOf("d"));

					return Util.SUCCESS;
				}
			}

			return Util.FAILE;
		}

		//对于非query操作(update/delete/add)进行检查是否音乐次全新
		char ch = 'v';
		if(methodName.endsWith("beforeAdd") || methodName.endsWith("add"))
			ch = 'i';
		else if(methodName.endsWith("beforeUpdate") || methodName.endsWith("update") )
			ch = 'u';
		else  if(methodName.endsWith("delete") )
			ch = 'd';
		else  if(methodName.endsWith("view") )
			ch = 'v';

		if(rightWord.indexOf(ch)>=0)
			return Util.SUCCESS;
		else
			return Util.FAILE;
	}




	public RightService getRightService() {
		return rightService;
	}

	public void setRightService(RightService rightService) {
		this.rightService = rightService;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}

	public String getGoBackUrl() {
		return goBackUrl;
	}
	public void setGoBackUrl(String url) {
		if(url==null || url.isEmpty())
			goBackUrl = "javascript:history.go(-1)";
		else
			this.goBackUrl = url;
		System.out.println("goBackUrl="+goBackUrl);
	}
	public Integer getPageIndex() {
		return pageIndex;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageIndex(Integer pageIndex) {
		this.pageIndex = pageIndex;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public String getSortOrder() {
		return sortOrder;
	}
	public void setSortOrder(String sortOrder) {
		this.sortOrder = sortOrder;
	}
	public String getSortField() {
		return sortField;
	}
	public void setSortField(String sortField) {
		this.sortField = sortField;
	}
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
	public Integer getPage() {
		return page;
	}
	public Integer getId() {
		return id;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public void setId(String id) {
		this.id = Integer.parseInt(id);
	}
	public String getTarget() {
		return target;
	}
	public void setTarget(String target) {
		this.target = target;
	}


}