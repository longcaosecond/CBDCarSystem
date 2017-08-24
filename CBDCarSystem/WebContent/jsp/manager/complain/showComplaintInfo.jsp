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
<meta name="author" content="DeathGhost" />
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="css/showComplaintInfo.css">
<title>投诉详细信息中心</title>
</head>
<body>
<!--header-->
	<%@include file="../headmanager.jsp"%>
	<%@include file="../leftmanager.jsp"%>
<section class="rt_wrap content mCustomScrollbar">

 <!-- 显示投诉内容 -->
 <div class = "container" id = "total">
 <div class = "row" id = "row1">
 <h2 id = "biaoti">投诉详情处理中心</h2>
 </div>
 <div class = "row" id = "row5">
 <p class = "shangpai">车位详情：</p>
 </div>
 <div class = "row" id = "row8">
<table class = "table" id = "biao1">
<tr><td>车位小区地址</td><td>车位编号</td><td>租赁开始时间</td><td>租赁结束时间</td></tr>
<tr><td>${complaint.deal.rent.rentAddress}</td><td>${complaint.deal.rent.rentNumber}</td><td>${complaint.deal.dealStartDate}</td><td>${complaint.deal.dealEndDate}</td></tr>
</table>
 </div>
 <div class = "row" id = "row6">
 <p class = "shangpai">投诉人：</p>
 </div>
 <div class = "row" id = "row10">
 <table class = "table" id = "biao3">
<tr><td>用户名</td><td>真实姓名</td><td>身份证号码</td><td>职业</td><td>联系电话</td></tr>
<tr><td>${complaint.tUser.userAccount}</td><td>${complaint.tUser.userName}</td><td>${complaint.tUser.userCardId}</td><td>${complaint.tUser.userWork}</td><td>${complaint.tUser.userPhone}</td></tr>
<tr><td>投诉理由</td><td colspan="4">${complaint.complaintContent}</td></tr>
</table>
 </div>
 <div class = "row" id = "row7">
 <p class = "shangpai">被投诉人：</p>
 </div>
 <div class = "row" id = "row9">
 <table class = "table" id = "biao2">
<tr><td>用户名</td><td>真实姓名</td><td>身份证号码</td><td>职业</td><td>联系电话</td></tr>
<tr><td>${complaint.bUser.userAccount}</td><td>${complaint.bUser.userName}</td><td>${complaint.bUser.userCardId}</td><td>${complaint.bUser.userWork}</td><td>${complaint.bUser.userPhone}</td></tr>
</table>
 </div>
 <div class = "row" id = "row3">
 <input type = "button" class="btn btn-success" id = "btn" value = "成&nbsp;&nbsp;立"><input type = "button" class="btn btn-danger" id = "btn1" value = "不成立">
 </div>
 <div class = "row" id = "row4">
 </div>
 </div>
</section>
</body>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/showComplaintInfo.js"></script>
</html>