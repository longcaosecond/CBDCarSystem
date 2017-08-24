<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>车位招租</title>
<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/global.css" />
</head>
<body>
	<%@ include file="../user_head.jsp"%>
	<div class="container">
		<div class="nav">
			<a href="all/usermain.jsp">首页</a> &gt; <a href="">车位招租</a>
		</div>
		<div class="con_jxinf">
			<div class="title">
			<button class="btn btn-success button_sear" data-toggle="modal" 
					style="margin-left: 15%;" data-target="#myModal">上传车位</button>
			<button class="btn btn-success  button_sear" id="findInfo"
					style="margin-left: 1%;">查看信息</button>
				<div class="suosuo">
					<ul>
						<li>
							<ul class="item_ul" style="line-height:30px; height:30px;">
								<li>
									<span class="name_item">所在区域:</span>
									<input type="text" id="address" style="width:100px;height:30px;border-radius: 5px;"/>
								</li>
								<li>
									<span class="name_item">车位价格:</span>
									<input type="text" id="minPrice" style="width:50px;height:30px;border-radius: 5px;"/>
									<span style="font-size:16px;">至</span>&nbsp;
									<input type="text" id="maxPrice" style="width:50px;height:30px;border-radius: 5px;"/>									
								</li>
								<li><span class="name_item">起止日期:</span>
									<input id="startDate" type="button" onClick="laydate()" value="" style="width:80px;height:30px;border-radius: 5px;"/>
									<span style="font-size:16px;">至</span>&nbsp;
									<input id="endDate" type="button" onClick="laydate()" value="" style="width:80px;height:30px;border-radius: 5px;"/>
								</li>
								<li><button id="findBtn" class="btn button_sear">车位搜索</button></li>
							</ul></li>
					</ul>
				</div>
				<div class="clear"></div>
			</div>
			<div class="detail">
				<div class="search_list">
					<table class="table" border="1" cellspacing="0" cellpadding="0">
						<thead>
							<tr>
								<td>车位展示</td>
								<td>基本信息</td>
								<td>车位描述</td>
								<td>当前状态</td>
								<td>查看详情</td>
							</tr>
						</thead>
						<tbody id="infotab">
						
						</tbody>		
					</table>
				</div>
				<table cellspacing="0" cellpadding="0" border="0" width="100%">
					<tbody>
						<tr>
							<td>&nbsp;</td>
							<td align="center">
							<div class="pagination">
								<button id="first">首页</button>
								<button id="prev">上页</button>
								<button id="next">下页</button>
								<button id="last">尾页</button>
								<input type="text" id="goes" value="1" />&nbsp;/&nbsp; 			<span id="totpage">1</span>
								<button id="gopage">跳转</button>
							</div></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<%@ include file="../user_foot.jsp"%>
	
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog" id="modaldiv">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	        <h4 class="modal-title" id="myModalLabel">上传新车位</h4>
	      </div>
	      <div class="modal-body">
	        <form id="addRentForm" action="addNewRent.do" method="post" enctype="multipart/form-data"
	        		onsubmit="return addRentCheck()" class="form-group info">
				<label class="col-xs-4 col-sm-4 col-md-4 col-lg-4 control-label">产权号码</label>
				<input type="text" id="rentCnumtxt" name="rentCnumber" class="form-control">
				<span id="rentCnumHint"></span><br /> 
				<label class="col-xs-4 col-sm-4 col-md-4 col-lg-4 control-label">车位地址</label>
				<input type="text" id="addrestxt" name="rentAddress" class="form-control"> 
				<span id="addressHint"></span><br />
				<label class="col-xs-4 col-sm-4 col-md-4 col-lg-4 control-label">车位编号</label>
				<input type="text" id="rentnumtxt" name="rentNumber" class="form-control"> 
				<span id="rentNumHint"></span><br /> 
				<label class="col-xs-4 col-sm-4 col-md-4 col-lg-4 control-label">车位价格</label>
				<input type="text" id="rentPritxt" name="rentPrice" class="form-control"> 
				<span id="priceHint"></span><br/> 
				<label class="col-xs-4 col-sm-4 col-md-4 col-lg-4 control-label">起租日期</label>
				<input type="text" id="rentStartDate" name="startDate" class="form-control" 
						onClick="laydate()"/>
				<br/> 
				<label class="col-xs-4 col-sm-4 col-md-4 col-lg-4 control-label">截止日期</label>
				<input type="text" id="rentEndDate" name="endDate" class="form-control"
						 onClick="laydate()"/>
				<br/>
				<label class="col-xs-4 col-sm-4 col-md-4 col-lg-4 control-label">车位描述</label>
				<textarea rows="5" name="rentMessage" class="form-control"></textarea> <br/> 
				<label class="col-xs-4 col-sm-4 col-md-4 col-lg-4 control-label">产权复印件</label>
				<input type="file" id="rentPicturetxt" name="rentPic" class="form-control"
					 onchange="PreviewImg(this)">
				<div id="rentPictureShow" style="width: 35%;height:120px; margin: -30px 0px 0px 40%;
						border: solid 1px lightgray;border-radius: 5px;" onclick="tempClick()">
					<img src="" id ="imageShow" style="width: 96%;height:100%;margin-left: 2%"/>
				</div>
				<span id="pictureHint" style="margin:0px 0px 0px 40%"></span><br/><br/> 
				<label class="col-xs-4 col-sm-4 col-md-4 col-lg-4 control-label">车位图片</label>
				<input type="file" name="rentCarPic" class="form-control">		
				<input type="submit" id="addBtn" class="btn btn-info" value="提交" />
	       		<button type="button" class="btn btn-default" data-dismiss="modal"
	       				style="margin:20px 0px 0px 10px">取消</button>
			</form>
	      </div>
	      <div class="modal-footer">
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->	
	
	<script src="js/jquery-3.2.1.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/jQselect.js"></script>
	<script src="js/datepicker/laydate.js"></script>
	<script src="js/userout.js"></script>
</body>
</html>