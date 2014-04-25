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
			return ;
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
	  		console.log(word);
		}
		
		function selectParentSub(obj){
			var checked = $(obj).attr("checked")=="checked" ? true:false;
			console.log("checked = "+checked);
			$(obj).parent().children("input:checkbox").each(function(){
			    if ('' != $(this).attr("value")) {
				console.log( $(this).attr("value") );
			         $(this).attr('checked', checked); 
			    }
			});
		}
		
		function addDiyDom(treeId, treeNode) {
			if( treeNode.pId == undefined)
				return;
			var aObj = $("#" + treeNode.tId + IDMark_A);
			var editStr = "<span id=uivd_node_"+treeNode.id+" >";
			editStr +="<input type=checkbox value='i' />增加 &nbsp;";
			editStr +="<input type=checkbox value='u' />修改 &nbsp;";
			editStr +="<input type=checkbox value='d' />删除 &nbsp;";
			editStr +="<input type=checkbox value='v' />查看详情&nbsp;";
			editStr +="<input type=checkbox value='' onclick=\"selectParentSub(this)\" />全选&nbsp;";
			editStr +="</span>";
			aObj.append(editStr);

			if( treeNode.rulerWord != undefined && treeNode.rulerWord!="null"){
				var word = treeNode.rulerWord.split("");
				for(var j=0; j<word.length; j++)
					$("#uivd_node_"+treeNode.id).children("input:checkbox[value='"+word[j]+"']").attr("checked",  true);
			}
			  
		}
		
		var array=eval("(${rightString})");
		
		var zNodes =array.array;
		
		$(document).ready(function(){
			$("#rid").val(array.id);
			$("#rname").val(array.name);
			$.fn.zTree.init($("#rulerTree"), setting, zNodes);
		});
		
		function sub(){
			if(confirm("确定提交修改吗？")){
				
				var treeObj = $.fn.zTree.getZTreeObj("rulerTree");
				var nodes = treeObj.getCheckedNodes(true);
				var str="";
				var tmp = "";
				for(var i=0;i<nodes.length;i++){
					tmp = "";
					tmp +=nodes[i].id+",";
					if( nodes[i].rulerWord == "undefined")
						tmp +=";";
					else
						tmp +=nodes[i].rulerWord+";";
					str += tmp;
					console.log(nodes[i].name+": "+tmp);
				}
				
				$("#rightString").val(str);
				
				document.forms[0].submit();
			}
		}
		
		function selectAll(obj, wd){
			var checked = $(obj).attr("checked")=="checked" ? true:false;
			console.log("checked="+checked);
			var treeObj = $.fn.zTree.getZTreeObj("rulerTree");
			/*
			//遍历属性
			for(var p in treeObj){
			 	if(typeof(treeObj[p])=="function")
				 	console.log(p+"()");
				 else
				 	console.log(p);
			}
			*/
			var nodes = treeObj.getNodes();
		//	console.log(nodes);
			/*
			//遍历属性
			for(var p in nodes[0]){
			 	if(typeof(nodes[0][p])=="function")
				 	console.log(p+"()");
				 else
				 	console.log(p);
			}
			*/
			if(wd==''){
				treeObj.checkAllNodes(checked);
				$(".ztree input[type=checkbox]").attr("checked",  checked);
			}else if(wd=='readonly'){
				treeObj.checkAllNodes(checked);
				$(".ztree input[type=checkbox]").attr("checked",  false);
			}else{
				$(".ztree input:checkbox[value='"+wd+"']").attr("checked",  checked);
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
  
  	<s:form action="RoleAction?method=update" method="post" theme="simple">
		<div id="con" style="width:800px;">
			
			<input type="hidden" id="rid" name="roleInfo.roleId"  value="${r_id}"/>
			
			<input type="hidden" id="rightString" name="rightString" />
			
			
			<table id="table-data-outter">
				<tr>
					<td>
						<table id="table-data-inner" cellspacing="1">
							<tr id="tr-title"><td colspan="2">修改角色</td></tr>
							<tr>
								<td width="10%" class="field-title">角色名称:</td>
								<td width="30%" class="field-content"><s:textfield id="rname" name="roleInfo.roleName"></s:textfield></td>
							</tr>
							<tr>
								<td colspan="2">
									<div class="content_wrap">
										<div class="zTreeDemoBackground right">
											<div style="width:500px;">
												<input type="checkbox" onclick="selectAll(this,'');" />全选  
												<input type="checkbox" onclick="selectAll(this,'readonly');" />只读全选  
												&nbsp; 
												<input type="checkbox" onclick="selectAll(this,'i');" />[增加]全选 
												&nbsp; 
												<input type="checkbox" onclick="selectAll(this,'u');" />[修改]全选  
												&nbsp; 
												<input type="checkbox" onclick="selectAll(this,'d');" />[删除]全选  
												&nbsp; 
												<input type="checkbox" onclick="selectAll(this,'v');" />[查看详情]全选  
											</div>
											<ul id="rulerTree" class="ztree" style="width:500px;" ></ul>
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
