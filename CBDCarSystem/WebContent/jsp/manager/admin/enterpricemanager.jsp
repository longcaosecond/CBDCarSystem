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
<link rel="stylesheet" type="text/css" href="css/common.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<title>企业用户管理</title>
</head>
<body onload="main()">
<!--header-->
	<%@include file="../headmanager.jsp"%>
	<%@include file="../leftmanager.jsp"%>
<section class="rt_wrap content mCustomScrollbar">
 <div class="rt_content">
    <div style="width:100%;height:60px">
		 <br>
		<button type="button" class="btn btn-yellow btn-xs" data-toggle="modal" data-target="#reviseUser">添加企业</button>	
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		企业名称 &nbsp;<input type="text" id="enterPriceName"/>
		企业楼层&nbsp;<input type="text" id="enterPriceFloar"/>
		联系人&nbsp;<input type="text" id="enterPriceContact"/>
		联系方式&nbsp;<input type="text" id="enterPricePhone"/>
		<button id="enterPriceSelect" class="btn btn-primary btn-xs">查询</button> 
	</div>
	<div style="height:250px">
		<table class="table table-hover">
			<tr align="center">
				<td>企业名称</td>
				<td>企业楼层</td>
				<td>企业联系人</td>
				<td>企业联系方式</td>
				<td>操作</td>
			</tr>
			 <tbody id="enterPriceTbody">
				
			</tbody>
		</table>
	</div>
	<br>
	<button style="margin-left:75%" id="begin" class="btn btn-primary btn-xs">首页</button>
	<button id="prev" class="btn btn-primary btn-xs">上一页</button>
	<button id="page" class="btn btn-primary btn-xs"></button>
	<button id="next" class="btn btn-primary btn-xs">下一页</button>
	<button id="end" class="btn btn-primary btn-xs">尾页</button>
	<form class="form-horizontal" action="addEnterPrice.do" id="formEnterPrice" method="post">
	<div class="modal fade" id="reviseUser" role="dialog" aria-labelledby="gridSystemModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel">添加新企业</h4>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                            <div class="form-group ">
                                <label for="sName" class="col-xs-3 control-label">企业登陆名：</label>
                                <div class="col-xs-4 style="width:280px">
                                    <input id="enterpriseAccount" onblur="enterpriseAccounts()" type="text" class="form-control input-sm duiqi" name="enterpriseAccount" placeholder="请输入6-13位账号，以字母开头">
                                </div>
                                <label id="enterpriseAccountSpan" class="control-label"></label>
                            </div>
                            <div class="form-group">
                                <label for="sKnot" class="col-xs-3 control-label">密码：</label>
                                <div class="col-xs-4 style="width:280px">
                                    <input id="enterprisePwd" onblur="enterprisePwds()" type="password" class="form-control input-sm duiqi" name="enterprisePwd" placeholder="请输入6-13位密码">
                                </div>
                            	<label id="enterprisePwdSpan" class="control-label"></label>
                            </div>
                            <div class="form-group">
                                <label for="sKnot" class="col-xs-3 control-label">确认密码：</label>
                                <div class="col-xs-4 style="width:280px">
                                    <input id="reenterprisePwd" onblur="reenterprisePwds()" type="password" class="form-control input-sm duiqi" name="reEnterprisePwd" placeholder="请再次输入密码">
                                </div>
                                <label id="reenterprisePwdSpan" class="control-label"></label>
                            </div>
                            <div class="form-group">
                                <label for="sLink" class="col-xs-3 control-label">企业名称：</label>
                                <div class="col-xs-4 style="width:280px">
                                    <input id="enterpriseName" onblur="enterpriseNames()" type="text" class="form-control input-sm duiqi" name="enterpriseName">
                                </div>
                                <label id="enterpriseNameSpan" class="control-label"></label>
                            </div>
                            <div class="form-group">
                                <label for="sKnot" class="col-xs-3 control-label">企业楼层位置：</label>
                                <div class="col-xs-4 style="width:280px">
                                    <input id="enterpriseAddress" onblur="enterpriseAddresss()" type="text" class="form-control input-sm duiqi" name="enterpriseAddress">
                                </div>
                                <label id="enterpriseAddressSpan" class="control-label"></label>
                            </div>
                            <div class="form-group">
                                <label for="sKnot" class="col-xs-3 control-label">联系人：</label>
                                <div class="col-xs-4 style="width:280px">
                                    <input id="enterpriseContact" onblur="enterpriseContacts()" type="text" class="form-control input-sm duiqi" name="enterpriseContact" placeholder="请输入2-6个正确名字">
                                </div>
                                <label id="enterpriseContactSpan" class="control-label"></label>
                            </div>
                            <div class="form-group">
                                <label for="sKnot" class="col-xs-3 control-label">联系电话：</label>
                                <div class="col-xs-4 style="width:280px">
                                    <input id="enterprisePhone" onblur="enterprisePhones()" type="text" class="form-control input-sm duiqi" name="enterprisePhone" placeholder="请输入正确电话号码">
                                </div>
                                <label id="enterprisePhoneSpan" class="control-label"></label>
                            </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-xs btn-green" onclick="addEnterPrice()">确定</button>
                </div>
            </div>
        </div>
	</div>
	</form>
 </div>
</section>
</body>
<script type="text/javascript" src="js/backgroundSystem/showEnterPrice.js"></script>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery.nouislider.js"></script>
</html>