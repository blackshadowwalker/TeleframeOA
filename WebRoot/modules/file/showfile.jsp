<%@ page language="java" import="java.util.*" import="com.bean.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <title></title>
   <style type="text/css">
   		.main{
   			width: 100%;
   			height: 100%;
			margin-left: auto; 
			margin-right: auto;
		}
   </style>   
   <script>
   
   </script>
</head>

<body>
	<div >
		<div>
			<a href="javascript:history.go(-1);"><img src="images/button/back.png" title="返回" style="cursor:pointer "></img></a>
		</div>
		<center>
		<h2>${fileInfo.fileName}</h2>
		</center>
	</div>
	<div class="main" align=center >
		<iframe src="${fileInfo.path}" style="width:100%; height:100%;border:0px;"></iframe>
	</div>	
	
</body>

</html>
