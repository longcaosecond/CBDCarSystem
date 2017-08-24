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
      <link rel="stylesheet" href="<c:url value='/css/userInfoEvent.css'/>" />
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
<div class = "row" id = "row111">
<h2 id = "biaoti">用户投诉中心</h2>
</div>
<div class = "row" id = "row112">
<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" id = "nei11">
<p class = "info">&nbsp;&nbsp;车位地址：<span class = "event">${deal.rent.rentAddress}</span></p>
</div>
<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" id = "nei12">
<p class = "info">车位号：<span class = "event">${deal.rent.rentNumber}</span></p>
</div>
</div>
<div class = "row" id = "row113">
<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" id = "nei21">
<p class = "info">租赁开始时间：<span class = "event">${deal.dealStartDate}</span></p>
</div>
<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" id = "nei22">
<p class = "info">租赁结束时间：<span class = "event">${deal.dealEndDate}</span></p>
</div>
</div>
<div class = "row" id = "row114">
<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" id = "nei31">
<p class = "info">租赁价格：<span class = "event">${deal.dealPrice}/月</span></p>
</div>
</div>
</div>
<div class = "row" id = "row12">
<div class = "row" id = "row21">
<p id = "tousu">请出入您要投诉的内容：</p>
</div>
<form action = "<c:url value='/wantInfo.do'/>" method="post" id = "myform">
<div class = "row" id = "row22">
<p id = "neirong"><textarea class="form-control" rows="4" name = "complaintContent" id = "message" onblur="checkNeiRong()"></textarea></p>
<p id = "xuqiu"></p>
</div>
<div class = "row" id = "row23">
<input type = 'submit' class='btn btn-info' id = 'btn' value = '提交'>
</div>
</form>
</div>
</div>
</div>
</div>
<%@ include file="user_foot.jsp" %>
</body>
<script src="<c:url value='/js/jquery-3.2.1.min.js'/>"></script>
<script src="<c:url value='/js/dealInfoEvent.js'/>"></script>
</html>