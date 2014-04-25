<%@ page language="java" import="java.util.*" import="com.bean.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML >
<html>
<head>
  <title></title>
  <!-- 
  <meta http-equiv="refresh" content="3;url=<%=basePath %>" />
   -->
   
  
   
   <style type="text/css">
   		.main{
   			width: 800px;
			margin-left: auto; 
			margin-right: auto;
			margin-top: 20px;
		}
   </style>   
</head>

<body>

	<div class="main" align=center>
		<font color="#ff0" style="font-size:30px" >404! 出错了,您访问的信息不存在</font>
		
		<font color=green >		<a href="javascript:history.back(-1);">返回</a></font>
		<div>
			<script type="text/javascript" src="http://www.qq.com/404/search_children.js" charset="utf-8"></script>
		</div>
	</div>	
	
</body>

</html>
