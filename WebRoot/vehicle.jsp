<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>Vehicle page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style>
		.main{
			border:0px #f00 solid;
			margin:0 auto;
		}
		span{
			display:block; 
			width:100px;
			float:left;
		}
		input{
		}
		form{
			width:500px;
			border:0px #0f0 solid;
			margin-left:auto;
			margin-right:auto;
		}
	</style>

	</head>

	<body>
	<center>
		<h2>西安机动车违法信息查询</h2>
		<div>
			西安
		</div>
	</center>
		<div>
		<div class="form" style="text-align: left">
			<form name="clwf" action="VehicleAction?method=query" method="post" method="post">
				<div>
					<span class="right_cx">号牌种类：</span>
					<select class="hpzl" name="hpzl">
						<option value="01">
							大型车辆
						</option>
						<option value="02" selected >
							小型车辆
						</option>
						<option value="15">
							挂车
						</option>
						<option value="16">
							教练汽车
						</option>
						<option value="23">
							警用汽车
						</option>
					</select>
				</div>
				<div>
					<span class="right_cx">号牌号码：</span>
					陕
					<input class="hphm" maxlength="6" size="6" value="A392D6" name="hphm">
				</div>
				<div>
					<span class="right_cx"> <select class="tj" id="tj" name="tj">
							<option value="FDJH" selected >
								发动机号
							</option>
							<option value="CLSBDH">
								车架号
							</option>
						</select> </span>
					<input size="12" name="tj_val" value="170450">
				</div>
				<div>
					<span class="right_cx">验证码：</span>
					<input maxlength="4" size="4" name="jdccode" style="width: 50px">
					<img title="点击更换" alt="点击刷新"
						src="VehicleAction?method=code"
						onclick=javascript:jdcrefresh(this);;
>
				</div>
				<br/>
				<div class="xxcxsubmit">
					<span>&nbsp;</span>
					<input type="submit" value="查询" style="width:100px;">
				</div>
			</form>
		</div>
		</div>
		<br>
		<br>
		<div class=main>
			${data}
		</div>
		
	


		<script>
	//原链接函数
	function clwfcx() {
		var hpzl = document.clwf.hpzl.value;
		var hphm = document.clwf.hphm.value;
		var jdccode = document.clwf.jdccode.value;
		var tj = document.clwf.tj.value;
		var tj_val = document.clwf.tj_val.value;
		var bl = true;
		if (hpzl == "") {
			alert("请选择号牌种类！");
			document.clwf.hpzl.focus();
			bl = false;
		} else if (hphm == "") {
			alert("请输入号牌号码！");
			document.clwf.hphm.focus();
			bl = false;
		} else if (tj_val == "") {
			alert("请输入所有人、发动机号或车架号！");
			document.clwf.tj_val.focus();
			bl = false;
		}
		if (jdccode == "") {
			alert("请输入验证码！");
			document.clwf.jdccode.focus();
			bl = false;
		}

		if (bl == true) {
			var url = "http://117.36.53.122:9081/wfcx/query.do?actiontype=vioSurveil&hpzl="
					+ hpzl
					+ "&hphm="
					+ hphm
					+ "&tj="
					+ tj
					+ "&tj_val="
					+ tj_val + "&jdccode=" + jdccode;
			// var url = "http://117.36.53.122:9082/wfcx/query.do?actiontype=vioSurveil&hpzl="+hpzl+"&hphm="+hphm+"&tj="+tj+"&tj_val="+tj_val;
			//var url = "http://192.168.0.4:9080/wfcx/query.do?actiontype=vioSurveil&vcode="+valCode+"&hpzl="+hpzl+"&hphm="+hphm+"&tj="+tj+"&tj_val="+tj_val;
			url = encodeURI(url);
			var windowheight = screen.height;
			var windowwidth = screen.width;
			windowheight = (windowheight - 768) / 2;
			windowwidth = (windowwidth - 1024) / 2;
			pop = window
					.open(
							url,
							"车辆违法查询",
							"resizable=yes,scrollbars=yes,status=yes,toolbar=no,menubar=no,location=no,directories=no,width=1024,height=768,top="
									+ windowheight + ",left=" + windowwidth);
			pop.focus();
		}
		// setTimeout(flashJdcValCode, 2000);
	}

	function jdcrefresh(obj) {
		obj.src = "http://117.36.53.122:9081/wfcx/imageServlet?"
				+ Math.random();
	}
	function jsrrefresh(obj) {
		obj.src = "http://117.36.53.122:9081/wfcx/jsrimageServlet?"
				+ Math.random();
	}
</script>


	</body>
</html>
