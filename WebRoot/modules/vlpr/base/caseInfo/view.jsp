<!-- 
* @author : karl
* @creation : 2014-03-31 15:46:37
* @ModuleName : 案件 
* @description : 
* 	描述
*
-->

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>案件信息查看</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" href="css/common.css" type="text/css" media="all"/>
	<link rel="stylesheet" href="css/main.css" type="text/css" media="all"/>
	<link rel="stylesheet" href="scripts/Tree/css/demo.css" type="text/css">
	<link rel="stylesheet" href="scripts/Tree/css/zTreeStyle/zTreeStyle.css" type="text/css">
	<script src="scripts/jquery/jquery-1.7.min.js" type="text/javascript"></script>
	<script src="scripts/Tree/jquery.ztree.core-3.5.js" type="text/javascript" ></script>
	<script src="scripts/Tree/jquery.ztree.excheck-3.5.js" type="text/javascript" ></script>
	
	<script src="scripts/jquery/jquery-ui/js/jquery-ui-1.8.16.custom.min.js" type="text/javascript"></script>
	<script src="scripts/common.js" type="text/javascript"></script>
	<script src="scripts/validateForm.js" type="text/javascript"></script>
	<script src="scripts/Calendar.js" type="text/javascript"></script>
	<script type="text/javascript" src="scripts/prompt/ymPrompt.js"></script>
	<script type="text/javascript" src="scripts/My97DatePicker/WdatePicker.js"></script>

  </head>
  
  <body>
  
  <!-- 返回 -->
	<div class="menu-path">
		<a href="${action}?">
		<img class="goback" src="images/button/back.png" title="返回" style="cursor:pointer "></img></a>
		当前位置:&nbsp;案件管理 &gt; 案件信息查看
	</div>
	
	<div id="con" style="width:80%;">
			<table id="table-data-outter">
				<tr>
					<td>
						<table id="table-data-inner" cellspacing="1">
							<tr id="tr-title"><td colspan="2"> 
								<span class=errorMessage style="margin-left:20px;" >${msg}</span>
								</td>
							</tr>
								
							<tr >
								<td width="10%" class="field-title">案件代码:</td>
								<td >
									${caseInfo.caseCode}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">案件名称:</td>
								<td >
									${caseInfo.caseName}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">案件描述:</td>
								<td >
									${caseInfo.description}
									</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">状态:</td>
								<td >
									${caseInfo.status}
									</td>
							</tr>
							
							<tr>
								<td colspan="2" >
								</td>
							</tr>
						</table>		
					</td>
				</tr>
			</table>
		</div>
  
  
  </body>
</html>
