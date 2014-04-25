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
    
    <title>article query</title>
    
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
  </head>
  
  <body>
  	
	<div>
		<form method="post" action="<%= basePath%>/${action}?method=query&articleInfo.category=${category}">
			<table id="table-data-outter">
				<tr>
					<td>
						<table id="table-data-inner" cellspacing="0">
							<tr id="tr-menu-path">
								<td colspan="2" nowrap="nowrap">
									<fieldset id="f-menu-path">当前位置:&nbsp; &gt; 文章管理</fieldset>
									<fieldset id="f-condition-display">
										<img src="images/main/display_on.gif" onclick="displayCondition(this,'tr-menu-path')" 
											align="bottom" width="17" height="15" alt="隐藏查询条件" />
									</fieldset>
								</td>
							</tr>
							<tr>
								<td>
								文章标题：
									<input type="text" name="articleInfo.title" value="${articleInfo.title}" />
									<input  type="submit" value="查询" class="button" />       
									<span style="color:#f00;">${msg}</span>                       
								</td>
								<td align="right">
									<s:if test="#request.i>=0">
										<a href="${action}?method=beforeAdd&articleInfo.category=${category}"  class="button">
											添加
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
								<td width="">编号</td>
								<td ondblclick="return sortQuery('carNumber')" style="cursor:pointer;" >标题</td>
								<td ondblclick="return sortQuery('carName')" style="cursor:pointer;" >类别</td>
								<td ondblclick="return sortQuery('carName')" style="cursor:pointer;" >简介</td>
								<td ondblclick="return sortQuery('carName')" style="cursor:pointer;" >作者</td>
								<td ondblclick="return sortQuery('carName')" style="cursor:pointer;" >状态</td>
								<td ondblclick="return sortQuery('carName')" style="cursor:pointer;" >更新时间</td>
								<td ondblclick="return sortQuery('carName')" style="cursor:pointer;" >创建时间</td>
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
										<s:property value="#l.id" />
									</td>
									<td align="center"><a href="ArticleAction?method=view&id=<s:property value="#l.id" />"><s:property value="#l.title" /> </a></td>
									<td align="center"><s:property value="#l.categoryName" /></td>
									<td align="center"><s:property value="#l.introduction" /></td>
									<td align="center"><s:property value="#l.authorName" /></td>
									<td align="center"><s:property value="#l.statusName" /></td>
									<td align="center"><s:date name="#l.lastUpdate" format="yyyy-MM-dd hh:mm:ss" /></td>
									<td align="center"><s:date name="#l.ctTime" format="yyyy-MM-dd hh:mm:ss" /></td>
									<td align="center">
	                                   	<s:if test="#request.u>=0"><a href="${action}?method=beforeUpdate&id=${l.id}"><img src="images/button/pen.png" title="修改" border="0" style="cursor:pointer "></img></a></s:if>	
										<s:if test="#request.d>=0"><a onclick="javaScript:del(<s:property value='#l.id' />);"><img src="images/button/delete.png" title="删除" style="cursor:pointer "></img></a></s:if>
	                                </td>
	                            </tr>
	                          </s:iterator>
							
						</table>
						</div>
						
						<div style=" font-size:13px font-family:'宋体'"  align="center">
						  共&nbsp;2&nbsp;条记录,共&nbsp;1&nbsp;页,每页15条记录&nbsp;
						  
						  <a href="#"><img  src="images/page/PaginStartInactive.gif" border="0"/></a>&nbsp;
						  <a href="#"><img src="images/page/PaginLeftInactive.gif" border="0"/></a>&nbsp;当前页:1
						  <a href="#"><img src="images/page/PaginRightInactive.gif" border="0"/></a>&nbsp;
						  <a href="#"><img src="images/page/PaginEndInactive.gif" border="0"/></a>
						  第:
						  <select name="page">
						   <option  title="1" value="1">1</option>
						   <option title="2" value="2">2</option>
						  </select>
						  页
						 </div>
						<div>
	                       	<script language="javascript">
	                           	//initSelect("100","15");
								
	                           </script>	
						</div>
					</td>
				</tr>
			</table>		
		</form>
	</div>
	
	
  </body>
</html>
