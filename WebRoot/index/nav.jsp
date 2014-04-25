<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML >
<html>
  <head>
  
  <style>
  	.search-btn{
  		cursor:pointer;
  		cursor:hand;
  	}
  	.search-btn:hover{
  		background-color:#aea;
  	}
  </style>
  
  
  </head>
  
  <body>
  
  	
   			<div class="masthead ">
		        <h3 class="text-muted">
		        		<img alt="Logo" src="images/logo.png" style="width:50px;">
		        		Teleframe OA
		        </h3>
			        <ul class="nav nav-justified  ">
			          <li ><a href="IndexAction">首页</a></li>
			          <li><a href="#">新闻动态</a></li>
			          <li class="dropdown">
		                  <a href="#" class="dropdown-toggle" data-toggle="dropdown"> 内部动态 <b class="caret"></b></a>
					        <ul class="dropdown-menu">
					          <li><a href="RegulationAction?title=行政规章制度 &flag=index">行政规章制度</a></li>
					          <li><a href="FinanceAction?title=财务规则制度&flag=index">财务规则制度</a></li>
					          <li><a href="ArticleAction?title=技术文档&flag=index">技术文档</a></li>
					          <li class="divider"></li>
					          <li><a href="modules/oa/app.jsp">APP应用</a></li>
					          <li class="divider">s</li>
					          <li><a href="#">最新消息</a></li>
					        </ul>
		          	  </li>
			          <li><a href="#">通知公告</a></li>
			          <li><a href="#">文件下载</a></li>
			          <li><a href="index/about.jsp">关于我们</a></li>
			        </ul>
		        </div>
		        
		        <br/>
		        
		        <div align="right">
		        	<form action="SearchAction?" method=post >
				        <div  class="input-group " style="width:250px;">
						  <input type="text" name="wd" value="${wd }" size=100 class="form-control" placeholder="搜索"
						  	 onKeyDown="javascript:if (event.keyCode==13) event.keyCode=9;" >
						  <span class="input-group-addon search-btn" onclick="search()">
						  	<span class="glyphicon glyphicon-search "   ></span> 
						  </span>
						  <script>
						  		function search(){
						  			var wd = $("input[name='wd']").val();
						  			window.location.href="SearchAction?wd="+wd;
						  		}
						  </script>
						</div>
					</form>
				</div>
		        
  </body>
</html>
