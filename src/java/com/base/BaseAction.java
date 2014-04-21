package com.base;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javassist.Modifier;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.bean.RulerInfo;
import com.bean.RulerRole;
import com.bean.Syslog;
import com.bean.UserInfo;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.service.RightService;
import com.service.RulerService;
import com.service.SyslogService;
import com.util.Util;

public abstract class BaseAction extends ActionSupport {

	private static final long serialVersionUID = 1L;

	protected RightService rightService = null;
	protected SyslogService syslogService = null;
	protected RulerService  rulerService = null;

	protected PageBean page=null;

	protected HttpServletRequest request;
	protected HttpServletResponse  response;
	protected ServletContext sc;

	protected String method = null;
	protected String msg="";
	protected String logmsg = "";
	protected Map<String, Object> session = null;
	protected UserInfo user = null;
	protected String str = null;
	protected Integer  id;
	protected String goBackUrl = null;
	protected String target = null;

	protected String sortOrder=null;
	protected String sortField=null;

	List<RulerRole> rulerRoleList = null;
	List<RulerInfo> rulerInfolist = null;
	String rightWord = null;

	protected Syslog syslog = new Syslog();
	private Map<String, Integer> actionMap = null;

	String action =null;
	Boolean  log;

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
		sc = ServletActionContext.getServletContext();

		request.setCharacterEncoding("utf-8");

		msg = "";
		request.setAttribute("faile", "");
		session = ActionContext.getContext().getSession();
		if(page==null)
			page = new PageBean();

		//	this.setGoBackUrl(request.getHeader("Referer"));

		user = (UserInfo) session.get("user");

		//获取访问的方法名称
		method = request.getParameter("method");

		//获取访问的action名称
		Object actionClass = (Object) ActionContext.getContext().get("action");
		if(actionClass!=null)
			action = actionClass.getClass().getSimpleName();

		System.out.println("action="+  action+"?method="+method);
		//LoginAction 或其无需权限访问的Action，可以直接进行处理handle()
		actionMap = (Map<String, Integer>) ServletActionContext.getServletContext().getAttribute("actionMap");
		if(actionMap!=null){
			if(actionMap.get(action)!=null)
				return handle();
		}

		//用户session失效，需要重新登录
		if(user==null)
			return LOGIN;

		this.setGoBackUrl(action);//设置页面返回按钮地址

		//------- 下面的代码是检测用户是否拥有该操作权限和输出操作权限iudv----------
		rulerInfolist = (List<RulerInfo>) session.get("rulerInfolist");//菜单
		rulerRoleList = (List<RulerRole>) session.get("rulerRoleList");//所以权限

		//检查权限和输出操作权限iudv

		syslog.setUser(user);

		String checkRet = this.checkRights(action, method);
		if(checkRet==Util.FAILE)
		{
			msg = "警告：非法操作，请重新登录系统或联系管理员";
			syslog.setContent(action+"?method="+method+","+msg);
			syslogService.log(syslog);
			System.out.println(msg);
			return Util.FAILE;
		}else if(checkRet==Util.NULL){
			System.out.println("Util.NULL");
			return handle();
		}
		if(method==null)
			return handle();

		//reflect 调用Action中的方法
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

		RulerInfo rulerInfo = new RulerInfo();
		rulerInfo.setUrl(action);
		List<RulerInfo> rulerList = rulerService.query(rulerInfo);
		if(rulerList!=null && rulerList.size()>0)
			rulerInfo = rulerList.get(0);

		if(function==null){
			System.out.println("function==null  "+this+".handle()");
			String result = handle();//action.method不存在，交给action去处理
			syslog.setContent("["+rulerInfo.getRulerName()+"]"+this.getLogmsg()+":"+this.getMsg()+",[rulerId="+rulerInfo.getRulerid()+",rulerName="+rulerInfo.getRulerName()+","+
					","+this.getMethod()+","+action+"?method="+method+",url="+""+rulerInfo.getUrl()+"]");
			syslogService.log(syslog);
			return result;
		}

