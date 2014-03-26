<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    
    <title>file query</title>
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
			if(confirm("确定添加吗？"))
				document.forms[0].submit();
		}
		function callback(json){
			if(json.error==0){
				//deleteNode();
				alert("上传成功");
			}
			else
				alert("上传失败  "+json.msg);
				
				
		}
		function onPickFile(obj){
			var pDiv = $(obj).parent();
			pDiv.children("input[name=file]").click();
		}
		function filechanged(obj){
			var name = obj.value.split("/");
			if(name.length<=1)
				name = obj.value.split("\\");
			var pDiv = $(obj).parent();
			pDiv.children("#filename").html(name[name.length-1]);
			appendFileUpload();
		}
		function deleteNode(obj){
			if($("input[name=file]").length <=1 )
				return ;
			var pDiv = $(obj).parent();
			pDiv.remove();
		}
		
		function appendFileUpload(){
			var html = "<div ><input name=\"file\" style=\"width:75px;display:none;\"  class=\"btn btn-info\" type=\"file\" onchange=\"filechanged(this);\">";
				html += "<input type=\"button\"  class=\"btn btn-info\" value=\"添加文件\" onclick=\"onPickFile(this);\" />"; 
				html += "<span id=\"filename\" style=\"width:400px;border:0px solid #f00;\">&nbsp;</span>";
				html += "<span onclick=\"deleteNode(this);\"><img src=\"images/button/delete.png\" title=\"删除\" style=\"cursor:pointer \"> </img></span>";
				html += "</div>";
			$("#uploadFiles").append(html);
		}
	</script>
  </head>
  
  <body>
  
  	<iframe name="hidden_frame" style="display:none;" ></iframe>
  
  		<!-- 返回 -->
	<div class="menu-path">
		<a href="${goBackUrl }">
		<img class="goback" src="images/button/back.png" title="返回" style="cursor:pointer "></img></a>
		<span class="locationLable"> 当前位置:&nbsp;菜单管理 &gt; 菜单添加 </span> 
	</div>
	
	<s:form action="UploadAction?callback=callback"  method="post" ENCTYPE="multipart/form-data" target="hidden_frame" >
		<div id="con" style="width:500px;">
				<table id="table-data-outter">
					<tr>
						<td>
							<table id="table-data-inner" cellspacing="1">
								
								<tr id="tr-title"><td colspan="2">添加文件</td></tr>
								<tr>
									<td width="10%" class="field-title">文件:</td>
									<td>
										存储路径:
										<input type="text" name="dir"  value="teleframe" /><br>
										<div id="uploadFiles">
											<div style="width:500xp;" class="uploadFileClass">
												<input name="file" style="width:75px;display:none;"  class="btn btn-info" type="file" onchange="filechanged(this);">
												<input type="button"  class="btn btn-info" value="添加文件" onclick="onPickFile(this);" /> 
												<span id="filename" style="width:400px;border:0px solid #f00;">&nbsp;</span>
											</div>
										</div>
									</td> 		
								</tr>
								<tr>
									<td colspan="2" >
										<input type="button" value="添加" onclick="sub();" />
										<input type="button" value="取消" onclick="javascript:history.back();" />
									</td>
								</tr>
							</table>		
						</td>
					</tr>
				</table>
			</div>
	  </s:form>
	
	
	<div style="display:none;">
  	<s:form action="FileAction?method=add" method="post" theme="simple">
		<div id="con" style="width:500px;">
			<table id="table-data-outter">
				<tr>
					<td>
						<table id="table-data-inner" cellspacing="1">
							<tr id="tr-menu-path"><td colspan="2">当前位置:&nbsp;文件中心 &gt; 文件管理</td></tr>
							<tr id="tr-title"><td colspan="2">添加文件</td></tr>
							<tr>
								<td width="10%" class="field-title">文件:</td>
								<td>
									
								</td> 		
							</tr>
							<tr>
								<td width="10%" class="field-title">名称:</td>
								<td>
									<input type="text" name="fileInfo.fileName" id="file_name"  style="color:#999999"  />
								</td> 		
							</tr>
							<tr>
								<td width="10%" class="field-title">文件类型</td>
								<td width="30%" class="field-content">
									<select name="fileInfo.fileType" >
										<option value="">请选择...</option>
										<option value="avi">*.avi</option>
										<option value="bmp">*.bmp</option>
										<option value="jpg">*.jpg</option>
									</select>
								</td>
							</tr>
							<tr>
								<td colspan="2" >
									<input type="button" value="确定" onclick="sub();" />
									<input type="button" value="取消" onclick="javascript:history.back();" />
								</td>
							</tr>
						</table>		
					</td>
				</tr>
			</table>
		</div>
	</s:form>
	</div>
	<br>
	<br>
	
  </body>
</html>
