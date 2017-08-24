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
<title>资料管理</title>
      <link rel="stylesheet" href="<c:url value='/css/bootstrap.css'/>" />
      <link rel="stylesheet" href="<c:url value='/css/global.css'/>" />
     <link rel="stylesheet" href="<c:url value='/css/userInfo.css'/>" />
      <link rel="stylesheet" href="<c:url value='/css/changeInfo.css'/>" />
</head>
<body>
<%@ include file="user_head.jsp" %>
<form method="post" action ="<%=request.getContextPath()%>/changeUserInfo.do?userId=${user.userId}" id = "tijiao">
<div class = "container" id = "total">
<div class = "row" id = "row1">
<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3 " id = "fen11">
<div id = "nei1">
<p id = "qian">管理平台</p>
</div>
</div>
<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3 " id = "fen12">
<p class = "wai"><a href="<c:url value='/jsp/user/userInfo.jsp'/>"><span class = "shang">个人中心</span></a></p>
</div>
<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3 " id = "fen13">
<p class = "wai"><a href="<c:url value='/jsp/user/changeInfo.jsp'/>"><span class = "shang">资料管理</span></a></p>
</div>
</div>
<div class = "row" id = "row2">
</div>
<div class = "row" id = "row3">
<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 " id = "fen21">
<div class = "row" id = "row4">
  <p class = "zuo"><a href="<c:url value='/jsp/user/userInfo.jsp'/>"><span id = "hang1">个人中心</span></a></p>
</div>
<div class = "row" id = "row8">
 <p class = "zuo1"><a href="<c:url value='/jsp/user/changePwd.jsp'/>"><span id = "hang4">修改密码</span></a></p>
</div>
<div class = "row" id = "row5">
 <p class = "zuo1"><a href="<c:url value='/jsp/user/dealInfo.jsp'/>"><span id= "hang2">我要投诉</span></a></p>
</div>
<div class = "row" id = "row6">
 <p class = "zuo1"><a href="<c:url value='/jsp/user/information.jsp'/>"><span id = "hang3">信息中心</span></a></p>
</div>
</div>
<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 " id = "fen22">

</div>
<div class="col-lg-9 col-md-9 col-sm-9 col-xs-9" id = "fen23">
<div class = "row" id = "row21">
<p id = "biaoti">个人资料</p>
</div>
<div class = "row" id = "row22">
<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" id = "fen31">
<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2" id = "fen311">
<span class = "qianti">账号</span>
</div>
<p id = "userAccount">${user.userAccount}</p>
</div>
<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" id = "fen32">
<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2" id = "fen312">
<span class = "qianti">姓名</span>
</div>
<p id = "userAccount">${user.userName}</p>
</div>
</div>
<div class = "row" id = "row23">
<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" id = "fen41">
<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2" id = "fen411">
<span class = "qianti">身份证号码</span>
</div>
<p id = "userNumber">${user.userCardId}</p>
</div>
<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" id = "fenxx">
<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2" id = "fenxxx">
<span class = "qianti">注册时间</span>
</div>
<p id = "userDate">${user.userDate}</p>
</div>
</div>
<div class = "row" id = "row24">
<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" id = "fen42">
<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2" id = "fen412">
<span class = "qianti">信誉</span>
</div>
<p id = "userCredit">${user.userCredit}</p>
</div>
<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" id = "fen52">
<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2" id = "fen512">
<span class = "qianti">工作</span>
</div>
<input type="text" class="form-control" value = "${user.userWork}" name = "userWork" id="userWork" onblur="checkWork()">
<p class="tishi" id = "work"></p>
</div>
</div>
<div class = "row" id = "row25">
<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" id = "fen61">
<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2" id = "fen611">
<span class = "qianti">电话</span>
</div>
<input type="text" class="form-control" value = "${user.userPhone}" name = "userPhone" id="userPhone" onblur="checkPhone()">
<p class="tishi" id = "phone"></p>
</div>
<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" id = "fen62">
<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2" id = "fen612">
<span class = "qianti">邮箱</span>
</div>
<input type="text" class="form-control" value = "${user.userEmail}" name = "userEmail" id="userEmail" onblur="checkEmail()">
<p class="tishi" id = "email"></p>
</div>
</div>
<div class = "row" id = "row26">
<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" id = "fen51">
<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2" id = "fen511">
<span class = "qianti">住址</span>
</div>
<input type="text" class="form-control" value = "${user.userAddress}"name = "userAddress" id="userHome" onblur="checkHome()">
<p class="tishi" id = "home"></p>
</div>
</div>
<div class = "row" id = "row27">
<input type = "submit" class="btn btn-info" id = "btn" value = "修改">
</div>
</div>
</div>
</div>
</form>
<%@ include file="user_foot.jsp" %>
</body>
<script src="<c:url value='/js/jquery-3.2.1.min.js'/>"></script>
<script src="<c:url value='/js/changeInfo.js'/>"></script>
</html>