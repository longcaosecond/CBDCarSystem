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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="description" content="我要租赁" />
<title>没有权限</title>
<link rel="stylesheet" href="<c:url value='/css/bootstrap.css'/>" />
<link rel="stylesheet" href="<c:url value='/css/global.css'/>" />

<script src="<c:url value='/js/jquery-3.2.1.min.js'/>"></script>

<!--[if lt IE 7]>
<script type="text/javascript" src="js/unitpngfix.js"></script>
<![endif]-->
</head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="description" content="没有权限" />

<!--[if lt IE 7]>
<script type="text/javascript" src="js/unitpngfix.js"></script>
<![endif]-->
</head>
<style>
.fontSize{
font-size:32px;
}
.fontSize:hover{
cursor:pointer;
color:blue
}
</style>
<body>
<%@ include file="../jsp/user/user_head.jsp"%>

<div class="container">
  <div  style="text-align:center;margin-top:50px"><img style="width:450px" src="<c:url value='/images/nopower.jpg'/>"></div>
  <div style="text-align:center;"><h1><span class="fontSize" id="esc">切换账号</span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="fontSize" id="backPage">返回</span></h1></div>
</div>
</body>
<script>
	$("#esc").click(function(){
		location.href="exit.do";
	});
	$("#backPage").click(function(){
		window.history.back();
		location.reload();
	});
	</script>
</html>
