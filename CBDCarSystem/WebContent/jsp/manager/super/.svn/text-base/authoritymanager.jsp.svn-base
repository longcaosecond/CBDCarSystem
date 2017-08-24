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
<title>权限管理</title>
</head>
<body>
	<%@include file="../headmanager.jsp"%>
	<%@include file="../leftmanager.jsp"%>
<section class="rt_wrap content mCustomScrollbar">
<div class="rt_content">
<div style="width:100%;height:60px">

	<div class="check-div form-inline">
        <div class="col-xs-4">
            <button class="btn btn-yellow btn-xs" style="margin-top: 8%" id="addbutton" data-toggle="modal" data-target="#addManager">添加后台管理员</button>
        </div>
        <div class="col-lg-5 col-xs-4" style="margin-left: 25%">
                                    管理员名称：<input type="text" class=" form-control input-sm " id="managerName" placeholder="请输入管理员名称搜索">
            <button class="btn btn-white btn-xs" id="search">查 询 </button>
        </div>
    </div>
</div>
<div>
	<div style="height: 320px">
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
	<!--页码块-->
          <footer class="footer">
              	<ul id="authorPages">
					<button id="begin" class="btn btn-white btn-xs">首页</button>
					<button id="prev" class="btn btn-white btn-xs">上一页</button>
					<button id="page" class="btn btn-white btn-xs"></button>
					<button id="next" class="btn btn-white btn-xs">下一页</button>
					<button id="end" class="btn btn-white btn-xs">尾页</button>
				</ul>
          </footer>
</div>
    <!-- 增加弹出框 -->            
<div class="modal fade" id="addManager" role="dialog" aria-labelledby="gridSystemModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class=" quxiao close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel">添加管理员</h4>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        <div class="form-horizontal">
                            <div class="form-group ">
                                <label for="sName" class="col-xs-3 control-label">工号(账号)：</label>
                                <div class="col-xs-5 ">
                                    <input type="text" reg="^[0-9]{4}$" class="tankuang form-control input-sm duiqi" id="managerAccountAdd" placeholder="4位数字">
                                </div>
                                <div class="col-xs-3">
                                <span id="managerAccountAddTS" class="ts"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="sKnot" class="col-xs-3 control-label">密码：</label>
                                <div class="col-xs-5">
                                    <input type="password" reg="^[0-9]{6,15}$" class="tankuang form-control input-sm duiqi yz" id="managerPwdAdd" placeholder="6-15位数字">
                                </div>
                                 <div class="col-xs-3">
                                <span id="managerPwdAddTS" class="ts"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="sKnot" class="col-xs-3 control-label">确认密码：</label>
                                <div class="col-xs-5">
                                    <input type="password" reg="^[0-9]{6,15}$" class="tankuang form-control input-sm duiqi" id="managerPwdAddSure" placeholder="6-15位数字">
                                </div>
                                 <div class="col-xs-3">
                                <span id="managerPwdAddSureTS"class="ts"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="sLink" class="col-xs-3 control-label">真实姓名：</label> 
                                <div class="col-xs-5 ">
                                    <input type="text" reg="^[\u4E00-\u9FA5]{2,6}$" class="tankuang form-control input-sm duiqi yz" id="managerNameAdd"placeholder="2-6个中文汉字">
                                </div>
                                 <div class="col-xs-3">
                                <span id="managerNameAddTS"class="ts"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="sKnot" class="col-xs-3 control-label">电话号码：</label>
                                <div class="col-xs-5">
                                    <input type="text" reg="^((13[0-9])|(14[5|7])|(15([0-3]|[5-9]))|(18[0,5-9]))\d{8}$" class="tankuang form-control input-sm duiqi yz" id="managerPhoneAdd" placeholder="11位手机号">
                                </div>
                                 <div class="col-xs-3">
                                <span id="managerPhoneAddTS" class="ts"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="sKnot" class="col-xs-3 control-label">操作权限：</label>
                                <div class="col-xs-5">                                	
                                    <input type="checkbox" value="1" class="quanxianAdd checkb"/>用户管理
                                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" value="2"class="quanxianAdd checkb"/>合约管理
                                    <br>
                                    <input type="checkbox" value="3" class="quanxianAdd checkb"/>投诉管理
                                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" value="4" class="quanxianAdd checkb"/>车位管理
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="quxiao btn btn-xs btn-white" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-xs btn-green" data-dismiss="modal" id="addManagerSure">确定</button>
                </div>
            </div>
        </div>
	</div>
	 <!-- 修改弹出框 -->            
<div class="modal fade" id="updateManagerTK" role="dialog" aria-labelledby="gridSystemModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class=" quxiao close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel">修改权限</h4>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        <div class="form-horizontal">
                            <div class="form-group ">
                                <label for="sName" class="col-xs-3 control-label">工号(账号)：</label>
                                <div class="col-xs-8 ">
                                    <input type="text" class="tankuang form-control input-sm duiqi"  readonly="readonly" id="managerAccountUpdate">
                                <input type="hidden" id="managerIdUpdate"/>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label for="sLink" class="col-xs-3 control-label">真实姓名：</label>
                                <div class="col-xs-8 ">
                                    <input type="" class="tankuang form-control input-sm duiqi" readonly="readonly"  id="managerNameUpdate">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="sKnot" class="col-xs-3 control-label">电话号码：</label>
                                <div class="col-xs-8">
                                    <input type="text" class="tankuang form-control input-sm duiqi" readonly="readonly"  id="managerPhoneUpdate" placeholder="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="sKnot" class="col-xs-3 control-label">操作权限：</label>
                                <div class="col-xs-8">                                	
                                    <input type="checkbox" value="1" class="quanxianUpdate checkb"/>用户管理
                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" value="2" class="quanxianUpdate checkb"/>合约管理
                                    <br>
                                    <input type="checkbox" value="3" class="quanxianUpdate checkb"/>车位管理
                                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" value="4" class="quanxianUpdate checkb"/>投诉管理
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class=" quxiao btn btn-xs btn-white" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-xs btn-green" data-dismiss="modal" id="updateManagerSure">确定</button>
                </div>
            </div>
        </div>
	</div>

 			<!--弹出删除警告窗口-->
                <div class="modal fade" id="deleteSchool" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class=" quxiao close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="gridSystemModalLabel">提示</h4>
                            </div>
                            <div class="modal-body">
                                <div class="container-fluid">
                                    确定要删除吗?删除后不可恢复！
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                                <button type="button" class="btn btn-xs btn-danger"  data-dismiss="modal" id="deletesure">删除</button>
                            </div>
                        </div>
                    </div>
                </div>

</div>
</section>
</body>
<!-- <script type="text/javascript" src="js/showmanager.js"></script> --><!--js动态生成所有管理员表格-->
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery.nouislider.js"></script>
<script type="text/javascript" src="js/authoritymanager.js"></script>
<script type="text/javascript" src="js/jquery.json-2.4.js"></script>
</html>