		if(function.getModifiers() == Modifier.PUBLIC || function.getModifiers() == Modifier.PROTECTED){
			if(function.getReturnType()==String.class){
				System.out.println(function.getName()+".invoke("+this+")");
				if(function.getName().endsWith("query")){
					this.setLogmsg("查询");
				}else if(function.getName().endsWith("delete")){
					this.setLogmsg("删除");
				}else if(function.getName().endsWith("add")){
					this.setLogmsg("增加");
				}else if(function.getName().endsWith("update")){
					this.setLogmsg("修改");
				}else if(function.getName().endsWith("view")){
					this.setLogmsg("查看详情");
				}
				Object obj = function.invoke(this);
				if(log!=null && log==false)
				{
					//syslog.setContent(this.getMsg()+","+obj+","+this.getMethod()+","+action+"?method="+method+","+function.getName()+".invoke("+this+")"+","+rulerInfo.toString());
					syslog.setContent("["+rulerInfo.getRulerName()+"]"+this.getLogmsg()+":"+this.getMsg()+",[rulerId="+rulerInfo.getRulerid()+",rulerName="+rulerInfo.getRulerName()+","+
							","+this.getMethod()+","+action+"?method="+method+",url="+""+rulerInfo.getUrl()+"]");
					if( ! ( rulerInfo.getUrl().startsWith("SyslogAction") || rulerInfo.getUrl().startsWith("/SyslogAction")) )
						syslogService.log(syslog);
				}
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
			if(rulerInfolist.get(i).getUrl().startsWith(actionName) || rulerInfolist.get(i).getUrl().startsWith("/"+actionName)){
				actionID = rulerInfolist.get(i).getRulerid();
				break;
			}
		}
		if(actionID <1 )
			return null;

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

	//通过页面id获取当前用户对当前页面的权限
	String checkRights(String actionName, String methodName)
	{
		if(rulerRoleList==null || rulerInfolist==null){
			return Util.FAILE;
		}
		rightWord = getRightWord(actionName);
		if(rightWord==null){
			//权限中不存在此action
			try {
				//如果数据库中存在此Action，则用户没有该权限，否则表面有该权限，
				//如LoginAction存在但没有在数据库中，任何用户用户该权限
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
				if(rulerInfolist.get(i).getUrl().startsWith(actionName) || rulerInfolist.get(i).getUrl().startsWith("/"+actionName)){
					request.setAttribute("u", rightWord.indexOf("u"));
					request.setAttribute("v", rightWord.indexOf("v"));
					request.setAttribute("i", rightWord.indexOf("i"));
					request.setAttribute("d", rightWord.indexOf("d"));

					return Util.SUCCESS;
				}
			}

			return Util.FAILE;
		}
		else{
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
	public void setId(Integer id) {
		this.id = id;
	}
	public void setId(String id) {
		if(id==null || id.trim().isEmpty())
			this.id = (null);
		else
			this.id = Integer.parseInt(id);
	}
	public String getTarget() {
		return target;
	}
	public void setTarget(String target) {
		this.target = target;
	}
	public SyslogService getSyslogService() {
		return syslogService;
	}
	public void setSyslogService(SyslogService syslogService) {
		this.syslogService = syslogService;
	}
	public RulerService getRulerService() {
		return rulerService;
	}
	public void setRulerService(RulerService rulerService) {
		this.rulerService = rulerService;
	}
	public String getLogmsg() {
		return logmsg;
	}
	public void addLogmsg(String logmsg) {
		this.logmsg += logmsg;
	}
	public void setLogmsg(String logmsg) {
		this.logmsg = logmsg;
	}
	/**
	 * @return the page
	 */
	public PageBean getPage() {
		return page;
	}
	/**
	 * @param page the page to set
	 */
	public void setPage(PageBean page) {
		this.page = page;
	}
	public Boolean getLog() {
		return log;
	}
	public void setLog(Boolean log) {
		this.log = log;
	}


}