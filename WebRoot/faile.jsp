<%@ page language="java" import="java.util.*" import="com.bean.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
//UserInfo userInfo=(UserInfo)request.getSession().getAttribute("user");
//if(userInfo!=null) System.out.println("1234567890-="+userInfo.getUserName());
//String name=userInfo.getUserName();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <title></title>
  <!-- 
  <meta http-equiv="refresh" content="3;url=<%=basePath %>" />
   -->
   <style type="text/css">
   		.main{
   			width: 500px;
			margin-left: auto; 
			margin-right: auto;
			margin-top: 150px;
		}
   </style>   
   <script>
   		var msg = "${msg}";
   		if(msg!="null" && msg!="")
   			alert(msg);
   </script>
</head>

<body>

	<div class="main" align=center>
		<font color=red style="font-size:30px" >${msg}</font>
		<font color=green >		<a href="<%=path %>">返回</a></font>
	</div>	
	
</body>

</html>
