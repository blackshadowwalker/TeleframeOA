<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>${articleInfo.title} ${msg }</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<style>
		.main{
			width:600px;
			margin-left: auto;
			margin-right: auto;
		}
	</style>

  </head>
  
  <body>
  	<!-- 返回 -->
		<div class="menu-path">
			<a href="javascript:history.go(-1);">
			<img class="goback" src="images/button/back.png" title="返回" style="cursor:pointer "></img></a>
		</div>
	
	<div class=main>
		<center>
			<h2>${articleInfo.title} ${msg } </h2>
		</center>
		<p>
			<span style="float:right;font-size:8px;color:#0000aa">
				作者：	${articleInfo.authorName }  
				&nbsp;&nbsp; 
				发表于 : ${articleInfo.ctTime} 
			</span>
		</p>
		<br/>
		<div style="display:none;">
		<p >
			<center>
			<div style="width:200;height:160px;">
				<img src="${articleInfo.titlePicture }" style="width:100%;height:100%"/>
			</div>
			</center>
		</p>
		</div>
		<p>
			${articleInfo.introduction }
		</p>
		<p>
			${articleInfo.content }
		</p>
	</div>


  </body>
</html>
