<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
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
      	 	<%@ include file="top.jsp" %>
      </div>

      <div class="nav container"  style="width:1000px;">
       	 <%@ include file="nav.jsp" %>
      </div>
      
      <div class="container" style="margin-top:10px;padding-left:0px;width:1000px;">
	   	 <div class="panel panel-info">
		   	  <div class="panel-heading">
		   	  		<center> 关于我们 </center>
		   	  </div>
		   	   <div class="panel-body">
		   	   			<p  class="text-primary" style="line-height:25px;">
		   	   				信帧电子技术（北京）有限公司成立于2011年，是一家注册于北京市中关村高新技术园区的高科技成长型企业。公司注册资本3000万元，是国家级高新技术企业、中关村高新技术企业、双软企业，并通过了ISO9001管理体系认证。
    公司核心人员来自法国电信、中科院、中国电信集团、东软等高新技术企业，拥有深厚的技术积累与研发及市场化的经验和能力。公司现拥有80多项自主知识产权及专利，业务范围涵盖各类企业用户与政府机关。公司致力于为各类高端客户提供业界技术先进、可靠的解决方案与完善的技术支持服务。
    						
    					</p>
    					
    					<p class="text-info">
    						地址：北京市海淀区北京市海淀区上地产业基地上地信息路甲 28 号科实大厦 A 座 6A <br />
							传真：+86 - 010 - 82783389 <br />
							电话：+86 - 010 - 82783389  <br />
							邮箱：<a href="mailto:services@teleframe.cn">services@teleframe.cn</a> <br />
    					</p>
    					
		   	   </div>
		</div>
  	 </div>	
  	
  	 <div class="booter container" style="width:1000px;">
	   	<%@ include file="booter.jsp" %>
     </div>
	

  </body>
</html>


