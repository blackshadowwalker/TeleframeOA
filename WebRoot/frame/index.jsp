<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <link rel="shortcut icon" href="<%=basePath%>images/logo.ico" type="image/x-icon" />
    <title>OA平台</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <frameset rows="60,*,50"  frameborder="yes" border="0" >
	  <frame src="<%=path %>/frame/admin_top.jsp" noresize="noresize" frameborder="0" name="topFrame" scrolling="no" marginwidth="0" marginheight="0" />
	  <frameset cols="182,10,*" name="second" id="second"  id="frame">
		<frame src="<%=path %>/frame/admin_left.jsp" name="leftFrame" noresize="noresize" marginwidth="0" marginheight="0" frameborder="0" scrolling="no" />
		<frame src="<%=path %>/frame/span.jsp" name="span" noresize="noresize" marginwidth="0" marginheight="0" frameborder="0" scrolling="no" />
		<frame src="<%=path %>/frame/admin_right.jsp" name="main" marginwidth="0" marginheight="0" frameborder="0" scrolling="auto" />
	  </frameset>
	  <frame src="<%=path %>/frame/admin_bottom.jsp" frameborder="0" name="bottom" scrolling="no" marginwidth="0" marginheight="0" />
  </frameset>
  <noframes>
  <body></body>
    </noframes>
</html>
