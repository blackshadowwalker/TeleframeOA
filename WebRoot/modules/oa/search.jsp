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
    
    <title> 搜索</title>
    
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
	<script src="scripts/main.js" type="text/javascript"></script>
	
	<style>
	</style>
	
  </head>
  
  <body>
   	
   	  <input type="hidden" name="action" value="index/about.jsp"> 
   
      <div class="pagetop">
      	 	<%@ include file="../../index/top.jsp" %>
      </div>

      <div class="nav container"  style="width:1000px;">
       	 <%@ include file="../../index/nav.jsp" %>
      </div>
      
      <div class="container" style="margin-top:10px;padding-left:0px;width:1000px;">
	   	 <div class="panel panel-info">
		   	  <div class="panel-heading">
		   	  		<center> 搜索结果 </center>
		   	  </div>
		   	   <div class="panel-body" >
	   	   			<div class="content" style="line-height:30px;">
		   	   			<!-- 文章搜索结果 -->
		   	   			<s:iterator value="list" id="l"  status="st" >
		   	   				<div>
		   	   					${st.index+1 }:
		   	   					<a href="ArticleAction?id=${l.id }&viewurl=/modules/oa/article/view.jsp">${l.title } [ ${l.authorName }  &nbsp; ${l.ctTime }] </a>
		   	   				</div>
		   	   			</s:iterator>
		   	   			<!-- http://127.0.0.1:8080/oa/ArticleAction?id=13&viewurl=/modules/oa/article/view.jsp -->
	   	   			</div>
	   	   			
		   	   </div>
		</div>
  	 </div>	
  	
  	 <div class="booter container" style="width:1000px;">
	   	<%@ include file="../../index/booter.jsp" %>
     </div>
	
		<script>
	    	$(document).ready(function(){
				var msg = "${msg}";
				if(msg!="")
					alert(msg);
					
				var wd = $("input[name='wd']").val();
				var content = $(".content").html();
				$(".content").html( search_do(content, wd ) );
					
	    	});
	    	
	    	function search_do(content,keyWord){
				var keyWordArr = keyWord.replace(/[\s]+/g,' ').split(' ');
				var re;
				for(var n = 0; n < keyWordArr.length; n ++) {
					//re = new RegExp(">[\s\S]*?"+keyWordArr[n]+"[\s\S]*?<\S","gmi");
					re = new RegExp(""+keyWordArr[n]+"","gmi");
					content = content.replace(re,'<span style="color:#55aa00;background-color:#ffff00">'+keyWordArr[n]+'</span>');
				}
				return content;
			}
	    	
	    
	    </script>
		

  </body>
</html>


