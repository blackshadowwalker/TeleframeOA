<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML >
<html>
  <head>
    <base href="<%=basePath%>">
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1";/><!-- IE的渲染模式 -->
    
    <title> ${articleInfo.title} ${msg }  </title>
    
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link href="bootstrap/3/css/bootstrap.css" rel="stylesheet"/>
	<link href="index/css/justified-nav.css" rel="stylesheet">
	<link href="index/css/style.css" rel="stylesheet" >

	<script src="scripts/jquery/jquery-1.7.min.js"></script>
	<script src="bootstrap/3/js/bootstrap.min.js"></script>
	<link href="bootstrap/3/css/datepicker.css" rel="stylesheet"/>
	<script src="bootstrap/3/js/bootstrap-datepicker.js"></script>
	
	<script src="index/js/index.js" type="text/javascript"></script>
	
	<style>
	</style>
	
  </head>
  
  <body>
   	
   	  <input type="hidden" name="action" value="index/about.jsp"> 
   
      <div class="pagetop">
      	 	<%@ include file="../../../index/top.jsp" %>
      </div>

      <div class="nav container"  style="width:1000px;">
       	 <%@ include file="../../../index/nav.jsp" %>
      </div>
      
      <div class="container" style="margin-top:10px;padding-left:0px;width:1000px;">
	   	 <div class="panel panel-info">
		   	  <div class="panel-heading">
		   	  			<a href="javascript:history.go(-1);">
									<img class="goback" src="images/button/back.png" title="返回" style="cursor:pointer "></img></a>
		   	  </div>
		   	   <div class="panel-body">
	   	   			 <div class=main>
							<center>
								<h3>${articleInfo.title} ${msg } </h3>
							</center>
							<p>
								<span style="float:right;font-size:11px;color:#0000aa">
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


		   	   </div>
		</div>
  	 </div>	
  	
  	 <div class="booter container" style="width:1000px;">
	   	<%@ include file="../../../index/booter.jsp" %>
     </div>
	
		<script>
	    	$(document).ready(function(){
	    		// todo ...
	    	});
	    </script>
		

  </body>
</html>


