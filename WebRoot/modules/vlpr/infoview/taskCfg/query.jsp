<!-- 
* @author : karl
* @creation : 2014-04-01 15:34:32
* @ModuleName : 分析任务 
* @description : 
* 	分析任务管理描述
*
-->

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
	<title>分析任务信息</title>
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
	
	<script src="scripts/main.js" type="text/javascript"></script>

	<style type="">
		a.operate{
			text-decoration:none;
		}
		a.operate img{
			margin-left:10px;
		}
		td. title-header {
			cursor:pointer;
		}
		.mini-tree-leaf
		{
		    background-image:url(images/device/2.png);
		}
	</style>

	<script language="javascript">

	var msg="${msg}";
	if(msg!="null" && msg!="")
		alert(msg);

	

	</script>
	
</head>
<body>

			<table id="table-data-outter">
				<tr>
					<td>
						<table id="table-data-inner" cellspacing="0">
							<tr id="tr-menu-path">
								<td colspan="2" nowrap="nowrap">
									<fieldset id="f-menu-path">
										当前位置:&nbsp;分析任务管理 &gt; 分析任务信息查询
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
								<!-- 查询条件  -->
								&nbsp;
								
										
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		
		<div id="msg" style="color:#f00;" onclick="queryData()" >${msg} </div>
		
		<div id="list_div">
			<table id="table-view" cellpadding="0" cellspacing="1">
				<tr class="row-header">
					<td width="20">ID</td>
					
					<td ondblclick="return sortQuery('taskCfg.userCode')" class="title-header" style="width:120px;" > 上传用户编号 </td>  
					<td ondblclick="return sortQuery('taskCfg.userId')" class="title-header" style="width:120px;" > 上传用户 </td>  
					<td ondblclick="return sortQuery('taskCfg.deviceId')" class="title-header" style="width:120px;" > 卡口设备 </td>  
					<td ondblclick="return sortQuery('taskCfg.lastUpdate')" class="title-header" style="width:120px;" > 更新时间 </td>  
					<td ondblclick="return sortQuery('taskCfg.percent')" class="title-header" style="width:120px;" > 进度 </td>  
					<td ondblclick="return sortQuery('taskCfg.status')" class="title-header" style="width:120px;" > 状态 </td>  

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
							<s:property value="#l.taskId" />
						</td>
							<td align="center">
							<s:property value="#l.userCode" />
						</td>
								<td align="center">
							<s:property value="#l.userName" />
						</td>
								<td align="center">
							<s:property value="#l.devicePath" />
						</td>
								<td align="center">
							<s:date name="#l.lastUpdate" format="yyyy-MM-dd" />
						</td>
						<td align="left">
							<div class=progerssbar style="margin-left:20px;">
									<div class="progressbar-value-ui " style="width:<s:property value="#l.percent" />%;"></div>
									<span class="progress-value" ><s:property value="#l.percent" />%</span>
							</div>
						</td>
							
						<td align="center">
								<s:property value="#l.statusName" />
						</td>
					</tr>
				</s:iterator>

			</table>
		</div> <!-- end of #list_div -->

		
	

<!-- booter script -->
	<script>
	
		
		function queryData(){
			$.ajax({
				type: 'post',
				url: '${action}?method=listTree',
				dateType: 'json',
				success: function(data){
					var json = eval(data);
					console.log(json);
					$("#table-view tr:not(:first)").remove();
					for(var i=0; i<json.length; i++) {
					  	var html = "<tr>";
					  	html += "<td align=center >"+json[i].taskId+"</td>";
					  	html += "<td align=center >"+json[i].userCode+"</td>";
					  	html += "<td align=center >"+json[i].userName+"</td>";
					  	html += "<td align=center >"+json[i].devicePath+"</td>";
					  	html += "<td align=center >"+formatJsonDate(json[i].lastUpdate)+"</td>";
					  	html += "<td align=left >"+getPercentHtml(json[i].percent)+"</td>";
					  	html += "<td align=center >"+json[i].statusName+"</td>";
					  	html +="</tr>";
						console.log(i+" : "+html);
						$("#table-view").append(html);
					}
				},
				error:function(XMLHttpRequest, textStatus, errorThrown){
					console.log(textStatus);
					$("#msg").html(textStatus);
				}
			});
		}	
		
		$(document).ready(function(){
		
			setInterval(queryData, 2000);
					
			
		});
		
	
	</script>
	
	</body>

</html>