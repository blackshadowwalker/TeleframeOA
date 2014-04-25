<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
	<head>
		<style>
			.search{
				background : #fff url(index/images/ico_sear_top.gif) no-repeat 130px 2px;
				border: solid 1px #ccc;
			}
		</style>
	</head>
	<body>
		<div>&nbsp; 
		
				<span name="userspan">
				
			        <a href="UserAction?method=personal"  >
			        	<s:property value="#session.user.userName" />
			        </a>
			        
			        (<s:property value="#session.user.userRoleName" />)
			        |
					<span>
						<a href="UserLoginAction?method=logout">
						退出
						</a>
					</span>
				
			    </span>
			    
			    <span name="loginspan">
					<span> <a href="index/login.jsp"> 登录  </a></span>
					|
					<span> <a href="#"> 注册  </a></span>
				</span>
				|
				<span name="">
					<a href="HelpAction?flag=1" style="cursor:help">帮助?</a>	
				</span>
				|
			<span>
				<input type="text" name="passwordtwo" class="search" value="搜索" 
						onfocus="if(this.value=='搜索') this.value='';this.style.color='#333'; return true;" 
						onblur="if(this.value=='') this.value='搜索'; this.style.color='#999'; return true;" 
						id="search" style="color: rgb(153, 153, 153);">
				
			</span>
		</div>
		
		 <script>
	     	$(document).ready(function(){
	     		var test = "<s:property value="#session.user.userName" />";
				if(test ==""){
					$("span[name='userspan']").hide();
					console.log("username is emputy");
				}else{
					$("span[name='loginspan']").hide();
					console.log("username is not emputy");
				}
	    	});
	     </script>
     
     
	</body>
</html>
