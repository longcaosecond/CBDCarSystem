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
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="css/trueOrFalse.css" />
<title>外部合约管理</title>
</head>
<body>
<!--header-->
	<%@ include file="../headmanager.jsp"%>
	<%@ include file="../leftmanager.jsp"%>
<section class="rt_wrap content mCustomScrollbar">
 <div class="rt_content">
      <div role="tabpanel" class="tab-pane" id="scho">
                <div class="check-div form-inline">
                    <div class="col-xs-4">
                        <button class="btn btn-yellow btn-xs" style="margin-top: 5%" data-toggle="modal" data-target="#addSchool">添加外部合约 </button>
                        <button class="btn btn-yellow btn-xs" style="margin-top: 5%" id="effective">查看有效合约 </button>
                        <button class="btn btn-yellow btn-xs" style="margin-top: 5%" id="invalid">查看无效合约 </button>
                    </div>
                    <div class="col-lg-4 col-xs-4" style="margin-left: 33%">
                                                            合同编号：<input type="text" class=" form-control input-sm " id="contractNo" placeholder="请输入合同编号搜索">
                        <button class="btn btn-primary btn-xs" id="search">查 询 </button>
                    </div>
                </div>
                <div>
                   	<div style="height: 250px">
	                   	<table class="table table-hover">
							<tr class="tableHeader" style="text-align: center" id="first">
								<td>合同编号</td>
								<td>合同单位名称</td>
								<td>合同生效日期</td>
								<td>合同截止日期</td>
								<td>联系电话</td>
								<td>联系人</td>
								<td>操作</td>
							</tr>
						</table>
                   	</div>
					
					<!-- 页码块 -->
					<ul id="authorPages" style="margin-left: 75%">
							<button id="begin" class="btn btn-primary btn-xs">首页</button>
							<button id="prev" class="btn btn-primary btn-xs">上一页</button>
							<button id="page" class="btn btn-primary btn-xs"></button>
							<button id="next" class="btn btn-primary btn-xs">下一页</button>
							<button id="end" class="btn btn-primary btn-xs">尾页</button>
						</ul>
                </div>

                 <!--弹出添加外部合约窗口-->
                <div class="modal fade" id="addSchool" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document" style="width: 700px">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title" id="gridSystemModalLabel">添加外部合约</h4>
                            </div>
                            <div class="modal-body">
                                <div class="container-fluid">
                                    <form action="addOutContract.do" id="addFrom" method="post" enctype="multipart/form-data">
                                    	<table class="table-hover" >
											<tr>
												<td colspan="5">合同编号：</td>
												<td align="right"  style="width: 210px">
													<input type="text" class="form-control input-sm duiqi" id="newNo" name="outContractNewNo" placeholder="如：停字20141120">
												</td>
												<td style="width: 300px">
													&nbsp;&nbsp;&nbsp;<span id="newNoSpan">编号可为汉字、英文或数字相组合</span>
												</td>
											</tr>
											<tr>
												<td colspan="5">合同单位名称：</td>
												<td align="right">
													<input type="text" class="form-control input-sm duiqi" id="company" name="outContractCompany" placeholder="如：成都市天府广场创业中心有限公司">
												</td>
												<td>
													&nbsp;&nbsp;&nbsp;<span id="companySpan">单位名称可为汉字、英文或数字相组合</span>
												</td>
											</tr>
											<tr>
												<td colspan="5">单位详细地址：</td>
												<td align="right">
													<input type="text" class="form-control input-sm duiqi" id="address" name="outContractAddress" placeholder="如：成都市天府广场185号">
												</td>
												<td>
													&nbsp;&nbsp;&nbsp;<span id="addressSpan">单位地址可为汉字、英文或数字相组合</span>
												</td>
											</tr>
											<tr>
												<td colspan="5">合同生效日期：</td>
												<td align="right">
													<input type="button" class="form-control input-sm duiqi" id="startTime" onClick="laydate()">
													<input type="hidden" class="form-control input-sm duiqi" id="startTime3" name="outContractStartTime">
												</td>
												<td>
													&nbsp;&nbsp;&nbsp;<span id="startTimeSpan"></span>
												</td>
											</tr>
											<tr>
												<td colspan="5">合同截止日期：</td>
												<td align="right">
													<input type="button" class="form-control input-sm duiqi" id="endTime" onClick="laydate()">
													<input type="hidden" class="form-control input-sm duiqi" id="endTime3" name="outContractEndTime">
												</td>
												<td>
													&nbsp;&nbsp;&nbsp;<span id="endTimeSpan"></span>
												</td>
											</tr>
											<tr>
												<td colspan="5">联系电话：</td>
												<td align="right">
													<input type="text" class="form-control input-sm duiqi" id="phone" name="outContractPhone" placeholder="如：1359833212">
												</td>
												<td>
													&nbsp;&nbsp;&nbsp;<span id="phoneSpan">请填入以135、159、189开头的11位手机号码</span>
												</td>
											</tr>
											<tr>
												<td colspan="5">联系人：</td>
												<td align="right">
													<input type="text" class="form-control input-sm duiqi" id="contact" name="outContractContact" placeholder="如：张天航">
												</td>
												<td>
													&nbsp;&nbsp;&nbsp;<span id="contactSpan">联系人名可为英文或中文</span>
												</td>
											</tr>
											<tr>
												<td colspan="5">车位编号：</td>
												<td align="right">
													<input type="text" class="form-control input-sm duiqi" id="carNo" name="outContractCarNo" placeholder="如：AP21">
												</td>
												<td>
													&nbsp;&nbsp;&nbsp;<span id="carNoSpan">车位编号可为汉字、英文或数字相组合</span>
												</td>
											</tr>
											<tr>
												<td colspan="5">上传合同复印件：</td>
												<td align="right">
													<input type="file" class="form-control input-sm duiqi" id="copyImg" name="copyImg" onchange="imgPreview(this)">
												</td>
												<td>
													<div style="width: 100px;height: 100px">
														<img src="images/default.jpg" style="margin-left: 15px" width="100%" height="100%" id="img"/>
													</div>	
													&nbsp;&nbsp;&nbsp;<span id="copyImgSpan">请上传以.jpg、.jpeg、.png格式的文件</span>
												</td>
											</tr>
										</table>
										<div class="modal-footer">
			                                <input type="submit" class="btn btn-xs btn-green" value="添 加"/>
			                                <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
			                            </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!--弹出续约外部合约窗口-->
                <div class="modal fade" id="reviseSchool" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document" style="width: 700px">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title" id="gridSystemModalLabel">续约外部合约</h4>
                            </div>
                            <div class="modal-body">
                                <div class="container-fluid">
                                    <form action="addOutContract.do" id="continueFrom" method="post" enctype="multipart/form-data">
                                    	<table class="table-hover">
											<tr>
												<td colspan="5">原合同编号：</td>
												<td align="right" style="width: 210px">
													<input type="text" class="form-control input-sm duiqi" disabled="disabled" id="oldNo">
												</td>
												<td >
													<input type="hidden" id="oldNo2" name="outContractOldNo"/>
												</td>
											</tr>
											<tr>
												<td colspan="5">新续合同编号：</td>
												<td align="right">
													<input type="text" class="form-control input-sm duiqi" id="newNo2" name="outContractNewNo" placeholder="如：停字20141120">
												</td>
												<td style="width: 300px">
													&nbsp;&nbsp;&nbsp;<span id="newNoSpan2">编号可为汉字、英文或数字相组合</span>
												</td>
											</tr>
											<tr>
												<td colspan="5">合同单位名称：</td>
												<td align="right">
													<input type="text" class="form-control input-sm duiqi" id="company2" name="outContractCompany" placeholder="如：成都市天府广场创业中心有限公司">
												</td>
												<td>
													&nbsp;&nbsp;&nbsp;<span id="companySpan2">单位名称可为汉字、英文或数字相组合</span>
												</td>
											</tr>
											<tr>
												<td colspan="5">合同生效日期：</td>
												<td align="right">
													<input type="button" class="form-control input-sm duiqi" id="startTime2" onClick="laydate()">
													<input type="hidden" class="form-control input-sm duiqi" id="startTime4" name="outContractStartTime">
												</td>
												<td>
													&nbsp;&nbsp;&nbsp;<span id="startTimeSpan2"></span>
												</td>
											</tr>
											<tr>
												<td colspan="5">合同截止日期：</td>
												<td align="right">
													<input type="button" class="form-control input-sm duiqi" id="endTime2" onClick="laydate()">
													<input type="hidden" class="form-control input-sm duiqi" id="endTime4" name="outContractEndTime">
												</td>
												<td>
													&nbsp;&nbsp;&nbsp;<span id="endTimeSpan2"></span>
												</td>
											</tr>
											<tr>
												<td colspan="5">联系电话：</td>
												<td align="right">
													<input type="text" class="form-control input-sm duiqi" id="phone2" name="outContractPhone" placeholder="如：1359833212">
												</td>
												<td>
													&nbsp;&nbsp;&nbsp;<span id="phoneSpan2">请填入以135、159、189开头的11位手机号码</span>
												</td>
											</tr>
											<tr>
												<td colspan="5">联系人：</td>
												<td align="right">
													<input type="text" class="form-control input-sm duiqi" id="contact2" name="outContractContact" placeholder="如：张天航">
												</td>
												<td>
													&nbsp;&nbsp;&nbsp;<span id="contactSpan2">联系人名可为英文或中文</span>
												</td>
											</tr>
											<tr>
												<td colspan="5">上传合同复印件：</td>
												<td align="right">
													<input type="file" class="form-control input-sm duiqi" id="copyImg2" name="copyImg" onchange="imgPreview2(this)">
												</td>
												<td>
													<div style="width: 100px;height: 100px">
														<img src="images/default.jpg" style="margin-left: 15px" width="100%" height="100%" id="img2"/>
													</div>	
													&nbsp;&nbsp;&nbsp;<span id="copyImgSpan2">请上传以.jpg、.jpeg、.png格式的文件</span>
												</td>
											</tr>
										</table>
										 <div class="modal-footer">
			                                <input type="submit" class="btn btn-xs btn-green" value="续 约"/>
			                                <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
			                            </div>
                                    </form>
                                </div>
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
<script type="text/javascript" src="js/datepicker/laydate.js"></script>
<script type="text/javascript" src="js/outcontractmanager.js"></script>

</html>