<%@ page language="java" import="java.util.*" import="com.bean.UserInfo" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>/">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加部门</title>
<link rel="stylesheet" href="css/common.css" type="text/css" media="all"/>
<link rel="stylesheet" href="css/main.css" type="text/css" media="all"/>
<script src="scripts/jquery/jquery-1.7.min.js" type="text/javascript"></script>
<script src="scripts/jquery/jquery-ui/js/jquery-ui-1.8.16.custom.min.js" type="text/javascript"></script>
<script src="scripts/common.js" type="text/javascript"></script>
<script src="scripts/validateForm.js" type="text/javascript"></script>
<script src="scripts/Calendar.js" type="text/javascript"></script>

<script  >	
	function cancle(){
		location.href="<%= basePath%>/DeptAction?method=query";
	}
	
</script>
</head>
<body>

	<script>
	$(document).ready(function(){
	
	
	});
	</script>

	<div>
		<form action="<%= basePath%>/DeptAction?method=add" id="opForm" name="opForm" method="post" >
			<table id="table-data-outter">
				<tr>
					<td>
						<table id="table-data-inner" cellspacing="0">
							<tr id="tr-menu-path" >
								<td  nowrap="nowrap">
								<fieldset id="f-menu-path">当前位置:&nbsp;部门管理 &gt; 部门添加</fieldset>
								</td>
							</tr>
							
							<tr>
								<td> 部门名称：
									<input type="text" name="deptBean.deptName" id="dept_name" value="${deptBean.deptName}" onclick="alert(123);" /> 	
									<span style="color:#f00;">${msg}</span>
								</td>
							</tr>
							<tr>
								<td> 上级部门：
									<input type="hidden" name="deptBean.pid" id="dept_manager" value="${pid}" />
									<input type="text" name="deptBean.deptManager" id="managerName" value="${pname}" readOnly /> 		
								</td>
							</tr>
							
							<tr>
								<td> 是否启用：
									<select name="deptBean.status" >
										<option value="1" selected>启用</option>
										<option value="0">禁用</option>
									</select>
								</td>
							</tr>
							<tr >
								<td>
									<br />
									<input id="button"  type=submit value="添加" class="btns_mouseout" onmouseover="this.className='btns_mouseover'" 
											onmouseout="this.className='btns_mouseout'"  />
								
									<input id="button" type="button" value="取消" class="btns_mouseout" onmouseover="this.className='btns_mouseover'" 
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