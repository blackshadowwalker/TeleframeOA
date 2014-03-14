<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    
    <title>role update</title>
    <base href="<%=basePath%>/">
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
	<script type="text/javascript" src="scripts/frame/main.js"></script>
	<script type="text/javascript" src="scripts/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript">
		function sub(){
			if(confirm("确定修改吗？"))
				document.forms[0].submit();
		}
	</script>
  </head>
  
  <body>
  	<s:form action="FileAction?method=update" method="post" theme="simple">
		<div id="con" style="width:500px;">
			<table id="table-data-outter">
				<tr>
					<td>
						<table id="table-data-inner" cellspacing="1">
							<tr id="tr-menu-path"><td colspan="2">当前位置:&nbsp;文件中心&gt; 文件管理</td></tr>
							<tr id="tr-title"><td colspan="2">修改文件： </td></tr>
							<tr>
								<td width="10%" class="field-title">名称:</td>
								<td width="30%" class="field-content">
								<s:textfield id="rname" name="fileInfo.fileName" />
								<input type=hidden name="fileInfo.id" value="<s:property value="fileInfo.id" />" />
								</td>
							</tr>
							<tr>
								<td width="10%" class="field-title">类型:</td>
								<td width="30%" class="field-content"><s:textfield id="rname" name="fileInfo.fileType" /></td>
							</tr>
							<tr>
								<td width="10%" class="field-title">标志位:</td>
								<td width="30%" class="field-content"><s:textfield id="rname" name="fileInfo.pathFlag" /></td>
							</tr>
							<tr>
								<td width="10%" class="field-title">路径:</td>
								<td width="30%" class="field-content"><s:textfield id="rname" name="fileInfo.path" /></td>
							</tr>
							<tr>
								<td width="10%" class="field-title">级别:</td>
								<td width="30%" class="field-content">
									<s:textfield id="rname" name="fileInfo.securityLevel">
									</s:textfield></td>
							</tr>
							<tr>
								<td width="10%" class="field-title">最后更新时间:</td>
								<td width="30%" class="field-content">
									<s:property value="fileInfo.lastUpdate" />
								</td>
							</tr>
								<tr>
								<td width="10%" class="field-title">创建时间:</td>
								<td width="30%" class="field-content">
									<s:date name="fileInfo.ctTime" format="yyyy-MM-dd hh:mm:ss" />
								</td>
							</tr>
							
							<tr>
								<td colspan="2" >
									<center>
									<input type="button" value="确定" onclick="sub();" /> &nbsp;&nbsp;&nbsp;&nbsp;
									<input type="button" value="取消" onclick="javascript:history.back();" />
									</center>
								</td>
							</tr>
						</table>		
					</td>
				</tr>
			</table>
		</div>
	</s:form>
  </body>
  <script type="text/javascript">
  		$("#userRole").val("${userInfo.userRole}");
  		$("#userDept").val("${userInfo.userDepartment}");
  </script>
</html>
