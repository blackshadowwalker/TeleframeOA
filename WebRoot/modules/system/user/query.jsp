<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <base href="<%=basePath%>/">
    
    <title>用户管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" href="css/common.css" type="text/css" media="all"/>
	<link rel="stylesheet" href="css/main.css" type="text/css" media="all"/>
	<script src="scripts/jquery/jquery-1.7.min.js" type="text/javascript"></script>
	<script src="scripts/jquery/jquery-ui/js/jquery-ui-1.8.16.custom.min.js" type="text/javascript"></script>
	<script src="scripts/common.js" type="text/javascript"></script>
	<script src="scripts/validateForm.js" type="text/javascript"></script>
	<script src="scripts/Calendar.js" type="text/javascript"></script>
	<script type="text/javascript" src="scripts/frame/main.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
		function upd(userId){
			location.href="<%= basePath%>/UserAction?method=beforeUpdate&userId="+userId;
		}
		function del(userId){
			if(confirm("确定删除吗？"))
			location.href="<%= basePath%>/UserAction?method=delete&id="+userId;
		}
	</script>

  </head>
  
  <body>
  	
	<div>
		<form id="opForm" name="opForm" method="post" action="<%= basePath%>/UserAction?">
			<table id="table-data-outter">
				<tr>
					<td>
						<table id="table-data-inner" cellspacing="0">
							<tr id="tr-menu-path">
								<td colspan="2" nowrap="nowrap">
									<fieldset id="f-menu-path">当前位置:&nbsp;组织管理 &gt; 人员管理</fieldset>
									<fieldset id="f-condition-display">
										<img src="images/main/display_on.gif" onclick="displayCondition(this,'tr-menu-path')" 
											align="bottom" width="17" height="15" alt="隐藏查询条件" />
									</fieldset>
								</td>
							</tr>
							<tr>
								<td>
									用户帐号：
									<input type="text" name="userInfo.userCode"  value="${userInfo.userCode}" />
									用户名称：
									<input type="text" name="userInfo.userName"  value="${userInfo.userName}" />
									<input  type="submit" value="查询" class="button" />  
									<input type="button" class="button" value="重置"  onclick="clear1(this)" />
									<script>
										function clear1(obj){
											var p = $(obj).parent();
											p.children("input[name='userInfo.userCode']").val("");
											p.children("input[name='userInfo.userName']").val("");
										}
									</script>     
									<span style="color:#f00;">${msg}</span>                      
								</td>
								<td align="right">
									<s:property value='#request.insert'/>
									<s:if test="#request.i>=0">
										<a href="UserAction?method=beforeAdd" >
											<input id="button1"  type="button" class="button" value="添加"  />
										</a>
									</s:if>
									
								</td>									
							</tr>
						</table>
						<div id="div-button" align="center">
						</div>
						<div id="div-message"></div>
						
						<div id="car_use">
						<table id="table-view" cellpadding="0" cellspacing="1">
							<tr class="row-header">
								<td width="">头像</td>
								<td ondblclick="return sortQuery('carNumber')" style="cursor:pointer;" >用户编号</td>
								<td ondblclick="return sortQuery('carNumber')" style="cursor:pointer;" >用户名称</td>
								<td ondblclick="return sortQuery('carName')" style="cursor:pointer;" >用户角色</td>
								<td ondblclick="return sortQuery('carName')" style="cursor:pointer;" >用户生日</td>
								<td ondblclick="return sortQuery('carName')" style="cursor:pointer;" >用户部门</td>
								<td ondblclick="return sortQuery('carName')" style="cursor:pointer;" >最后更新时间</td>
	                            <td colspan="2" align="center">操作</td> 
	                        </tr>
                            <s:iterator id="l"  value="list" status="index">  
	                           <s:if test='#index.odd == true'>
									<s:set name="var_class" value="'row-odd'" />
								</s:if>
								<s:else>
									<s:set name="var_class" value="'row-even'" />
								</s:else>
								
								<tr class="<s:property value='var_class' />" onmouseover="this.className='row-over'" 
									onmouseout="this.className='<s:property value='var_class' />'">
									<td align="center">
										<img src="${l.userPhoto}" style="width:30;height:30px;" />
									</td>
									<td align="center"><s:property value="#l.userCode" /></td>
									<td align="center"><s:property value="#l.userName" /></td>
									<td align="center"><s:property value="#l.userRoleName" /></td>
									<td align="center"><s:date name="#l.userBirth" format="yyyy-MM-dd" /></td>
									<td align="center"><s:property value="#l.userDepartmentName" /></td>
									<td align="center"><s:date name="#l.lastUpdate" format="yyyy-MM-dd hh:mm:ss" /></td>
									<td align="center">
	                                   	<s:if test="#request.u>=0"><a href="UserAction?method=beforeUpdate&id=${l.userId}"><img src="images/button/pen.png" title="修改" border="0" style="cursor:pointer "></img></a></s:if>	
										<s:if test="#request.d>=0"><a onclick="javaScript:del(<s:property value='#l.userId' />);"><img src="images/button/delete.png" title="删除" style="cursor:pointer "></img></a></s:if>
	                                </td>
	                            </tr>
	                          </s:iterator>
							
						</table>
						</div>
						
							
							
					</td>
				</tr>
			</table>		
		</form>
	</div>
	
	
  </body>
</html>
