<%@ page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>企业用户</title>
<link rel="stylesheet" href="<c:url value='/css/style.css'/>"/>
<link rel="stylesheet" href="<c:url value='/css/common.css'/>"/>
<link rel="stylesheet" href="<c:url value='/css/bootstrap.css'/>"/>
<link rel="stylesheet" href="<c:url value='/css/global.css'/>" />
</head>
<body onload="main()">
	<div class="headbg">
		<div class="header">
			<ul class="logareg">
				<input id="userNamelc" type="hidden" value="${sessionScope.enterprise.enterpriseId}"/>
				<li>${sessionScope.enterprise.enterpriseName}</li>
				<li class="lineli">|</li>
				<li><a href="<c:url value='/exit.do'/>">注销</a></li>
			</ul>
			<img class="logo" src="<c:url value='/images/logo.png'/>" alt=""
				title="" />
		</div>
	</div>
	<div class="container">
		<div class="con_jxinf">
			<div class="title" >
				<button data-toggle="modal" data-target="#reviseUser" style="margin-left:160px;margin-top:10px" class="btn button_sear">修改密码</button>
				<div class="suosuo">
					<button id="allrentlc" class="btn button_sear">查看所有</button>
					<button id="isRent" class="btn button_sear">已出租</button>
					<button id="isNotRent" class="btn button_sear">未出租</button>
				</div>
 			</div>
				<div style="height:250px;backgroundcolor:red">
					<table class="table table-hover">
						<tr align="center">
							<td>序列</td>
							<td>车位编号</td>
							<td>车位位置</td>
						</tr>
				 		<tbody id="companyCarTbody">
							
						</tbody>
					</table>
				</div>
				<div class="pagination">
					<button id="first">首页</button>
					<button id="prev">上页</button>
					<button id="next">下页</button>
					<button id="last">尾页</button>
					<input type="text" id="goes" value="1" />&nbsp;/&nbsp;<span id="totpage">1</span>
					<button id="gopage">跳转</button>
				</div>
		</div>
	</div>
	<form class="form-horizontal" action="../../updateEnterPricelc.do" id="formEnterPrice" method="post">
	<div class="modal fade" id="reviseUser" role="dialog" aria-labelledby="gridSystemModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel">修改密码</h4>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                            <div class="form-group ">
                                <label for="sName" style="margin-left:1%" class="col-xs-3 control-label">企业账号：</label>
                                <div class="col-xs-4 style="width:280px">
                                    <input id="enterpriseAccountupdate" type="text" class="form-control input-sm duiqi" readonly="readonly" name="enterpriseName" value="${sessionScope.enterprise.enterpriseName}" placeholder="${sessionScope.enterprise.enterpriseName}">
                                </div>
                                <label style="margin-left:5%" id="enterpriseAccountSpan" class="control-label"></label>
                            </div>
                            <div class="form-group">
                                <label style="margin-left:1%" for="sKnot" class="col-xs-3 control-label">原密码：</label>
                                <div class="col-xs-3 style="width:220px">
                                    <input id="oldenterprisePwdupdate" onblur="oldenterprisePwdupdates()" type="password" class="form-control input-sm duiqi">
                                </div>
                            	<label style="margin-left:2%;font-size:12px" id="enterprisePwdSpanupdate" class="control-label"></label>
                            </div>
                            <div class="form-group">
                                <label style="margin-left:1%" for="sKnot" class="col-xs-3 control-label">新密码：</label>
                                <div class="col-xs-3 style="width:220px">
                                    <input id="newenterprisePwdupdate" onblur="enterprisePwds()" type="password" class="form-control input-sm duiqi" name="enterprisePwd" placeholder="请输入6-13位密码">
                                </div>
                            	<label style="margin-left:2%;font-size:12px" id="newenterprisePwdSpanupdate" class="control-label"></label>
                            </div>
                            <div class="form-group">
                                <label style="margin-left:1%" for="sKnot" class="col-xs-3 control-label">确认密码：</label>
                                <div class="col-xs-3 style="width:220px">
                                    <input id="reenterprisePwdupdate" onblur="reenterprisePwds()" type="password" class="form-control input-sm duiqi" placeholder="请再次输入密码">
                                </div>
                                <label style="margin-left:2%;font-size:12px" id="reenterprisePwdSpanupdate" class="control-label"></label>
                            </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-xs btn-green" onclick="updateEnterPricelc()">确定</button>
                </div>
            </div>
        </div>
	</div>
	</form>
<script src="<c:url value='/js/foregroundSystem/showCompanyCar.js'/>"></script>
<script src="<c:url value='/js/jquery-3.2.1.js'/>"></script>
<script src="<c:url value='/js/bootstrap.js'/>"></script>
<script src="<c:url value='/js/jQselect.js'/>"></script>
</body>
</html>