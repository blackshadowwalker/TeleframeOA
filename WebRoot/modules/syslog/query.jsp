<%@ page language="java" import="java.util.*"   pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 	<base href="<%=basePath%>/" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>日志信息列表</title>
	<link rel="stylesheet" href="css/common.css" type="text/css" media="all"/>
	<link rel="stylesheet" href="css/main.css" type="text/css" media="all"/>
	
	<link rel="stylesheet" href="scripts/jquery/jquery-ui/css/drop-down-list/jquery-ui.css" type="text/css" media="all"/>
	
	<link rel="stylesheet" href="scripts/MiniTree/css/miniui/miniui.css" type="text/css" media="all"/>
	<script src="scripts/jquery/jquery-1.7.min.js" type="text/javascript"></script>
	
	<script src="scripts/MiniTree/core.js" type="text/javascript"></script>
	<script src="scripts/MiniTree/miniui.js" type="text/javascript" ></script>  
	<script src="scripts/jquery/jquery-ui/js/jquery-ui-1.8.16.custom.min.js" type="text/javascript"></script>
	
	<script src="scripts/validateForm.js" type="text/javascript"></script>
	<script src="scripts/Calendar.js" type="text/javascript"></script>

	<style type="">
		a.operate{
			text-decoration:none;
		}
		a.operate img{
			margin-left:10px;
		}
	</style>

	<script language="javascript">

	var msg="${msg}";
	if(msg!="null" && msg!="")
		alert(msg);

	</script>
	
</head>
<body>

		<form action="SyslogAction?method=getDeptView" id="opForm" name="opForm"
			method="post">
			<table id="table-data-outter">
				<tr>
					<td>
						<table id="table-data-inner" cellspacing="0">
							<tr id="tr-menu-path">
								<td colspan="2" nowrap="nowrap">
									<fieldset id="f-menu-path">
										当前位置:&nbsp;系统管理 &gt; 日志管理
									</fieldset>
									<fieldset id="f-condition-display">
										<img src="images/main/display_on.gif"
											onclick="displayCondition(this,'tr-menu-path')"
											align="bottom" width="17" height="15" alt="隐藏查询条件" />
									</fieldset>
								</td>
							</tr>
							<tr>
								<td>
	
									用户编号：
									<input type="text" name="syslog.userCode"  />
									
									用户名称：
									<input type="text" name="syslog.userName"  />

									IP：
									<input type="text" name="syslog.ip"  />
									
									内容：
									<input type="text" name="syslog.content"  />
									
									<input type="submit" value="查询" class="button" />
										
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>

		<div id="car_use">
			<table id="table-view" cellpadding="0" cellspacing="1">
				<tr class="row-header">
					<td width="20">ID</td>
					<td ondblclick="return sortQuery('carNumber')" style="cursor:pointer;width:80px;" >用户编号</td>
					<td ondblclick="return sortQuery('carNumber')" style="cursor:pointer;width:100px;" >用户名称</td>
					<td ondblclick="return sortQuery('carName')" style="cursor:pointer;width:100px;" >IP</td>
					<td ondblclick="return sortQuery('carName')" style="cursor:pointer;width:300px;" >操作内容</td>
					<td ondblclick="return sortQuery('carName')" style="cursor:pointer;width:100px;" >操作时间</td>
                    <td colspan="2" align="center" style="width:150px;" >操作</td> 
                </tr>
				<s:iterator id="l" value="list" status="index">
					<s:if test='#index.odd == true'>
						<s:set name="var_class" value="'row-odd'" />
					</s:if>
					<s:else>
						<s:set name="var_class" value="'row-even'" />
					</s:else>

					<tr class="<s:property value='var_class' />"
						onmouseover="this.className='row-over'"
						onmouseout="this.className='<s:property value='var_class' />'">
						<td align="center">
							<s:property value="#l.id" />
						</td>
						<td align="center">
							<s:property value="#l.userCode" />
						</td>
						<td align="center">
							<s:property value="#l.userName" />
						</td>
						<td align="center">
							<s:property value="#l.ip" />
						</td>
						<td align="center">
							<div style="width:200px;height:25px;text-overflow:ellipsis; overflow:hidden;white-space:nowrap;"
								title="<s:property value="#l.content" />"  		>
								<s:property value="#l.content" />
							</div>
						</td>
						<td align="center">
							<s:date name="#l.createdOn" format="yyyy-MM-dd hh:mm:ss" />
						</td>
						<td align="center" style="width:100px;">
							<s:if test="#request.v>=0">
								<a class=operate href="SyslogAction?method=view&id=<s:property value='#l.id' />">
									<img src="images/button/doc.gif" title="详情" style="cursor:pointer "></img>
								</a>
							</s:if>
							<span style="display:none;" >
								<s:if test="#request.u>=0">
									<a class=operate href="SyslogAction?method=beforeUpdate&id=<s:property value='#l.id' />">
									<img src="images/button/pen.png" title="修改" border="0" style="cursor: pointer"></img>
									</a>
								</s:if>
								<s:if test="#request.d>=0">
									<a class=operate onclick="javaScript:del(<s:property value='#l.id' />);">
									<img src="images/button/delete.png" title="删除" style="cursor: pointer"></img>
									</a>
								</s:if>
							</span>
						</td>
					</tr>
				</s:iterator>

			</table>
		</div>

		<div style="font-size: 13px font-family : '宋体'" align="center">
			共&nbsp;2&nbsp;条记录,共&nbsp;1&nbsp;页,每页15条记录&nbsp;

			<a href="#"><img src="images/page/PaginStartInactive.gif"
					border="0" />
			</a>&nbsp;
			<a href="#"><img src="images/page/PaginLeftInactive.gif"
					border="0" />
			</a>&nbsp;当前页:1
			<a href="#"><img src="images/page/PaginRightInactive.gif"
					border="0" />
			</a>&nbsp;
			<a href="#"><img src="images/page/PaginEndInactive.gif"
					border="0" />
			</a> 第:
			<select name="page">
				<option title="1" value="1">
					1
				</option>
				<option title="2" value="2">
					2
				</option>
			</select>
			页
		</div>


	</body>

</html>