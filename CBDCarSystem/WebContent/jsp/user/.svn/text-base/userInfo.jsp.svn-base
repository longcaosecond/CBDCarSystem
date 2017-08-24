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
<meta http-equiv="Content-Type" content="text/html; charset=Utf-8">
<title>用户个人中心</title>
     <link rel="stylesheet" href="<c:url value='/css/bootstrap.css'/>" />
     <link rel="stylesheet" href="<c:url value='/css/global.css'/>" />
     <link rel="stylesheet" href="<c:url value='/css/userInfo.css'/>" />
</head>
<body>
<%@ include file="user_head.jsp" %>
<div class = "container" id = "total">
<div class = "row" id = "row1">
<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3 " id = "fen11">
<div id = "nei1">
<p id = "qian">汽车服务</p>
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
<div class = "row" id = "row7">
<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" id = "nei11">
<p id = "wellcome">尊贵的用户：${sessionScope.user.userName}</p>
<p id = "come">欢迎来到您的个人中心</p>
<!-- <p id = "zz">您有<span class = "number">5</span>条招租信息没有处理   处理》》》</p>
<p id = "zl">您有<span class = "number">5</span>条租赁信息没有处理   处理》》》</p> -->
</div>
<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" id = "nei12">
<p id = "showTime">当前时间：<span id = "time" class = "shijian"></span></p>
</div>
</div>
<div class = "row" id = "rowa">
</div>
</div>
</div>
</div>
<%@ include file="user_foot.jsp" %>
</body>
<script src="<c:url value='/js/jquery-3.2.1.min.js'/>"></script>
<script src="<c:url value='/js/userInfo.js'/>"></script>
</html>