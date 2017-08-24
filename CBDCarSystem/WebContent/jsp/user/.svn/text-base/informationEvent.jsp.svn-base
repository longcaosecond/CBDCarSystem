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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/css/bootstrap.css'/>" />
 <link rel="stylesheet" href="<c:url value='/css/global.css'/>" />
     <link rel="stylesheet" href="<c:url value='/css/userInfo.css'/>" />
      <link rel="stylesheet" href="<c:url value='/css/informationEvent.css'/>" />
</head>
<body>
<%@ include file="user_head.jsp" %>
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
<div class = "row" id = "row11">
<h1 id = "title">留言中心</h1>
</div>
<div class = "row" id = "row12">
<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" id = "nei11">
<p class="qianmian">&nbsp;&nbsp;&nbsp;车位地址：<span class = "info">${want.rent.rentAddress}</span></p>
</div>
<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" id = "nei12">
<p class="qianmian">车位号：<span class = "info">${want.rent.rentNumber}</span></p>
</div>
</div>
<div class = "row" id = "row13">
<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" id = "nei21">
<p class="qianmian">租赁开始时间：<span class = "info">${want.rent.rentStartDate}</span></p>
</div>
<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" id = "nei22">
<p class="qianmian">租赁结束时间：<span class = "info">${want.rent.rentEndDate}</span></p>
</div>
</div>
<div class = "row" id = "row14">
<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" id = "nei31">
<p class="qianmian">抢租客用户名：<span class = "info">${want.user.userAccount}</span></p>
</div>
<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" id = "nei32">
<p class="qianmian">抢租客职业：<span class = "info">${want.user.userWork}</span></p>
</div>
</div>
<div class = "row" id = "row15">
<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" id = "nei31">
<p class="qianmian">抢租客电话：<span class = "info">${want.user.userPhone}</span></p>
</div>
<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" id = "nei32">
<p class="qianmian">抢租客信誉度：<span class = "info">${want.user.userCredit}</span></p>
</div>
</div>
<div class = "row" id = "row16">
<p id="message">抢租客留言：<span class = "info">${want.wantMessage}</span></p>
</div>
<div class = "row" id = "row17">
<input type = "button" class="btn btn-success" id = "btn" value = "同意"><input type = "button" class="btn btn-danger" id = "btn1" value = "拒绝"><input type = "button" class="btn btn-info" id = "btn2" value = "返回">
<p id = "chuzu">${yizuchu}</p>
</div>
</div>
</div>
</div>
<%@ include file="user_foot.jsp" %>
</body>
<script src="<c:url value='/js/jquery-3.2.1.min.js'/>"></script>
<script src="<c:url value='/js/informationEvent.js'/>"></script>
</html>