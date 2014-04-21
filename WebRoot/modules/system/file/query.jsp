<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
String msg = (String)request.getAttribute("msg");

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <base href="<%=basePath%>/">
    
    <title>My JSP 'fileQuery.jsp' starting page</title>
    
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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
		var msg = "<s:property value="msg" />";
		if(msg!="null" && msg!=""){
		//	alert(msg);
		}
		function add(){
			location.href="<%= basePath%>/FileAction?method=beforeAdd";
		}
		function del(id){
			if(confirm("确定删除吗？"))
				location.href="<%= basePath%>/FileAction?method=delete&fileInfo.id="+id;
		}
	</script>

  </head>
  
  <body>
  	

		
	<div>
		<form id="opForm" name="opForm" method="post" action="<%= basePath%>/FileAction?method=query">
			
			<table id="table-data-outter">
				<tr>
					<td>
						<table id="table-data-inner" cellspacing="0">
							<tr id="tr-menu-path">
								<td colspan="3" nowrap="nowrap">
									
									<fieldset id="f-menu-path">

											<span class="locationLable">当前位置:&nbsp;文件中心&gt; 文件管理</span>
											
									</fieldset>
									<fieldset id="f-condition-display">
										<img src="images/main/display_on.gif" onclick="displayCondition(this,'tr-menu-path')" 
											align="bottom" width="17" height="15" alt="隐藏查询条件" />
									</fieldset>
								</td>
							</tr>
							<tr>
								<td>
									文件名称：
									<input type="text" name="fileInfo.fileName"  value="${fileInfo.fileName}" />
									<input  type="submit" value="查询" class="btns_mouseout" onmouseover="this.className='btns_mouseover'" 
									onmouseout="this.className='btns_mouseout'" />                              
								</td>
								<td>
									<div ><font style="color:#f00"><s:property value="msg" /></font></div>
								</td>
								<td align="right">
									<s:property value='#request.insert'/>
									<s:if test="#request.i>=0">
										<input id="button1"  type="button" value="添加" class="btns_mouseout" onmouseover="this.className='btns_mouseover'" 
											onmouseout="this.className='btns_mouseout'" onclick="add();"/>
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
								<td width="">序号</td>
								<td ondblclick="return sortQuery('carNumber')" style="cursor:pointer;" >名称</td>
								<td ondblclick="return sortQuery('carNumber')" style="cursor:pointer;" >大小</td>
								<td ondblclick="return sortQuery('carName')" style="cursor:pointer;" >类型</td>
								<td ondblclick="return sortQuery('carName')" style="cursor:pointer;" >MD5</td>
								<td ondblclick="return sortQuery('carName')" style="cursor:pointer;" >级别</td>
								<td ondblclick="return sortQuery('carName')" style="cursor:pointer;" >最后更新时间</td>
								<td ondblclick="return sortQuery('carName')" style="cursor:pointer;" >创建时间</td>
								<td ondblclick="return sortQuery('carName')" style="cursor:pointer;" >状态</td>
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
									<td align="center"><s:property value="#l.id" /></td>
									<td align="left"><s:property value="#l.fileName" /></td>
									<td align="center"><s:property value="#l.fileFormatedSize" /></td>
									<td align="center"><s:property value="#l.fileType" /></td>
									<td align="center"><s:property value="#l.md5" /></td>
									<td align="center"><s:property value="#l.securityLevel" /></td>
									<td align="center"><s:property value="#l.lastUpdate" /></td>
									<td align="center"><s:date name="#l.ctTime" format="yyyy-MM-dd hh:mm:ss" /></td>
									<td align="center"><s:property value="#l.status" /></td>
									<td align="center">
	                                   	<s:if test="#request.u>=0">
	                                   		<a href="FileAction?method=beforeUpdate&fileInfo.id=<s:property value='#l.id' />">
	                                   		<img src="images/button/pen.png" title="修改" border="0" style="cursor:pointer "></img></a>
	                                   	</s:if>	
										<s:if test="#request.d>=0">
											<a href="FileAction?method=delete&fileInfo.id=<s:property value='#l.id' />">
											<img src="images/button/delete.png" title="删除" style="cursor:pointer "></img></a>
										</s:if>
										
										<a href="FileAction?id=<s:property value='#l.id' />">
											<img src="images/button/doc.gif" title="阅读" style="cursor:pointer "></img></a>
											
	                                </td>
	                            </tr>
	                          </s:iterator>
							
						</table>
						</div>
						
						<div style=" font-size:13px font-family:'宋体'"  align="center">
						  共&nbsp; 2  &nbsp;条记录,共&nbsp;1&nbsp;页,每页15条记录&nbsp;
						  
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
