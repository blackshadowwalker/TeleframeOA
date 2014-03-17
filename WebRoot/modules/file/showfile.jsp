<%@ page language="java" import="java.util.*" import="com.bean.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%
String thisPath = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+thisPath+"/";

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <title></title>
   <style type="text/css">
   		body{
 			background-color: #FAFAFA;
 		}
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

	<div  style="margin-top:5px;">
		<span>
				<center>
					<h3>${fileInfo.fileName}</h3>
				</center>
		</span>
	</div>
	<span style="position: absolute;left:10;top:10px;">
			<a href="javascript:history.go(-1);">
				<img src="<%=thisPath %>/images/button/back.png" title="返回" style="cursor:pointer "></img>
			</a>
	</span>
	<span style="position: absolute;right:20px;top:10px;font-size:9px;">
		显示方式：
		<select id="showFrame" onchange="showFrameChange(this)" >
			<option value="main">默认</option>
			<option value="_blank">新窗口</option>
		</select>
	</span>
	
	
	<hr/>
	
	<div class="main" align=center >
		<iframe src="${fileInfo.path}" style="width:100%; height:100%;border:0px;"></iframe>
	</div>	
	
	<script>
		var target="<%=request.getParameter("target") %>";
		if(target!="null" && target!=""){
			window.open(window.href, target);
		}
		function showFrameChange(obj){
			window.open(window.location.href, obj.value);
		}
	
	</script>
	
</body>

</html>
