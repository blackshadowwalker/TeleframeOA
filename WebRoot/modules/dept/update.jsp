<%@ page language="java" import="java.util.*"   pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<base href="<%=basePath%>/">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>修改部门信息</title>
	<link rel="stylesheet" href="css/common.css" type="text/css" media="all"/>
	<link rel="stylesheet" href="css/main.css" type="text/css" media="all"/>
	<script src="scripts/jquery/jquery-1.7.min.js" type="text/javascript"></script>
	<script src="scripts/jquery/jquery-ui/js/jquery-ui-1.8.16.custom.min.js" type="text/javascript"></script>
	<script src="scripts/common.js" type="text/javascript"></script>
	<script src="scripts/validateForm.js" type="text/javascript"></script>
	<script src="scripts/Calendar.js" type="text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="scripts/prompt/skin/qq/ymPrompt.css" /> 
	<script type="text/javascript" src="scripts/prompt/ymPrompt.js"></script>

	<script language="javascript">
		function cancle(){
			location.href="<%= basePath%>/DeptAction?method=query";
		}
	</script>
	
	
</head>
<body>
	<div>
	<!-- 返回 -->
		<div class="menu-path">
			<a href="${goBackUrl }">
			<img class="goback" src="images/button/back.png" title="返回" style="cursor:pointer "></img></a>
			 当前位置:&nbsp;部门管理 &gt; 部门信息修改
		</div>
		
		<form action="DeptAction?method=update&id=${deptInfo.id}"  method="post" >
			<table id="table-data-outter">
				<tr>
					<td>
						<table id="table-data-inner" cellspacing="0">
							<tr>
								<td> 部门名称：
									<input type="text" name="deptInfo.deptName" value="${deptInfo.deptName }"  /> 		
								</td>
							</tr>
							<tr>
								<td> 上级部门：
									<input type="hidden" name="deptInfo.manager" value="${deptInfo.manager}"  /> 
									<input type="text" name="deptInfo.managerName"  value="${deptInfo.managerName}" readonly/> 		
								</td>
							</tr>
							<tr>
								<td> 是否启用：
									<select name="deptInfo.status"   >
										<option value="1" selected>启用</option>
										<option value="0">禁用</option>
									</select>
									<script>	
										$("select[name='deptInfo.status']").find("option[value='${deptInfo.status}']").attr("selected","selected");
									</script>
								</td>
							</tr>
							
							<tr >
								<td>
									<input id="button"  type="submit" value="修改" class="btns_mouseout" onmouseover="this.className='btns_mouseover'" 
											onmouseout="this.className='btns_mouseout'" />
								
									<input id="button"  type="button" value="取消" class="btns_mouseout" onmouseover="this.className='btns_mouseover'" 
											onmouseout="this.className='btns_mouseout'" onclick="cancle()"/>
								</td>
							</tr>
						</table>
						<div id="div-button" align="center">
						</div>
					</td>
				</tr>
			</table>		
		</form>
		</div>
	</body>
</html>