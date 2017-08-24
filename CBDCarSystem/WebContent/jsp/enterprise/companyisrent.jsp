<%@ page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>企业用户</title>
<link rel="stylesheet" href="<c:url value='/css/bootstrap.css'/>"/>
<link rel="stylesheet" href="<c:url value='/css/global.css'/>" />
</head>
<body onload="showRentCar()">
	<div class="headbg">
	<div class="header">
		<ul class="logareg">
			<li id="userNamelc">${sessionScope.enterprise.enterpriseAccount}</li>
			<li class="lineli">|</li>
			<li><a href="<c:url value='/exit.do'/>">注销</a></li>
		</ul>
		<div class="clear"></div>
		<img class="logo" src="<c:url value='/images/logo.png'/>" alt=""
			title="" />
		<div class="clear"></div>
	</div>
</div>
	<div class="container">
		<div class="con_jxinf">
			<div class="title" >
				<button style="margin-left:160px;margin-top:10px" class="btn button_sear">修改信息</button>
				<div class="suosuo">
					<button id="allrentlcRent" class="btn button_sear">查看所有</button>
				</div>
 			</div>
				<div style="height:250px;backgroundcolor:red">
					<table class="table table-hover">
						<tr align="center">
							<td>序列</td>
							<td>车位编号</td>
							<td>车位位置</td>
							<td>合同开始时间</td>
							<td>合同结束时间</td>
						</tr>
				 		<tbody id="companyCarTbodyRent">
							
						</tbody>
					</table>
				</div>
				<div class="pagination">
					<button id="first">首页</button>
					<button id="prev">上页</button>
					<button id="next">下页</button>
					<button id="last">尾页</button>
					<input type="text" id="goes" value="1" />&nbsp;/&nbsp; 			<span id="totpage">1</span>
					<button id="gopage">跳转</button>
				</div>
		</div>
	</div>
<script src="<c:url value='/js/foregroundSystem/showCompanyCar.js'/>"></script>
<script src="<c:url value='/js/jquery-3.2.1.js'/>"></script>
<script src="<c:url value='/js/bootstrap.js'/>"></script>
<script src="<c:url value='/js/jQselect.js'/>"></script>
</body>
</html>