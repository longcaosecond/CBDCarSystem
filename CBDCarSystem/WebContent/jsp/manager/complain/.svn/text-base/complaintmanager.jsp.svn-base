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
<link rel="stylesheet" type="text/css" href="css/complaintmanager.css">
<title>投诉受理管理</title>
</head>
<body>
<!--header-->
	<%@include file="../headmanager.jsp"%>
	<%@include file="../leftmanager.jsp"%>
<section class="rt_wrap content mCustomScrollbar">

 <!-- 显示投诉内容 -->
 <div class = "container" id = "total">
 <div class = "row" id = "row1">
 <h2 id = "biaoti">用户投诉管理中心</h2>
 </div>
 <div class = "row" id = "row2">
 <table class = "table" id = "info">
 <thead><tr><td>投诉人</td><td>被投诉人</td><td>投诉时间</td><td>受理</td></tr></thead>
 <tbody id = "biaoge">
 
</tbody>
 </table>
 </div>
 <div class = "row" id = "row3">
   <button id="begin" class="btn btn-white btn-xs">首页</button>
	<button id="prev" class="btn btn-white btn-xs">上一页</button>
	<span id="nowPage">1</span>&nbsp;/&nbsp; <span id="totpage">1</span>
	<button id="next" class="btn btn-white btn-xs">下一页</button>
	<button id="end" class="btn btn-white btn-xs">尾页</button>
 </div>
 <div class = "row" id = "row4">
 </div>
 </div>
</section>
</body>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/complaintmanager.js"></script>
</html>