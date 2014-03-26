<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.bean.UserInfo"  %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
UserInfo user = (UserInfo)request.getSession().getAttribute("user");
if(user==null)
	user.setUserName("NULL");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>管理页面</title>

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
<meta http-equiv=Content-Type content=text/html;charset=utf-8>

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
<base target="main">
<link href="images/skin.css" rel="stylesheet" type="text/css">
</head>
<body leftmargin="0" topmargin="0">
<table width="100%" height="64" border="0" cellpadding="0" cellspacing="0" class="admin_topbg">
	  <tr>
	    <td width="61%" height="64"><img src="images/logo.png" ></td>
	    <td width="39%" valign="top">
		    <table width="100%" border="0" cellspacing="0" cellpadding="0">
			      <tr>
			        <td width="74%" height="38" class="admin_txt">
		        		<img src="<s:property value="#session.user.userPhoto" />" style="width:30;height:30px;" />
			        		您好,<s:property value="#session.user.userName" />
			        		(<s:property value="#session.user.userRoleName" />)
			        		(<s:property value="#session.user.userDepartmentName" />),欢迎使用！</td> 
			        <td width="22%"><a href="#" target="_self" onClick="logout();">
			        	<img src="images/out.gif" alt="安全退出" width="46" height="20" border="0"></a>
			        </td>
			        <td width="4%">&nbsp;</td>
			      </tr>
			      <tr>
			        <td height="19" colspan="3">&nbsp;</td>
		      	  </tr>
		    </table>
	   </td>
  </tr>
</table>
</body>
</html>
