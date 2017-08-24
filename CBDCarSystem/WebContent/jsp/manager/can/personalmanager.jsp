<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="author" content="DeathGhost" />
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<title>个人信息管理</title>
</head>
<body onload="main()">
	<%@include file="../headmanager.jsp"%>
	<%@include file="../leftmanager.jsp"%>
<section class="rt_wrap content mCustomScrollbar">
<div class="rt_content">
<div style="width:100%;height:60px">
	 <div class="col-xs-4">
            <div style="margin-top: 8%">当前管理员信息</div>
        </div>
</div>
<div style="height: 250px">
	<table class="table table-hover">
		<thead><tr align="center">
			<td>账号</td>
			<td>姓名</td>
			<td>电话</td>
			<td>权限</td>
			<td>操作</td>
		</tr></thead>
		<tbody id="t_body">
		</tbody>
	</table>
</div>
<!--页码块--><div style="text-align:right;margin-right:5%">
                </div>
<!-- 弹框 **********-->
<div class="modal fade" id="reviseUser" role="dialog" aria-labelledby="gridSystemModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="quxiao close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel">修改用户</h4>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        <div class="form-horizontal">
                            <div class="form-group ">
                                <label for="sName" class="col-xs-3 control-label">用户名：</label>
                                <div class="col-xs-5 ">
                                    <input type="text" class="form-control input-sm duiqi tankuang " readonly="readonly" id="managerAccountUpdate" placeholder="admintest">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="sLink" class="col-xs-3 control-label">真实姓名：</label>
                                <div class="col-xs-5 ">
                                    <input type="" class="form-control input-sm duiqi tankuang " readonly="readonly" id="managerNameUpdate" placeholder="张三">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="sKnot" class="col-xs-3 control-label">原始密码：</label>
                                <div class="col-xs-5">
                                    <input type="password" reg="^[0-9]{6,15}$" class="form-control input-sm duiqi tankuang yz " id="password" placeholder="">
                                </div>
                                <div class="col-xs-3">
                                <span id="passwordTS" class="ts"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="sKnot" class="col-xs-3 control-label">新密码：</label>
                                <div class="col-xs-5">
                                    <input type="password" reg="^[0-9]{6,15}$" class="form-control input-sm duiqi tankuang  yz " id="newPassword" placeholder="6-15位数字">
                                </div>
                                <div class="col-xs-3">
                                <span id="newPasswordTS" class="ts"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="sKnot"  class="col-xs-3 control-label">确认新密码：</label>
                                <div class="col-xs-5">
                                    <input reg="^[0-9]{6,15}$" type="password" class="form-control input-sm duiqi tankuang  yz " id="newPasswordAgain" placeholder="6-15位数字">
                                </div>
                                <div class="col-xs-3">
                                <span id="newPasswordAgainTS" class="ts"></span>
                                </div>
                                </div>
                                <div class="form-group">
                                <label for="sKnot" class="col-xs-3 control-label">电话号码：</label>
                                <div class="col-xs-5">
                                    <input type="text" reg="^((13[0-9])|(14[5|7])|(15([0-3]|[5-9]))|(18[0,5-9]))\d{8}$" class="form-control input-sm duiqi tankuang  yz " id="managerPhoneUpdate" placeholder="11位手机号">
                                </div>
                                <div class="col-xs-3">
                                <span id="managerPhoneUpdateTS" class="ts"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="sKnot" class="col-xs-3 control-label">操作权限</label>
                                <div class="col-xs-5">
                                    <input type="text" class="form-control input-sm duiqi tankuang " readonly="readonly" id="quanxianUpdate" placeholder="超级管理员">
                                </div>
                            </div>
                            </div>
                            </div>
                          <div class="modal-footer">
                    <button type="button" class="quxiao btn btn-xs btn-white" data-dismiss="modal">取消</button>
                    <button type="button" id="sure" class="btn btn-xs btn-green" data-dismiss="modal">确定</button>
                </div>
                    </div>
                </div>
            </div>
        </div>
    </div> 
</section>
</body>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery.nouislider.js"></script>
<script type="text/javascript" src="js/personalmanager.js"></script>
</html>