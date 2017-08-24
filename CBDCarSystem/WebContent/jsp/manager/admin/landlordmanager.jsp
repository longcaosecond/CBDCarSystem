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
<title>包租婆管理</title>
</head>
<body onload="main()">
<!--header-->
	<%@include file="../headmanager.jsp"%>
	<%@include file="../leftmanager.jsp"%>
<section class="rt_wrap content mCustomScrollbar">
 <div class="rt_content">
      <div style="width:100%;height:60px">
	 <div class="col-xs-4">
            <div style="margin-top: 8%">包租婆信息</div>
        </div>
<!-- 		 <input type="text" name="landlordName"/>
		 <button class="btn btn-white btn-xs">查 询</button> -->
	  </div>
	  <div style="height:250px">
		<table class="table table-hover">
			<tr align="center">
				<td>包租婆账号</td>
				<td>申请车位详细信息</td>
				<td>包租婆详细信息</td>
				<td>申请审批时间</td>
				<td>操作</td>
			</tr>
			 <tbody id="landlordTbody">
				
			</tbody>
		</table>
	  </div>	
		<br>
	<button style="margin-left:75%" id="begin" class="btn btn-primary btn-xs">首页</button>
	<button id="prev" class="btn btn-primary btn-xs">上一页</button>
	<button id="page" class="btn btn-primary btn-xs"></button>
	<button id="next" class="btn btn-primary btn-xs">下一页</button>
	<button id="end" class="btn btn-primary btn-xs">尾页</button>
<form class="form-horizontal" id="formEnterPrice">
	<div class="modal fade" id="reviseLandLord" role="dialog" aria-labelledby="gridSystemModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel">车位详细信息</h4>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                            <div class="form-group ">
                                <label for="sName" class="col-xs-3 control-label">所在小区：</label>
                                <div class="col-xs-4">
                                	<label id="rentAddresslc" for="sName" class="control-label"></label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="sKnot" class="col-xs-3 control-label">车位编号：</label>
                                <div class="col-xs-4 style="width:280px">
                                	<label id="rentNumberlc" for="sName" class="col-xs-3 control-label"></label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="sKnot" class="col-xs-3 control-label">产权证编号：</label>
                                <div class="col-xs-4 style="width:280px">
                                	<label id="rentCnumberlc" for="sName" class="col-xs-3 control-label"></label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="sLink" class="col-xs-3 control-label">产权证预览：</label>
                                <div class="col-xs-4 style="width:280px">
                                    <img id="rentImglc" width="200px" height="150px" src="">
                                </div>
                            </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-xs btn-green" data-dismiss="modal">确定</button>
                </div>
            </div>
        </div>
	</div>
	</form>
	<form class="form-horizontal" id="formUser">
	<div class="modal fade" id="reviseUser" role="dialog" aria-labelledby="gridSystemModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel">包租婆详细信息</h4>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                            <div class="form-group ">
                                <label for="sKnot" class="col-xs-3 control-label">用户名：</label>
                                	<label id="landlordCountlc" for="sName" class="control-label"></label>
                            </div>
                            <div class="form-group">
                                <label for="sKnot" class="col-xs-3 control-label">真实姓名：</label>
                                	<label id="landlordNamelc" for="sName" class="control-label"></label>
                            </div>
                            <div class="form-group">
                                <label for="sKnot" class="col-xs-3 control-label">身份证号：</label>
                                	<label id="landlordIDnumberlc" for="sName" class="control-label"></label>
                            </div>
                            <div class="form-group">
                                <label for="sKnot" class="col-xs-3 control-label">电话号码：</label>
                                	<label id="landlordPhonelc" for="sName" class="control-label"></label>
                            </div>
                            <div class="form-group">
                                <label for="sKnot" class="col-xs-3 control-label">家庭地址：</label>
                                	<label id="landlordAddresslc" for="sName" class="control-label"></label>
                            </div>
                            <div class="form-group">
                                <label for="sKnot" class="col-xs-3 control-label">描述信息：</label>
                                	<label id="landlordDescripelc" for="sName" class="control-label"></label>
                            </div>
                            <div class="form-group">
                                <label for="sKnot" class="col-xs-3 control-label">信用积分：</label>
                                	<label id="landlordCreditlc" for="sName" class="control-label"></label>
                            </div>
                            <div class="form-group">
                                <label for="sKnot" class="col-xs-3 control-label">账号申请时间：</label>
                                	<label id="landlordApplyTimelc" for="sName" class="control-label"></label>
                            </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-xs btn-green" data-dismiss="modal">确定</button>
                </div>
            </div>
        </div>
	</div>
	</form>
 </div>
</section>
</body>
<script type="text/javascript" src="js/backgroundSystem/showLandLord.js"></script>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery.nouislider.js"></script>
</html>