<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>CBD停车管理平台后台系统</title>
	<link rel="stylesheet" href="css/bootstrap.css">
	<style type="text/css">
		.row{
			height:200px;
			margin-top: 2%
		}
		.col-lg-6{
           
            margin-left: 25%;
            margin-top:10%;
            background-color: white;
            align:center;
            border:1px solid gold;
        }
        .container{
        	background-image:url('images/index.jpg');
        	background-repeat:no-repeat;
        	background-size:100%;
        	height: 670px
        }
	</style>		
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-lg-6" >			
				<h1 align="center" >CBD停车管理平台后台系统</h1><hr>				
				<div  class="col-lg-4" style="height: 160px;margin-top: 55px">
					<img alt="" src="images/Photo.png" width="100%" height="100%">				
				</div>
				
			<div  class="col-lg-7">
				<h3 style="margin-left: 20%">用户登录</h3>
				<form action="managerLogin.do" id="myform" method="post">
					<table class="table" style="border:none">
						<tr>
							<th style="width: 70px;height: 30px">用户名</th>
							<td>
								<input type="text" id="userName" name="name"  onblur="checkUserName()" placeholder="请输入用户名"><span id="nameSpan" ></span>								
							</td>
						</tr>	
						<tr>
							<th>密码</th>
							<td>
								<input type="password" id="userPwd" name="pwd"  onblur="checkUserPwd()" placeholder="请输入6-16位数字或字母"><span id="nameSpan"></span>
							</td>
						</tr>
						<tr>						
							 <th>验证码</th>
							 <td>
							 	<input type="text" id="Yanzhengma" name="Yanzhengma" onblur="checkYanZhengMa()" placeholder="请输入6位验证码">
							 	<img src="getYanzhangma.do" width="100px" height="30px" id="captchaImage" style='margin-top: 10px'>
								<label><a href="javascript:flushcaptchaImage()">换一个</a></label>
							 </td>							 
						</tr>						
						<tr align="center">							
							<td colspan="2">
								<input type="button" value="登录" id="loginBtn"  class="btn btn-primary"style="width: 100px;height: 30px">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="reset" value="取消" id="registBtn" class="btn btn-primary" style="width: 100px;height: 30px">
							</td>
						</tr>
						<tr>
							<td colspan="2" align="center"><span id="yanzhangmaSpan" style="color:red">${sessionScope.errorMsg}</span></td>					
						</tr>				
					</table>		
				</form>
			</div>
		</div>			
		</div>
	</div>
</body>
	<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="js/login.js"></script>
	<script type="text/javascript">
		$("#captchaImage").on('click',function(){
			$("#captchaImage").attr("src","getYanzhangma.do?timestamp="+(new Date()).valueOf());
		});
		//刷新生成验证码
		function flushcaptchaImage()
		{
			$("#captchaImage").attr("src","getYanzhangma.do?timestamp="+(new Date()).valueOf());
		}
	</script>
</html>