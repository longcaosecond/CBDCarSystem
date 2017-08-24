<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="description" content="对外招租" />
<title>车位详情</title>
<link rel="stylesheet" href="<c:url value='/css/bootstrap.css'/>" />
<link rel="stylesheet" href="<c:url value='/css/global.css'/>" />
</head>
<body>
	<%@ include file="../user_head.jsp"%>
	<div class="container">
		<div class="nav">
			<a href="all/usermain.jsp">首页</a> &gt; 对外招租 &gt; 车位详情
		</div>
		<div class="con_car">
			<div class="title"></div>
			<div class="detail">
				<div class="top_car">
					<div class="news_flash">
						<div id="featured">
							<!--标签开始 -->
							<div class="slideshowItem" id="image_xixi-01"
								style="opacity: 1; display: block;">
								<a href="#" class="open"> <img
									src="images/${requestScope.rent.rentCarPicture}"/>
								</a>
							</div> <!--标签结束 -->
						</div>
					</div>
					<div class="top_car_detail">
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							class="table_detail">
							<tr>
								<td colspan="2"><span class="name">${requestScope.rent.rentAddress}</span></td>
							</tr>
							<tr>
								<td width="60">价格：</td>
								<td><span class="red">￥:${requestScope.rent.rentPrice}</span></td>
							</tr>
							<tr>
								<td>出租时间：</td>
								<td><span>${requestScope.rent.rentStartDate}</span>至<span>${requestScope.rent.rentEndDate}</span></td>
							</tr>
							<tr>
								<td>出租人：</td>
								<td>${requestScope.rent.user.userName}</td>
								<input type="hidden" id="rentId" value="${requestScope.rent.rentId}">
							</tr>
							<tr>
								<td>联系方式：</td>
								<td>${requestScope.rent.user.userPhone}</td>
							</tr>
							<tr>
								<td valign="top">说明：</td>
								<td valign="top">${requestScope.rent.rentMessage}</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="attr_car" style="text-align: center;">
					<a href="<c:url value='/jsp/user/vip/userout.jsp'/>"
							class="btn btn-success title_attr">确认</a>&nbsp;&nbsp; 
					<a class="btn btn-info title_attr" data-toggle="modal"
							data-target="#myModal">修改</a>&nbsp;&nbsp;
					<a href="deleteMyRent.do?rentId=${requestScope.rent.rentId}"
							class="btn btn-default title_attr">删除</a>
					<span style="color: red">${sessionScope.deletMsg}</span>
				</div>
			</div>			
		</div>
	</div>
	<%@ include file="../user_foot.jsp"%>
	<!-- 修改车位信息模块 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">修改车位</h4>
				</div>
				<div class="modal-body">
					<form id="contDiv" action="updadaMyRents.do" method="post" enctype="multipart/form-data" 
								class="form-group info" onsubmit="return checkAll()">
						<label class="control-label">产权号码</label> 
						<span id="rentCnumber">${requestScope.rent.rentCnumber}</span><br />
						<label class="control-label">车位地址</label> 
						<span id="rentAddress">${requestScope.rent.rentAddress}</span><br />
						<label class="control-label">车位号码</label> 
						<span id="rentNumber">${requestScope.rent.rentNumber}</span><br />
						<label class="col-xs-4 col-sm-4 col-md-4 col-lg-4 control-label">车位价格</label>
						<input type="text" name="rentPrice" class="form-control"
								value="${requestScope.rent.rentPrice}">
						<span id="priceHint"></span><br/>  
						<input type="hidden" name="rentId" value="${requestScope.rent.rentId}"/>
						<label class="col-xs-4 col-sm-4 col-md-4 col-lg-4 control-label">起租日期</label>
						<input id="rentStratDate" class="form-control" type="text" onClick="laydate()" 
								 name="startDate" value="${requestScope.rent.rentStartDate}"/> <br/> 
						<label class="col-xs-4 col-sm-4 col-md-4 col-lg-4 control-label">截止日期</label>
						<input id="rentEndDate" class="form-control" type="text" onClick="laydate()" 
								name="endDate" value="${requestScope.rent.rentEndDate}"/> <br/> 
						<label class="col-xs-4 col-sm-4 col-md-4 col-lg-4 control-label">车位描述</label>
						<textarea rows="5" id="rentMessagetxt" name="rentMessage" class="form-control"></textarea>
						<br/> 
						<label class="col-xs-4 col-sm-4 col-md-4 col-lg-4 control-label">车位图片</label>
						<input type="file" name="rentCarPic" class="form-control">
						<br /> 
						<input type="submit" id="updBtn" style="margin: 0px 5% 0px 45%;" 
								class="btn btn-info" value="修改" />
						<input type="button" class="btn" value="取消" data-dismiss="modal" />
					</form>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
</body>
<script src="<c:url value='/js/jquery-3.2.1.min.js'/>"></script>
<script src="<c:url value='/js/bootstrap.js'/>"></script>
<script src="<c:url value='/js/datepicker/laydate.js'/>"></script>

</html>