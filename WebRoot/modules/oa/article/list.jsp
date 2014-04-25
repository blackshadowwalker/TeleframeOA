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
    
    <title>  ${title} </title>
    
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
		   	  		<center>  ${title} </center>
		   	  </div>
		   	   <div class="panel-body">
	   	   			 <div>
							<form method="post" action="<%= basePath%>/${action}?method=query&articleInfo.category=${category}&flag=index">
											
			                            <s:iterator id="l"  value="list" status="index">  
			                            
			                            	<div class="article" onmouseover="this.style.backgroundColor='#E5EFF9';"  onmouseout=" this.style.backgroundColor=''" 
			                            		style="line-height:30px;" article="<s:property value="#l.id" />" ondblclick="view(<s:property value="#l.id" />)">
												<span class="nowrap-ellipsis"  style="display:inline-block;width:280px;" >
													<a href="ArticleAction?flag=index&id=<s:property value="#l.id" />&viewurl=/modules/oa/article/view.jsp">
														<s:property value="#l.title" /> 
													</a>
												</span>
												<span class="nowrap-ellipsis"  style="display:inline-block;width:280px;" >
														简介:<s:property value="#l.introduction" />
												</span>
												<span class="nowrap-ellipsis"  style="display:inline-block;width:120px;" >
													<a href="ArticleAction?flag=index&articleInfo.author=${l.author }&viewurl=/modules/oa/article/view.jsp" >
														作者:<s:property value="#l.authorName" />
													</a>
												</span>
												<span class="nowrap-ellipsis"  style="display:inline-block;width:150px;" >
													[<s:date name="#l.lastUpdate" format="yyyy-MM-dd hh:mm:ss" />]
												</span>
				                            </div>
				                            
				                          </s:iterator>
										
											
							</form>
						</div>
		   	   </div>
		</div>
  	 </div>	
  	
  	 <div class="booter container" style="width:1000px;">
	   	<%@ include file="../../../index/booter.jsp" %>
     </div>
	
		<script>
			
			function view(id){
				var url = "ArticleAction?flag=index&id="+id+"&viewurl=/modules/oa/article/view.jsp";
				console.log(id);
				window.location.href = url;
			}
			
	    	$(document).ready(function(){
	    		//$(".article").
	    	
	    	});
	    	
	    </script>
		

  </body>
</html>


