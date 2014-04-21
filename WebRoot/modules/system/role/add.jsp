<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    
    <title>role query</title>
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
	
	<style>
		.ztree li{ margin-top:5px; }
	</style>

	<script type="text/javascript">

	var IDMark_Switch = "_switch",
		IDMark_Icon = "_ico",
		IDMark_Span = "_span",
		IDMark_Input = "_input",
		IDMark_Check = "_check",
		IDMark_Edit = "_edit",
		IDMark_Remove = "_remove",
		IDMark_Ul = "_ul",
		IDMark_A = "_a";
		
		var array=eval("(${rightString})");
		
		function zTreeOnCheck(event, treeId, treeNode){
			if(treeNode.checked)
				zTreeOnClick(event, treeId, treeNode);
		}
		function zTreeOnClick(event, treeId, treeNode) {
			var treeObj = $.fn.zTree.getZTreeObj("rulerTree");
			treeObj.setting.callback.onClick=null; 
			treeObj.setting.callback.onCheck=null; 
		    var rt=window.showModalDialog("modules/role/iuvd.jsp",treeNode.rulerWord,"dialogHeight:50px;dialogWidth:300px;help:no;status:no")
		    
		    if(rt && rt!="no"){
		    	treeNode.rulerWord=rt;
				var nodes = treeObj.getNodesByParam("pId", treeNode.id, null);
		    	for(var i=0;i<nodes.length;i++){
		    		nodes[i].rulerWord=rt;
		    	}
		    }
		    
		    treeObj.setting.callback.onClick=zTreeOnClick; 
			treeObj.setting.callback.onCheck=zTreeOnCheck; 
		};
		
		var zNodes =array.array;
		
		var setting = {
			check: {
				enable: true
			},
			data: {
				simpleData: {
					enable: true
				}
			},
			view: {
				addDiyDom: addDiyDom
			},
			callback: {
				onClick: zTreeOnClick2,
				onCheck: zTreeOnCheck2
			}
		};
		
		function zTreeOnCheck2(event, treeId, treeNode){
			var treeObj = $.fn.zTree.getZTreeObj("rulerTree");
			if(true){
				var uivd = "uivd_node_"+treeNode.id;
				$("#"+uivd).children('input:checkbox').attr("checked",  treeNode.checked);
				if(treeNode.checked)
					treeNode.rulerWord = "uivd";
				else
					treeNode.rulerWord = "";
				
				if(treeNode.pId<1){
					var nodes = treeObj.getNodesByParam("pId", treeNode.id, null);
			    	for(var i=0;i<nodes.length;i++){
			    		uivd = "uivd_node_"+nodes[i].id;
						$("#"+uivd).children('input:checkbox').attr("checked",  treeNode.checked);
						if(treeNode.checked)
				    		nodes[i].rulerWord = "uivd";
				    	else
				    		nodes[i].rulerWord = "";
			    	}
				}
			}
		}
		
		function zTreeOnClick2(event, treeId, treeNode){
			var uivd = "uivd_node_"+treeNode.id;
			var word="";
			var v= $("#"+uivd).children('input:checkbox:checked');
	  		for(var i=0;i<v.length;i++){
	  			word += v[i].value;
	  		}
	  		treeNode.rulerWord = word;
		}
		
		function addDiyDom(treeId, treeNode) {
			if( treeNode.pId == undefined)
				return;
			var aObj = $("#" + treeNode.tId + IDMark_A);
			var editStr = "<span id=uivd_node_"+treeNode.id+" >";
			editStr +="<input type=checkbox value='i' />增加 &nbsp;";
			editStr +="<input type=checkbox value='d' />删除 &nbsp;";
			editStr +="<input type=checkbox value='u' />修改 &nbsp;";
			editStr +="<input type=checkbox value='v' />查看详情&nbsp;";
			editStr +="</span>";
			aObj.append(editStr);
		}
		
		$(document).ready(function(){
			$.fn.zTree.init($("#rulerTree"), setting, zNodes);
		});
		
		function sub(){
			if($("#rname").val()==null || trim($("#rname").val())==""){
				alert("角色名称不能为空 ！");
				return;
			}

			if(confirm("确定提交吗？")){
				
				var treeObj = $.fn.zTree.getZTreeObj("rulerTree");
				var nodes = treeObj.getCheckedNodes(true);
				var str="";
				for(var i=0;i<nodes.length;i++){
					
					str+=nodes[i].id+",";
					str+=nodes[i].rulerWord+";";
				}
				
				$("#rightString").val(str);
				
				document.forms[0].submit();
			}
		}
	</script>
  </head>
  
  <body>
 
 
 	<!-- 返回 -->
		<div class="menu-path">
			<a href="${goBackUrl }">
			<img class="goback" src="images/button/back.png" title="返回" style="cursor:pointer "></img></a>
			 当前位置:&nbsp;组织管理 &gt; 角色管理
		</div>
  
  	<s:form action="RoleAction?method=add" method="post" theme="simple">
		<div id="con" style="width:600px;">
			
			<input type="hidden" id="rightString" name="rightString" />
			<table id="table-data-outter">
				<tr>
					<td>
						<table id="table-data-inner" cellspacing="1">
							<tr id="tr-title"><td colspan="2">添加角色</td></tr>
							<tr>
								<td width="10%" class="field-title">角色名称:</td>
								<td width="30%" class="field-content"><s:textfield id="rname" name="roleInfo.roleName"></s:textfield></td>
							</tr>
							<tr>
								<td colspan="2">
									<div class="content_wrap" >
										<div class="zTreeDemoBackground right">
											<ul id="rulerTree" class="ztree" style="width:400px;"></ul>
										</div>
									</div>
									<br/>
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
  </body>
</html>
