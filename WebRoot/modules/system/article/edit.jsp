<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    
    <title>article add</title>
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
	
	<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
	<script type="text/javascript" src="ckeditor/config.js"></script>
	<script type="text/javascript" src="ckeditor/style.js"></script>
	<script type="text/javascript" src="ckeditor/plugins/images/dialogs/image.js"></script>
	
	<style>
		.errorMessage{
			width:200px;
			color:red;
		}
	</style>
	
	<script type="text/javascript">
		function save(flag){
			var tokenName = $("input[name='struts.token.name']").val();
			var token = $("input[name='"+tokenName+"']").val();
			var id = $("input[name='articleInfo.id']").val();
			var category = $("select[name='articleInfo.category']").val();
			var title = $("input[name='articleInfo.title']").val();
			var introduction = $("textarea[name='articleInfo.introduction']").val();
			var titlePicture = $("input[name='articleInfo.titlePicture']").val();
			var content = CKEDITOR.instances.editor1.getData();
			if(flag)
			{
				if(category<1){
					alert("请选择类别");
					$("select[name='articleInfo.category']").focus();
					return ;
				}
				if($.trim(title)==""){
					alert("请填写标题");
					$("input[name='articleInfo.title']").focus();
					return ;
				}
			}
			$("#msg").html("正在保存...");
			$.ajax({
				type:"post",
				url:"ArticleAction?method=save",
				data:{
						"articleInfo.id" : id,
						"struts.token.name": tokenName,
						token: token,
						"articleInfo.status": flag,
						"articleInfo.category": category,
					  	"articleInfo.title": title,
					  	"articleInfo.introduction": introduction,
					  	"articleInfo.titlePicture": titlePicture,
					  	"articleInfo.content": content,
					} ,
				dataType: "json",
				success:function(data){
					if(data.error==0){
						$("input[name='articleInfo.id']").val(data.id);
						$("#msg").html("保存成功");
						if(flag==1){
							alert("保存成功,正在跳转...");
							window.location.href = "ArticleAction?id="+data.id;
						}
					}
					else{
						$("#msg").html("保存失败");
						if(flag)
							alert("保存失败");
					}
				}
			});
		}
	</script>
  </head>
  
  <body>
  
  <!-- 返回 -->
		<div class="menu-path">
			<a href="${action}?">
			<img class="goback" src="images/button/back.png" title="返回" style="cursor:pointer "></img></a>
			当前位置:&nbsp;文章管理 &gt; 文章添加
		</div>
	
	<div style="margin-left:auto;margin-right:auto;">
  	<s:form action="UserAction?method=add" method="post" theme="simple">
		<div id="con" style="width:900px;height:700px;">
			<table id="table-data-outter">
				<tr>
					<td>
						<table id="table-data-inner" cellspacing="1">
							<tr id="tr-title">
								<td colspan="2">
									添加文章
								<span style="margin-left:10px;color:#f00;">${msg}</span>
								</td>
							</tr>
							<tr >
								<td width="100%" class="" colspan="2">
								
								<s:token></s:token>
								<input type="hidden" name="articleInfo.id" value="${articleInfo.id}" />
								
								
									<select name="articleInfo.category" >
										<option value="0">请选择类别...</option>
										<s:iterator id="l" value="CategoryList" status="index"> 
											<option value="<s:property value="#l.id" />"><s:property value="#l.categoryName" /></option>
										</s:iterator>
									</select>
									标题:
									<input type="text" name="articleInfo.title" value="${articleInfo.title}" maxlength="200" style="width:560px; height:20px;"/>
									<span class="requied" >*</span>
									<span id="msg" style="color:#f00;"></span>
								</td>
							</tr>
							
							<tr style="display: none;">
								<td width="80%" class="" colspan="1">
									简介：<br/>
									<textarea name="articleInfo.introduction" rows="6" cols="100">${articleInfo.introduction}</textarea> 
								 </td>
								 <td width="20%" class="" colspan="1">
									主图：<br/>
									<input name="articleInfo.titlePicture" type="hidden" value="${articleInfo.titlePicture }" />
									<img src="${articleInfo.titlePicture }" for="articleInfo.titlePicture" style="width:120;height:100px;"/>
									<input type="button" value="..." class="button" onclick="chooserPhoto()" />
								 </td>
							</tr>
							<tr style="">
								<td width="100%" class="" colspan="2">
									<textarea style="height:500px;" class="ckeditor" name="editor1">${articleInfo.content }</textarea> 
								 </td>
							</tr>
							<tr>
								 <td width="100%" class="" colspan="2">
									上传附件：<br/>
									<div style="height:100px;">
										<iframe src="modules/file/uploadframe.jsp?callback=InsertContext" 
											style="border:1px solid #000;width:80%;height:100%;"></iframe>
									</div>
									<script>
										function InsertContext(html){
											var oEditor = CKEDITOR.instances.editor1;
											oEditor.insertHtml( html );
										}
									</script>

								 </td>
							</tr>
								
							<tr>
								<td colspan="2" >
									<br/>
									&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="button" class="button" value="发表" onclick="save(1);" />
									&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="button" class="button" value="存稿" onclick="save(2);" />
									&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="button" class="button" value="取消" onclick="javascript:history.back();" />
								</td>
							</tr>
						</table>		
					</td>
				</tr>
			</table>
		</div>
	</s:form>
	
	</div>
	<div style="display:none;">
		<form action="UploadAction?callback=titleCallback"  method="post" ENCTYPE="multipart/form-data" target="_hidden_frame" >
			<input type=file name=file onchange="uploadPhoto(this);" />
			<input type="text" name="dir"  value="user/photos" /><br>
		</form>
		<iframe name="_hidden_frame"></iframe>
	</div>	
	
 <script type="text/javascript">
 
 		$("select[name='articleInfo.category']").val(${articleInfo.category});

  		function uploadPhoto(obj){
  			$(obj).parent().submit();
  		}
  		
  		function titleCallback(json){
			if(json.error==0){
				if(json.data.length>=1){
					$("input[name='articleInfo.titlePicture']").val(json.data[0].path);
					$("img[for='articleInfo.titlePicture']").attr("src",json.data[0].path);
				}
			}
		}
  		
  		function chooserPhoto(){
  			$("input[name=file]").click();
  		}
  		
  </script>
	
  </body>
</html>
