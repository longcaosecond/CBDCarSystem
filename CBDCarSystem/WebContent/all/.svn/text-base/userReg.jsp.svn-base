<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户注册</title>
    <link rel="stylesheet" href="<c:url value='/css/bootstrap.css'/>"/>
    <link rel="stylesheet" href="<c:url value='/css/registS.css'/>"/>
</head>
<body>
	<form id="contDiv" action="regist.do" method="post" onsubmit="return checkAll()">
		<p class="claInfoTitle">注册新用户</p>
		<div class="form-group info">
			<label class="col-xs-4 col-sm-4 col-md-4 col-lg-4 control-label">用户名</label>
			<input type="text" id="nametxt" name="userAccount" class="form-control">
			<span id="nameHint"></span><br /> 
			<label class="col-xs-4 col-sm-4 col-md-4 col-lg-4 control-label">密码</label>
			<input type="password" id="pwdtxt" name="userPwd" class="form-control"> 
			<span id="pwdHint"></span><br />
			<label class="col-xs-4 col-sm-4 col-md-4 col-lg-4 control-label">重复密码</label>
			<input type="password" id="pwdagain" class="form-control"> 
			<span id="pwd2Hint"></span><br /> 
			<label class="col-xs-4 col-sm-4 col-md-4 col-lg-4 control-label">真实姓名</label>
			<input type="text" id="realname" name="userName" class="form-control"> 
			<span id="realNameHint"></span><br /> 
			<label class="col-xs-4 col-sm-4 col-md-4 col-lg-4 control-label">身份证号</label>
			<input type="text" id="cardidtxt" name="userCardId" class="form-control"> 
			<span id="cardHint"></span><br /> 
			<label class="col-xs-4 col-sm-4 col-md-4 col-lg-4 control-label">家庭地址</label>
			<input type="text" id="addrestxt" name="userAddress" class="form-control"> 
			<span id="addresHint"></span><br />
			<label class="col-xs-4 col-sm-4 col-md-4 col-lg-4 control-label">工作单位</label>
			<input type="text" id="worktxt" name="userWork" class="form-control"> 
			<span id="workHint"></span><br />
			<label class="col-xs-4 col-sm-4 col-md-4 col-lg-4 control-label">手机号码</label>
			<input type="text" id="phonetxt" name="userPhone" class="form-control"> 
			<span id="phoneHint"></span><br />
			<label class="col-xs-4 col-sm-4 col-md-4 col-lg-4 control-label">邮箱地址</label>
			<input type="text" id="emailtxt" name="userEmail" class="form-control"> 
			<span id="emailHint"></span>
		</div>
		<input type="submit" id="addBtn" class="btn btn-info" value="提交" />
	</form>
    <script src="<c:url value='/js/jquery.js'/>"></script>
    <script src="<c:url value='/js/registJ.js'/>"></script>
	<script src="<c:url value='/js/verificationNumbers.js'/>"></script>
	<script src="<c:url value='/js/Particleground.js'/>"></script>
    <script>
		$(document).ready(function() {
		  //粒子背景特效
		  $('body').particleground({
		    dotColor: '#5cbdaa',
		    lineColor: '#5cbdaa'
		  });
		});
	</script>
</body>
</html>