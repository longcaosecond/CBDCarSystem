<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<div class="headbg">
	<div class="header">
		<ul class="logareg" id="user">
		</ul>
		<div class="clear"></div>
		<img class="logo" src="<c:url value='/images/logo.png'/>" alt=""
			title="" />
		<ul class="topnav">
			<li class="jsp/topseled">
				<a href="<c:url value='/all/usermain.jsp'/>">首页</a></li>
			<li><a href="<c:url value='/jsp/user/vip/userout.jsp'/>">对外招租</a></li>
			<li><a href="<c:url value='/all/buy.jsp'/>">我要租赁</a></li>
			<li><a href="<c:url value='/jsp/user/userInfo.jsp'/>">个人中心</a></li>
		</ul>
		<div class="clear"></div>
	</div>
	<script src="<c:url value='/js/jquery-3.2.1.min.js'/>"></script>
	<script src="<c:url value='/js/user_head.js'/>"></script>
</div>
