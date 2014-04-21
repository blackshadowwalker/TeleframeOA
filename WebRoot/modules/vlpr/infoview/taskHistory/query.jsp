<!-- 
* @author : karl
* @creation : 2014-03-31 15:59:51
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

		<form action="TaskHistoryAction?" method="post" id="mainForm" >
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
								<td >
								<div style="display:none;">
								<!-- 查询条件  -->
								
								
					<!-- 每次上传产生一个code,对应多条user_id和device_id  -->
					任务标识
					 :<input type="text" name="taskHistory.taskCode"  value="${taskHistory.taskCode }" />
					上传用户 :<input type="text" name="taskHistory.userId"  value="${taskHistory.userId }" />
					前端设备 :<input type="text" name="taskHistory.deviceId"  value="${taskHistory.deviceId }" />
						
									<input type="submit" value="查询" class="button" />
									
									&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="button" value="重置" class="button" onclick="ResetForm()" />
									<script>
										function ResetForm(){
											$("input[name='taskHistory.userCode']").val("");
											$("#mainForm").submit();
										}
									</script>
									&nbsp;&nbsp;&nbsp;&nbsp;
									<span style="float:right;display:none;">
										<s:if test="#request.i>=0">
											<a href="${action}?method=beforeAdd" >
												<input type="button" value="添加" class="button" />
											</a>
										</s:if>
									</span>
								</div>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
		
			
		<div id="list_div">
			<table id="table-view" cellpadding="0" cellspacing="1">
				<tr class="row-header">
					<td width="20">ID</td>
					
					<td ondblclick="return sortQuery('taskHistory.userId')" class="title-header" style="width:120px;" > 上传用户 </td>  
					<td ondblclick="return sortQuery('taskHistory.deviceId')" class="title-header" style="width:120px;" > 前端设备 </td>  
					<td ondblclick="return sortQuery('taskHistory.taskCode')" class="title-header" style="width:120px;" > 上传时间 </td>  
					<td ondblclick="return sortQuery('taskHistory.lastUpdate')" class="title-header" style="width:120px;" > 更新时间 </td>  
					<td ondblclick="return sortQuery('taskHistory.status')" class="title-header" style="width:120px;" > 状态 </td>  

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
							<s:property value="#l.userName" />
						</td>
						<td align="center">
							<s:property value="#l.pname" />
							->
							<s:property value="#l.deviceName" />
						</td>
						<td align="center">
							<s:date name="#l.uploadStart" format="yyyy-MM-dd hh:mm:ss" />
						</td>
						<td align="center">
							<s:date name="#l.lastUpdate" format="yyyy-MM-dd hh:mm:ss" />
						</td>
								<td align="center">
							<s:property value="#l.status" />
						</td>
							
						<td align="center" style="width:100px;">
							
							<span style="display:block;" >
								<s:if test="#request.v>=0">
									<a class=operate href="${action}?method=view&taskHistory.taskCode=<s:property value='#l.taskCode' />">
										<img src="images/button/doc.gif" title="详情" style="cursor:pointer "></img>
									</a>
								</s:if>
							</span>
						</td>
					</tr>
				</s:iterator>

			</table>
		</div> <!-- end of #list_div -->

		
		<div name="page-div" style="font-size: 13px font-family : '宋体'" align="center">
			
				共&nbsp; ${page.totalRow} &nbsp;条记录,
				共&nbsp; ${page.totalPage} &nbsp;页,
				
				&nbsp;&nbsp;
				<a class="submit"  href="${action}?page.currentPage=1&page.pageSize=${page.pageSize}" style="text-decoration:none;">
					<img src="images/page/PaginStart.gif"	border="0" />
				</a>
				&nbsp;&nbsp;
				<s:if test="page.hasPrePage==true">
					<a class="submit" href="${action}?page.currentPage=${page.prePage}&page.pageSize=${page.pageSize}" style="text-decoration:none;" 	>
						<img src="images/page/PaginLeft.gif" border="0" />
					</a>
				</s:if>
				<s:else>
					<img src="images/page/PaginLeftInactive.gif" border="0" title="已是第一页"/>
				</s:else>
				&nbsp;&nbsp;
				第:
				<select name="page.currentPage" onchange="changePage()" >
					 <script>
						for(var i=1; i<=${page.totalPage}; i++)
						{
							if(i==${page.currentPage})
								document.write("<option value='"+i+"' selected >"+i+"</option>");
							else
								document.write("<option value='"+i+"' >"+i+"</option>");
						}
					 </script>
				</select>
				页
				&nbsp;&nbsp;
				<s:if test="page.hasNextPage==true">
					<a class="submit" href="${action}?page.currentPage=${page.nextPage}&page.pageSize=${page.pageSize}"  style="text-decoration:none;">
						<img src="images/page/PaginRight.gif" border="0" />
					</a>
				</s:if>
				<s:else>
					<img src="images/page/PaginRightInactive.gif" border="0" title="已到达最后一页" />
				</s:else>
				&nbsp;&nbsp;
				<a class="submit" href="${action}?page.currentPage=${page.totalPage}&page.pageSize=${page.pageSize}"  style="text-decoration:none;">
					<img src="images/page/PaginEnd.gif" border="0" />
				</a> 
				
				每页显示
				<select name="page.pageSize" onchange="ResetSelect();changePage();" >
					<option value="5" >5</option>				
					<option value="10" >10</option>				
					<option value="15" >15</option>				
					<option value="20" >20</option>				
					<option value="50" >50</option>				
					<option value="100" >100</option>				
				</select>
				<script>
					$("select[name='page.pageSize']").val("${page.pageSize}");
				</script>
				条记录&nbsp;

		</div>
	
		<script>
		
		
			// down for page actions
			function ResetSelect(){
				$("select[name='page.currentPage']").val('1')
			}
			function changePage(){
				var curPage = $("select[name='page.currentPage']").val();
				var pageSize = $("select[name='page.pageSize']").val();
				var url = "${action}?page.currentPage="+curPage+"&page.pageSize="+pageSize;
				$("#mainForm").attr("action", url);
				$("#mainForm").submit();
			}
		
			$(document).ready(function(){
				$("a[class='submit']").click(function (event)
				{
				    event.preventDefault();
				});
				
				$("a[class='submit']").bind("click", function(){
					var url = $(this).attr("href");
					$("#mainForm").attr("action", url);
					$("#mainForm").submit();
				});
			});

		</script>


<!-- booter script -->
	<script>
	
		function del(id){
        	console.log(id);
			if(confirm("确定删除吗？")){
				location.href="<%= basePath%>/${action}?method=delete&id="+id;
			}
		}
		
		$(document).ready(function(){
			
		});
		
	
	</script>
	
	</body>

</html>