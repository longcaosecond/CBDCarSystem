<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>

<div class="headbg">
	<div class="header">
		<ul class="logareg">
			<li>${enterprise.enterpriseName }</li>
			<li class="lineli">|</li>
			<li><a href="<c:url value='/exit.do'/>">注销</a></li>
		</ul>
		<img class="logo" src="<c:url value='/images/logo.png'/>" alt=""
			title="" />
	</div>
</div>
