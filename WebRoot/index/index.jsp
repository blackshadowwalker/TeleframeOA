<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html >
<html>
  <head>
    <base href="<%=basePath%>">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1";/><!-- IE的渲染模式 -->
    
    <title> <s:property value="#application.config.title" /> </title>
    
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" href="css/common.css" type="text/css" media="all"/>
	
	<link href="bootstrap/3/css/bootstrap.css" rel="stylesheet"/>
	<link href="index/css/justified-nav.css" rel="stylesheet">
	<link href="index/css/style.css" rel="stylesheet" >
	
	<script src="scripts/jquery/jquery-1.7.min.js"></script>
	<script src="bootstrap/3/js/bootstrap.min.js"></script>
	<script src="index/js/index.js" type="text/javascript"></script>
	
	 <script>

     </script>
     
	<style>
		
	</style>

  </head>
  
  <body>
  	 <input type="hidden" name="action" value="${action}"> 
  	 
  	 <div class="" >
       <div name="pagetop" class="pagetop">
       	 	<%@ include file="top.jsp" %>
       </div>
       

       <div name="nav" class="nav container"  style="width:1000px;">
	       	  <%@ include file="nav.jsp" %>
       </div>
		
	   <br/>
		
	   <div name="content" class="content container" style="width:1000px;padding-left:0px;">
	   	 <div class="row">
	   	 	<div class="">
	   			<div class="col-xs-4"  name="content-left">
	   				<div class="panel panel-success" name="lastest-news" >
					   	  <div class="panel-heading">
					   	  		<center> 最新动态</center>
					   	  </div>
					   	   <div class="panel-body">
					   	   		最新动态
					   	   </div>
					</div>
	   				<div class="panel panel-warning">
					   	  <div class="panel-heading">
					   	  		<center>通知公告</center>
					   	  </div>
					   	   <div class="panel-body">
					   	   
					   	   </div>
					</div>
	   				
	   				<div class="panel panel-warning">
					   	  <div class="panel-heading">
					   	  		<center>文件下载</center>
					   	  </div>
					   	   <div class="panel-body">
					   	   
					   	   </div>
					</div>
					
	   			</div><!-- end of content-left -->
	   			
	   			
	   			<div class="col-xs-8" name="content-right">
	   			
	   			  <div class="row" name="carousel" style="padding-right:15px;" > 
	   				<div class="panel panel-warning">
					   	   <div class="panel-body">
					   	   			<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
									  <!-- Indicators -->
									  <ol class="carousel-indicators">
									    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
									    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
									    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
									  </ol>
									
									  <!-- Wrapper for slides -->
									  <div class="carousel-inner">
										    <div class="item active">
										      <img src="index/images/vlpr.png" alt="车辆识别">
										      <div class="carousel-caption">
										        	车辆识别
										      </div>
										    </div>
										    <div class="item">
										      <img src="index/images/its_sps.png" alt="家庭安防保卫">
										      <div class="carousel-caption">
										        	家庭安防保卫
										      </div>
										    </div>
										    <div class="item">
										      <img src="index/images/tfMobileAuth.png" alt="金融认证">
										      <div class="carousel-caption">
										       		金融认证
										      </div>
										    </div>
									  </div>
									
									  <!-- Controls -->
									  <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
									    <span class="glyphicon glyphicon-chevron-left"></span>
									  </a>
									  <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
									    <span class="glyphicon glyphicon-chevron-right"></span>
									  </a>
									</div>
					   	   </div>
					</div>
				  </div><!-- end of row carousel -->
				  
				  <div class="row" name="content-right-more">
				  	 <div class="col-xs-6">
				  		<div class="panel panel-info" name="regulation-filed" style="height:200px;" >
						   	  <div class="panel-heading">
						   	  		<center>行政规章制度</center>
						   	  </div>
						   	   <div class="panel-body">
						   	   
						   	   </div>
						</div>
					</div>
					<div class="col-xs-6">
		   				<div class="panel panel-info" name="finance-filed"  style="height:200px;" >
						   	  <div class="panel-heading" >
						   	  		<center>财务规章制度</center>
						   	  </div>
						   	   <div class="panel-body">
						   	   		财务规章制度
						   	   </div>
						</div>
					</div>
				  </div><!-- end of content-right-more -->
				  
	   			</div><!-- end of  content-right -->
	   			
	   	
	   	 </div>
	   </div><!-- end of content container -->
	   
	   <div name="booter" class="booter container" style="width:1000px;">
	   		<%@ include file="booter.jsp" %>
	   </div><!-- end of booter -->
		    
     </div>
     	
     	
     	
     <script>
	    
	     $(document).ready(function(){
	     	console.log("ready");
	     	getLastestNews();
     		getRegulation();
     		getFinance();
     	});
     	
     </script>
     
  </body>
</html>
