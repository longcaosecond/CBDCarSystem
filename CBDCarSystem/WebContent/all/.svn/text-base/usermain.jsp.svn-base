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
<title>CBD停车管理平台首页</title>
<link rel="stylesheet" href="<c:url value='/css/global.css'/>"/>
</head>
<body>
	<%@ include file="../jsp/user/user_head.jsp"%>
	<div class="bannbg">
		<img class="bannbg_img" src="<c:url value='/images/bannbg51.jpg'/>"/>
		<div class="banner">
			<div class="quicknav">
				<span class="quktit">车位展示导航</span>
				<div class="quklogo">
					<a href=""><img src="<c:url value='/images/b1.png'/>" alt="" title="" /></a> 
					<a href=""><img src="<c:url value='/images/b2.png'/>" alt="" title="" /></a> 
					<a href=""><img src="<c:url value='/images/b3.png'/>" alt="" title="" /></a> 
					<a href=""><img src="<c:url value='/images/b4.png'/>" alt="" title="" /></a>
					<a href=""><img src="<c:url value='/images/b5.png'/>" alt="" title="" /></a> 
					<a href=""><img src="<c:url value='/images/b6.png'/>" alt="" title="" /></a> 
					<a href=""><img src="<c:url value='/images/b7.png'/>" alt="" title="" /></a>
				</div>
				<span class="qukmore"><a href="">MORE &gt;&gt;</a></span>
				<div class="clear"></div>
			</div>
			<div class="quilink">
				<a class="a1" href="<c:url value='/all/usermain.jsp'/>"></a> 
				<a class="a2" href="<c:url value='/all/buy.jsp'/>"></a>
				<a class="a3" href="<c:url value='/jsp/user/userInfo.jsp'/>"></a>
			</div>
		</div>
	</div>
	<%@ include file="../jsp/user/user_foot.jsp"%>
</body>
<script src="<c:url value='/js/jquery.js'/>"></script>
	<script>
		$(function() {
			$(".slvh").each(function() {
				var maxwidth = 28;
				if ($(this).text().length > maxwidth) {
					$(this).text($(this).text().substring(0, maxwidth));
					$(this).html($(this).html() + ' ...');
				}
			});
		});

		$(document).ready(function() {
			$(".ywzsdes").each(function() {
				var maxwidth = 140;
				if ($(this).text().length > maxwidth) {
					$(this).text($(this).text().substring(0, maxwidth));
					$(this).html($(this).html() + ' ...');
				}
			});
		});
	</script>
</html>