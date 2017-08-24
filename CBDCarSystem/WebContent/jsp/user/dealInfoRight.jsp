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
<title>交易记录</title>
 <link rel="stylesheet" href="<c:url value='/css/bootstrap.css'/>" />
 <link rel="stylesheet" href="<c:url value='/css/global.css'/>" />
     <link rel="stylesheet" href="<c:url value='/css/userInfo.css'/>" />
      <link rel="stylesheet" href="<c:url value='/css/dealInfoRight.css'/>" />
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
  <p class = "zuo"><a href="<c:url value='/jsp/userInfo.jsp'/>"><span id = "hang1">个人中心</span></a></p>
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
<div class ="col-lg-2 col-md-2 col-sm-2 col-xs-2" id = "nei11">
<p><a href = "<c:url value='/jsp/user/dealInfo.jsp'/>" id = "zhaozu">招租投诉</a></p>
</div>
<div class ="col-lg-3 col-md-3 col-sm-3 col-xs-3" id = "nei12">
<p><a href = "<c:url value='/jsp/user/dealInfoRight.jsp'/>" id = "zuling">租赁投诉</a></p>
</div>
</div>
<div class = "row" id = "row12">
 <table class = "table-bordered" id = "userInfo">
 <thead>
     <tr>
      <td>成交编号</td>
       <td>车位地址</td>
        <td>开始日期</td>
         <td>结束日期</td>
          <td>租赁价格</td>
           <td>投诉</td>
         </tr>
     </thead>
     <tbody id = "biaoge">
     </tbody>
 </table>
</div>
<div class = "row" id = "row13">
     <button id="begin" class="btn btn-white btn-xs">首页</button>
	<button id="prev" class="btn btn-white btn-xs">上一页</button>
	<span id="nowPage">1</span>&nbsp;/&nbsp; <span id="totpage">1</span>
	<button id="next" class="btn btn-white btn-xs">下一页</button>
	<button id="end" class="btn btn-white btn-xs">尾页</button>
</div>
</div>
</div>
</div>
<%@ include file="user_foot.jsp" %>
</body>
<script src="<c:url value='/js/jquery-3.2.1.min.js'/>"></script>
<script src="<c:url value='/js/dealInfoRight.js'/>"></script>
</html>