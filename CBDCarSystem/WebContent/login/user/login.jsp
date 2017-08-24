<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CBD停车场系统</title>
<link rel="stylesheet" href="<c:url value='css/style.css'/>" />
<style>
	body {
		height: 100%;
		background: #16a085;
		overflow: hidden;
	}
	canvas {
		z-index: -1;
		position: absolute;
	}
</style>
</head>
<body>
	<form id="loginform" action="login.do" method="post">
		<dl class="admin_login">
		<dt>
			<strong>CBD停车场系统登录</strong> <em>Management System</em>
		</dt>
		<dd class="user_icon">
			<input type="text" placeholder="账号" name="name" value="${sessionScope.userLoginName}"
				id="nametxt" class="login_txtbx" />
		</dd>
		<p id="nameHint" class="login_hint"></p>
		<dd class="pwd_icon">
			<input type="password" placeholder="密码" name="pwd" 
				id="pwdtxt" class="login_txtbx"/></br>
		</dd>
		<p id="pwdHint" class="login_hint" style="color: red">
				${sessionScope.loginErrotMsg}</p>
		<dd class="val_icon">
				<input type="text" id="J_codetext" placeholder="验证码" maxlength="6"
					class="checkcode login_txtbx">
			<input type="button" value="点击换图" class="ver_btn" onClick="validate();">
		</dd>
		<img id="yanzhenCodeImg" onClick="validate();">
		<span id="yanzhenHint" class="login_hint"></span>
		<dd class="login_txtbx type_radio">
			<label>用户类型:&nbsp;&nbsp;</label>
			<input type="radio" checked="checked" name="type" value="0"/> 个人&nbsp;&nbsp;
			<input type="radio" name="type" value="1"/> 企业
		</dd>
		<dd>
			<input type="submit" id="loginBtn" value="立即登录" class="submit_btn" 
					onClick="logincheck();"/>
		</dd>
		<dd>
			<button onClick="location.href='all/userReg.jsp'" class="submit_btn">注册用户</button>
		</dd>
		<dd>
			<p>© 2016-2017 lovo-J140-Team01 版权所有</p>
			<p>川A9-20170808-1</p>
		</dd>
	</dl>
	</form>
	
	<script src="<c:url value='js/jquery.js'/>"></script>
	<script src="<c:url value='js/Particleground.js'/>"></script>
	<script src="<c:url value='js/loginJ.js'/>"></script>
</body>
</html>