<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
String str=(String)request.getAttribute("RulerAndRolerList");

String[] dept=str.split("#")[0].split(";");
String[] role=str.split("#")[1].split(";");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    
    <title>用户修改</title>
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
	<script type="text/javascript" src="scripts/My97DatePicker/WdatePicker.js"></script>
	
	
	<script type="text/javascript">
		function sub(){
			if(confirm("确定修改吗？"))
				document.forms[0].submit();
		}
	</script>
  </head>


  <body>
    
	<!-- 返回 -->
	<div class="menu-path">
		<a href="${goBackUrl }">
		<img class="goback" src="images/button/back.png" title="返回" style="cursor:pointer "></img></a>
		当前位置:&nbsp;组织管理 &gt; 人员管理
	</div>
		
  	<form action="UserAction?method=update&id=${id}" method="post"  >
		<div id="con" style="width:500px;">
			<table id="table-data-outter">
				<tr>
					<td>
						<table id="table-data-inner" cellspacing="1">
							<tr id="tr-title"><td colspan="2">用户修改  
								<span class=errorMessage style="margin-left:20px;" >${msg}</span>
								</td>
							</tr>
							<tr >
								<td width="10%" class="field-title">用户头像:</td>
								<td >
									<input type="hidden" name="userInfo.userPhoto" value="${userInfo.userPhoto}" style="width:200px;"/>
									<img src="${userInfo.userPhoto }" for="userInfo.userPhoto" alt="用户头像"  
										style="width:120px;height:130px;cursor:pointer;" onClick="chooserPhoto();"/>
									<input type="button" class="btns_mouseout" onClick="chooserPhoto();" alt="选择头像" value="..."/>
								</td>
							</tr>
							<tr>
								<td width="10%" class="field-title">用户帐号:</td>
								<td width="30%" class="field-content">
									<input type="hidden" name="userInfo.userId" value="${userInfo.userId }" />
									<input type="text"  name="userInfo.userCode" value="${userInfo.userCode }"  readonly/>
									(登录帐号)
									<span class=errorMessage >
										<s:property value="errors['userInfo.userCode'][0]" /> 
									</span>
								</td>
							</tr>
							<tr>
								<td width="10%" class="field-title">用户名称:</td>
								<td width="30%" class="field-content">
									<input type="text" name="userInfo.userName"  value="${userInfo.userName }"  />
									<span class="requied" >*</span>
									<span class=errorMessage >
										<s:property value="errors['userInfo.userName'][0]" /> 
									</span>
									
									</td>
							</tr>
							
							<tr>
								<td width="10%" class="field-title">用户密码:</td>
								<td width="30%" class="field-content">
									<input type="password"  name="userInfo.userPasswd" value="" />
									<span class="requied" >*</span>
									<span class=errorMessage >
										<s:property value="errors['userInfo.userPasswd'][0]" /> 
									</span>
								</td>
							</tr>
							<tr>
								<td width="10%" class="field-title">用户生日:</td>
								<td width="30%" class="field-content">

								<input type="text" name="userInfo.userBirthString" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" 
									value="<s:date name="userInfo.userBirth" format="yyyy-MM-dd" />" class="Wdate"  />
								</td>
							</tr>
							<tr>
								<td width="10%" class="field-title">用户角色:</td>
								<td width="30%" class="field-content">
									<select id="userRole" name="userInfo.userRole" >
										<option value="0">请选择...</option>
									<%	
										String[] s=null;
										for(int i=0;i<role.length;i++){
											s=role[i].split(",");
									%>
										<option value="<%=s[0] %>"><%=s[1] %></option>
									<%		
										}
									%>	
									</select>
								</td>
							</tr>
							<tr>
								<td width="10%" class="field-title">用户部门:</td>
								<td width="30%" class="field-content">
									<select id="userDept" name="userInfo.userDepartment" >
										<option value="0">请选择...</option>
									<%	
										for(int i=0;i<dept.length;i++){
											s=dept[i].split(",");
									%>
										<option value="<%=s[0] %>"><%=s[1] %></option>
									<%		
										}
									%>	
									</select>
								</td>
							</tr>
							<tr>
								<td colspan="2" >
									<input type="button" class="btns_mouseout" value="确定" onclick="sub();" />
									<input type="button" class="btns_mouseout" value="取消" onclick="javascript:history.back();" />
								</td>
							</tr>
						</table>		
					</td>
				</tr>
			</table>
		</div>
	</form>
	
	<div style="display:none;">
		<form action="UploadAction?callback=callback"  method="post" ENCTYPE="multipart/form-data" target="hidden_frame" >
			<input type=file name=file onchange="uploadPhoto(this);" />
			<input type="text" name="dir"  value="user/photos" /><br>
		</form>
		<iframe name="hidden_frame"></iframe>
	</div>	
	
	
  </body>
  <script type="text/javascript">
  		$("#userRole").val("${userInfo.userRole}");
  		$("#userDept").val("${userInfo.userDepartment}");
  		
  		function uploadPhoto(obj){
  			$(obj).parent().submit();
  		}
  		
  		function callback(json){
			if(json.error==0){
				if(json.data.length>=1)
				{
					$("input[name='userInfo.userPhoto']").val(json.data[0].path);
					$("img[for='userInfo.userPhoto']").attr("src",json.data[0].path);
				}
			}
		}
  		
  		function chooserPhoto(){
  			$("input[name=file]").click();
  		}
  		
  </script>
</html>
