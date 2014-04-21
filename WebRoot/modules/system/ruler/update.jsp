<%@ page language="java" import="java.util.*" import="com.bean.UserInfo" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>菜单修改</title>
	<link rel="stylesheet" href="css/common.css" type="text/css" media="all"/>
	<link rel="stylesheet" href="css/main.css" type="text/css" media="all"/>
	<script src="scripts/jquery/jquery-1.7.min.js" type="text/javascript"></script>
	<script src="scripts/jquery/jquery-ui/js/jquery-ui-1.8.16.custom.min.js" type="text/javascript"></script>
	<script src="scripts/common.js" type="text/javascript"></script>
	<script src="scripts/validateForm.js" type="text/javascript"></script>
	<script src="scripts/Calendar.js" type="text/javascript"></script>
	<script type="text/javascript" src="scripts/My97DatePicker/WdatePicker.js"></script>
	<link rel="stylesheet" type="text/css" href="scripts/prompt/skin/qq/ymPrompt.css" /> 
	<script type="text/javascript" src="scripts/prompt/ymPrompt.js"></script>
	

</head>
<body>
	<div>
	
	<!-- 返回 -->
		<div class="menu-path">
			<a href="${goBackUrl }">
			<img class="goback" src="images/button/back.png" title="返回" style="cursor:pointer "></img></a>
			 当前位置:&nbsp;菜单管理 &gt; 菜单修改 
		</div>
		
		
		<form action="RulerAction?method=update&rulerInfo.rulerid=${rulerInfo.rulerid }"  method="post" >
			<table id="table-data-outter">
				<tr>
					<td>
						<table id="table-data-inner" cellspacing="0">
							<tr>
								<td> <span class="label" >菜单名称：</span>
									<input class=inputfiled type="text" name="rulerInfo.rulerName" value="${ rulerInfo.rulerName }"  style="color:#999999"  /> 
									<span style="color:#f00">*</span>
									<span style="color:#f00">${msg }</span>		
								</td>
							</tr>
							<tr>
								<td> 
									<span class=label >上级菜单：</span>
									<input type="hidden" name="rulerInfo.manager" value="${ rulerInfo.manager }" style="color:#999999" /> 		
									<input class=inputfiled  type="text" name="rulerInfo.managerName" value="${ rulerInfo.managerName }"style="color:#999999" readonly /> 		
								</td>
							</tr>
							
							<tr>
								<td> 
									<span class=label >Action：</span>
									<input class=inputfiled   type="text" name="rulerInfo.url" value="${ rulerInfo.url }" style="color:#999999" /> 	
									<span style="color:#f00">*</span>
									( *Action,eg: PersonAction)	
								</td>
							</tr>
							<tr>
								<td> 
									<span class=label >菜单级别：</span>
									<select  class=inputfiled  name="rulerInfo.level" onchange="LevelChanged(this);" >
										<option value=1 selected>一级菜单</option>
										<option value=2 >二级菜单</option>
									</select>
									<span style="color:#f00">*</span>
									<script>	
										$("select[name='rulerInfo.level']").find("option[value='${rulerInfo.level}']").attr("selected","selected");
										function LevelChanged(obj){
											if($(obj).val()==1)
												$("select[name='rulerInfo.target']").find("option[value='_self']").attr("selected","selected");
											else if($(obj).val()==2)
												$("select[name='rulerInfo.target']").find("option[value='main']").attr("selected","selected");
										}
									</script>
								</td>
							</tr>
							<tr>
								<td> 
									<span class=label  >Target：</span>
									<select  class=inputfiled   name="rulerInfo.target" >
										<option value="main" selected >main</option>
										<option value="_self" >_self</option>
										<option value="_blank" >_blank</option>
										<option value="" >空</option>
									</select>
									(一级菜单选择 _self, 二级菜单选择 main/_blank)
									<script>	
										$("select[name='rulerInfo.target']").find("option[value='${rulerInfo.target}']").attr("selected","selected");
									</script>
								</td>
							</tr>
							<tr>
								<td> 
									<span class=label >是否显示：</span>
									<select  class=inputfiled  name="rulerInfo.echo" >
										<option value=1 selected>显示</option>
										<option value=0 >不显示</option>
									</select>
									<span style="color:#f00">*</span>
									<script>	
										$("select[name='rulerInfo.echo']").find("option[value='${rulerInfo.echo}']").attr("selected","selected");
									</script>
								</td>
							</tr>
							<tr>
								<td> 
									<span class=label >排序：</span>
									<select class=inputfiled   name="rulerInfo.sortorder" >
										<option value="0" selected>...</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>
										<option value="8">8</option>
										<option value="9">9</option>
									</select>
									<script>	
										$("select[name='rulerInfo.sortorder']").find("option[value='${rulerInfo.sortorder}']").attr("selected","selected");
									</script>
									<!-- 
									<input type="text" name="rulerInfo.lastupdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss.0'})" 
											value="<s:date name="rulerInfo.lastupdate" format="yyyy-MM-dd HH:mm:ss" />"  readonly="true" cssClass="Wdate" />
									 -->
									
								</td>
							</tr>
							

							<tr >
								<td>
									<input id="button"  type=submit value="修改" class="btns_mouseout" onmouseover="this.className='btns_mouseover'" 
											onmouseout="this.className='btns_mouseout'"  />
								
									<input id="button"  type="reset" value="重置" class="btns_mouseout" onmouseover="this.className='btns_mouseover'" 
											onmouseout="this.className='btns_mouseout'" />
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