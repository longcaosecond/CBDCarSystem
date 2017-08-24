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
<title>修改密码</title>
 <link rel="stylesheet" href="<c:url value='/css/bootstrap.css'/>" />
 <link rel="stylesheet" href="<c:url value='/css/global.css'/>" />
     <link rel="stylesheet" href="<c:url value='/css/userInfo.css'/>" />
     <link rel="stylesheet" href="<c:url value='/css/changePwd.css'/>" />
</head>
<body>
<%@ include file="user_head.jsp" %>
<form method="post"  action = "<%=request.getContextPath()%>/changeUserPwd.do?userId=${user.userId}" id = "tijiao">
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
<div class= "row" id = "row11">
<h2 id="biaoti">密码修改中心</h2>
</div>
<div class= "row" id = "row12">
<div class="col-lg-6 col-md-5 col-sm-5 col-xs-5" id = "nei12">
<p class = "qianti">原密码</p>
<input type = "hidden" value = "${user.userId}" id = "biaoshi">
</div>
<div class="col-lg-6 col-md-7 col-sm-7 col-xs-7" id = "nei13">
<input type="password" class="form-control"  id="oldPwd" onblur="checkOldPwd()">
<p class = "tishi" id = "old"></p>
</div>
</div>
<div class= "row" id = "row13">
<div class="col-lg-6 col-md-5 col-sm-5 col-xs-5" id = "nei14">
<p class = "qianti">新密码</p>
</div>
<div class="col-lg-6 col-md-7 col-sm-7 col-xs-7" id = "nei15" >
<input type="password" class="form-control"  id="newPwd" onblur="checkNewPwd()">
<p class = "tishi" id = "new">8-15位数字</p>
</div>
</div>
<div class= "row" id = "row14">
<div class="col-lg-6 col-md-5 col-sm-5 col-xs-5" id = "nei16">
<p class = "qianti">确认密码</p>
</div>
<div class="col-lg-6 col-md-7 col-sm-7 col-xs-7" id = "nei17">
<input type="password" class="form-control"  id="userPwd" name = "userPwd" onblur="checkUserPwd()">
<p class = "tishi" id = "sure">请再次输入密码</p>
</div>
</div>
<div class= "row" id = "row15">
<input type = "submit" class="btn btn-info" id = "btn" value = "修改">
</div>
</div>
</div>
</div>
</form>
<%@ include file="user_foot.jsp" %>
</body>
<script src="<c:url value='/js/jquery-3.2.1.min.js'/>"></script>
<script src="<c:url value='/js/changePwd.js'/>"></script>
</html>