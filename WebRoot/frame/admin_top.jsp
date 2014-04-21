<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.bean.UserInfo"  %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>管理页面</title>
	<meta http-equiv=Content-Type content=text/html;charset=utf-8>
	<base target="main">
	<link href="images/skin.css" rel="stylesheet" type="text/css">
	
	<script language=JavaScript>
	function logout(){
		if (confirm("您确定要退出吗？")){
			window.parent.location.href="<%= basePath %>LoginAction?method=logout";
		}
		else{
			return false;
		}
	}
	</script>
	

	<script language=JavaScript1.2>
	function showsubmenu(sid) {
		var whichEl = eval("submenu" + sid);
		var menuTitle = eval("menuTitle" + sid);
		if (whichEl.style.display == "none"){
			eval("submenu" + sid + ".style.display=\"\";");
		}else{
			eval("submenu" + sid + ".style.display=\"none\";");
		}
	}
	</script>
	

</head>

<body leftmargin="0" topmargin="0">

<table width="100%" height="58" border="0" cellpadding="0" cellspacing="0" class="admin_topbg">
	  <tr>
	    <td width="61%" height="34">
	   	 <img src="../images/logo/TeleFrameLogo.png" style="width:150px;heiht:50px;" >
	    </td>
	    <td width="39%" valign="top">
		    <table width="100%" border="0" cellspacing="0" cellpadding="0">
			      <tr  style="height:40px;">
			        <td valign="middle"  height="38" class=""  style="text-align:right; word-break:break-all;color:#fff;font-size:11px;"  >
		        		<img src="<s:property value="#session.user.userPhoto" />" style="width:30;height:25px;" />
			        		您好,<s:property value="#session.user.userName" />
			        		(<s:property value="#session.user.userRoleName" />)
			        		(<s:property value="#session.user.userDepartmentName" />),欢迎使用！
			        		|
			        	<span>
			        		版本:<s:property value="#application['version']"/>
			        	</span>
			        		|
			        	<span>
			        		<a href="HelpAction?" style="color:#fff;">帮助?</a>	
			        	</span>
			        	|
			        	<a href="javascript:logout();" style="color:#fff;">	
			        	安全退出
			        	</a>	
			        	&nbsp;&nbsp;&nbsp;
			        </td> 
			      </tr>
		    </table>
	   </td>
  </tr>
</table>

</body>
</html>
