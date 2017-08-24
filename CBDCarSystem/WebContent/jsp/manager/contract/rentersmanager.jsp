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
<title>租户合约管理</title>
</head>
<body>
<!--header-->
	<%@ include file="../headmanager.jsp"%>
	<%@ include file="../leftmanager.jsp"%>
<section class="rt_wrap content mCustomScrollbar" >
 <div class="rt_content">
      <div role="tabpanel" class="tab-pane" id="scho">
                <div class="check-div form-inline">
                    <div class="col-xs-3">
                        <button class="btn btn-yellow btn-xs" style="margin-top: 10%" data-toggle="modal" data-target="#addSchool">租户签约 </button>
                   		<!-- <button class="btn btn-yellow btn-xs" style="margin-top: 10%" data-toggle="modal" data-target="#addSchool">有效合约 </button>
                   		<button class="btn btn-yellow btn-xs" style="margin-top: 10%" data-toggle="modal" data-target="#addSchool">无效合约 </button>
                   		 -->
                    </div>
                    <div class="col-lg-4 col-xs-5" style="margin-left: 41.5%">
                        合同编号：<input id="getContractName" type="text" class=" form-control input-sm " placeholder="请输入合同编号搜索">
                        <button class="btn btn-primary btn-xs " id="searchBtn">查 询 </button>
                    </div>
                </div>
               
                <div class="data-div" style="height: 250px">
	                <table class="table" style="text-align: center;">
	                	<thead>
	                		<tr>	                			
	                			<td>合同编号</td><td>企业用户名称</td><td>合同生效日期</td><td>合同截止日期</td><td>联系电话</td>
	                			<td>联系人</td><td>操作</td>
	                		</tr>	                	
	                	</thead>
	                	<tbody id="rentersTbody"></tbody>                
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

        <!--弹出添加租户合约窗口-->
              <form action="addrenters.do" method="post" class="form-horizontal" id="addContractVaildForm">
                <div class="modal fade" id="addSchool" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document" style="width:500px">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="gridSystemModalLabel">租户签约</h4>
                            </div>
                            <div class="modal-body">
                                <div class="container-fluid">
                                    
                                        <div class="form-group ">
                                            <label for="sName" class="col-xs-3 control-label">企业用户名称：</label>
                                            <div class="col-xs-8 " >
<!--                                                 <input type="text" class="form-control input-sm duiqi" id="enterpriseName" name="enterpriseName" placeholder="如：成都市天府广场创业中心有限公司）">
 -->                                            	<select class="form-control input-sm duiqi" id="enterpriseName" name="enterpriseName"> </select>													
 													
 											</div> 
                                                                                     
                                        </div>
                                        <div class="form-group ">
                                            <label for="sName" class="col-xs-3 control-label">合同编号：</label>
                                            <div class="col-xs-4 ">
                                                <input type="text" class="form-control input-sm duiqi" id="contractId" name="contractId" onblur="vaildContract()" placeholder="如：停字20141120）">
                                            </div>
                                            <span id="contractIdSpan"></span>
                                        </div>
                                         
                                        <div class="form-group">
                                            <label for="sOrd" class="col-xs-3 control-label">合同生效日期：</label>
                                            <div class="col-xs-4">
                                            	<!-- <input type="button" class="form-control input-sm duiqi" id="startTime" onClick="laydate()">
												<input type="hidden" class="form-control input-sm duiqi" id="startTime3" name="contractStartDate">
 -->                                                 <input type="text" class="form-control input-sm duiqi" id="contractStartDate" onblur="vaildStartDate()" name="contractStartDate" placeholder="如：2015年9月14日" class="laydate-icon" onclick="laydate()">
                                           </div>
                                            <span id="contractStartDateSpan"></span> 
                                        </div>
                                        <div class="form-group">
                                            <label for="sOrd" class="col-xs-3 control-label">合同截止日期：</label>
                                            <div class="col-xs-4">
                                            	<!-- <input type="button" class="form-control input-sm duiqi" id="endTime" onClick="laydate()">
												<input type="hidden" class="form-control input-sm duiqi" id="endTime3" name="contractEndDate">
 -->                                                 <input type="text" class="form-control input-sm duiqi" id="contractEndDate" onblur="vaildEndDate()" name="contractEndDate" placeholder="如：2016年10月12日" class="laydate-icon" onclick="laydate()">
                                            </div>
                                            <span id="contractEndDateSpan"></span>
                                        </div>
                                      
                                </div>
                            </div>
                            <div class="modal-footer">
                                <input type="button" class="btn btn-xs btn-green" id="addEnterBtn" value="提交">
                                <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                            </div>
                        </div>
                    </div>
                </div>
			</form>
			
                <!--弹出续约租户合约窗口-->
              <form action="renewContract.do" method="post" class="form-horizontal" id="renewVaildForm" enctype="multipart/form-data">
                <div class="modal fade" id="reviseSchool" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content" style="width:500px">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="gridSystemModalLabel">租户续约</h4>
                            </div>
                            <div class="modal-body">
                                <div class="container-fluid">
                                   
                                        <div class="form-group ">
                                            <label for="sName" class="col-xs-3 control-label">原合同编号：</label>
                                            <div class="col-xs-6 ">
                                                <input type="text" readonly="readonly" class="form-control input-sm duiqi" id="oldcontractId" name="oldcontractId">
                                            </div>
                                        </div>
                                        <div class="form-group ">
                                            <label for="sName" class="col-xs-3 control-label">新续合同编号：</label>
                                            <div class="col-xs-4 ">
                                                <input type="text" class="form-control input-sm duiqi" id="newContractId" name="newContractId" onblur="vaildNewContract()" placeholder="如停字20162220">
                                            </div>
                                            <span id="newContractIdSpan"></span>
                                        </div>
                                        <div class="form-group">
                                            <label for="sOrd" class="col-xs-3 control-label">联系人：</label>
                                            <div class="col-xs-4">
                                                <input type="text" class="form-control input-sm duiqi" id="enterpriseContact" name="enterpriseContact" onblur="vaildEnterpriseContact()" placeholder="张天航">
                                            </div>
                                            <span id="enterpriseContactSpan"></span>
                                        </div>
                                        <div class="form-group">
                                            <label for="sOrd" class="col-xs-3 control-label">联系电话：</label>
                                            <div class="col-xs-4">
                                                <input type="text" class="form-control input-sm duiqi" id="enterprisePhone" name="enterprisePhone" onblur="vaildenterprisePhone()" placeholder="如：1359833212">
                                            </div>
                                            <span id="enterprisePhoneSpan"></span>
                                        </div>
                                        <div class="form-group">
                                            <label for="sOrd" class="col-xs-3 control-label">合同生效日期：</label>
                                            <div class="col-xs-4">
                                                <input type="text" class="form-control input-sm duiqi" id="contractNewStartDate" name="contractNewStartDate" class="laydate-icon" onblur="vaildNewStartDate()" onclick="laydate()" placeholder="如：2015年9月14日">
                                            </div>
                                            <span id="contractNewStartDateSpan"></span>
                                        </div>
                                        <div class="form-group">
                                            <label for="sOrd" class="col-xs-3 control-label">合同截止日期：</label>
                                            <div class="col-xs-4">
                                                <input type="text" class="form-control input-sm duiqi" id="contractNewEndDate" name="contractNewEndDate" class="laydate-icon" onblur="vaildNewEndDate()" onclick="laydate()"placeholder="如：2016年10月12日" >
                                            </div>
                                            <span id="contractNewEndDateSpan"></span>
                                        </div>
                                        <!-- 图片预览 -->                                      
                                        <div class="form-group">
                                            <label for="sOrd" class="col-xs-3 control-label">上传合同复印件：</label>
                                           
                                           <div class="col-xs-4" style="width:120px;height: 100px">
                                           			 <img id="preview" width="100%" height="100%"/>
                                        	</div>
                                            <div>
                                                <input type="file" id="contractPicture" name="contractPicture" onchange="imgPreview(this)" style="margin-top: 75px">
                                            	<!-- <button id="imgSelectBtn">请选择文件</button> -->
                                            </div>                                           
                                            <span id="contractPictureSpan"></span>
                                        </div>                                    
                                </div>
                            </div>
                            <div class="modal-footer">
                                <input type="button" id="renewEnterBtn" class="btn btn-xs btn-green" value="保 存"/>
                                <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                            </div>
                        </div>
                    </div>
                </div>
               </form>           
            </div>
        </div>
</section>
</body>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery.nouislider.js"></script>
<script type="text/javascript" src="js/datepicker/laydate.js"></script>
<script type="text/javascript" src="js/backgroundSystem/showContract.js"></script>
<script type="text/javascript">
//js验证提交表单

//添加租户合约
//合同编号
 function vaildContract()
 {
	 
	 var contractId=$("#contractId").val();
	 if(contractId=="")
		 {
		 	$("#contractIdSpan").css('color','red');
		 	$("#contractIdSpan").text('合同编号不能够为空');
		 	return false;
		 }
	 else
		 {
			 $("#contractIdSpan").css('color','green');
		 	$("#contractIdSpan").text('合同编号格式输入正确');
		 	return true;
		 }
 }
 //合同开始时间
 function vaildStartDate()
 {
 	var contractStartDate=$("#contractStartDate").val();
 	if(contractStartDate=="")
 		{
 			$("#contractStartDateSpan").css('color','red');
 			$("#contractStartDateSpan").text("合同生效日期不能为空");
 			return false;
 		}
 	else
 		{
 			$("#contractStartDateSpan").css('color','green');
			$("#contractStartDateSpan").text("合同生效日期格式正确");
			return true;
 		}

 }
 //合同结束
 function vaildEndDate()
 {
	 var contractEndDate=$("#contractEndDate").val();
	 if(contractEndDate=="")
		 {
		 	$("#contractEndDateSpan").css('color','red');
		 	$("#contractEndDateSpan").text("合同截至日期不能为空");
		 	return false;
		 }
	 else
		 {
			$("#contractEndDateSpan").css('color','green');
		 	$("#contractEndDateSpan").text('合同截至日期格式正确');
		 	return true;
		 }
 }
 
 $("#addEnterBtn").on('click',function(){
	 if(vaildContract()&vaildStartDate()&vaildEndDate())
		 {
			$("#addContractVaildForm").submit();		 
		 }
 });
 
 
 
 
/******************合约续约*****************************/
//新合约编号
function vaildNewContract()
 {
	 
	 var contractId=$("#newContractId").val();
	 if(contractId=="")
		 {
		 	$("#newContractIdSpan").css('color','red');
		 	$("#newContractIdSpan").text('合同编号不能够为空');
		 	return false;
		 }
	 else
		 {
			 $("#newContractIdSpan").css('color','green');
		 	$("#newContractIdSpan").text('合同编号格式输入正确');
		 	return true;
		 }
 }

//联系人
function vaildEnterpriseContact()
{
	var enterpriseContact=$("#enterpriseContact").val();
	if(enterpriseContact=="")
	{
		$("#enterpriseContactSpan").css('color','red');
	 	$("#enterpriseContactSpan").text("联系人输入不能为空");
	 	return false;
	 }
 else
	 {
		$("#enterpriseContactSpan").css('color','green');
	 	$("#enterpriseContactSpan").text('联系人输入格式正确');
	 	return true;
	 }		
}
//联系电话
function vaildenterprisePhone()
{
	var enterprisePhone=$("#enterprisePhone").val();
	var regex=new RegExp(/^[1][3|4|5|7|8][0-9]{9}$/);
	if(enterprisePhone=="")
		{
			$("#enterprisePhoneSpan").css('color','red');
			$("#enterprisePhoneSpan").text("联系电话不能为空");
		 	return false;
		 }
	 else
		 {			
		 	if(regex.test(enterprisePhone))
		 		{
			 		$("#enterprisePhoneSpan").css('color','green');
				 	$("#enterprisePhoneSpan").text('联系电话格式输入正确');
				 	return true;
		 		}
		 	else
		 		{
			 		$("#enterprisePhoneSpan").css('color','red');
				 	$("#enterprisePhoneSpan").text('联系电话格式输入不正确');
				 	return false;
		 		}			
		 }			
}
//合约开始时间contractNewStartDateSpan
//合同开始时间
 function vaildNewStartDate()
 {
 	var contractStartDate=$("#contractNewStartDate").val();
 	if(contractStartDate=="")
 		{
 			$("#contractNewStartDateSpan").css('color','red');
 			$("#contractNewStartDateSpan").text("合同生效日期不能为空");
 			return false;
 		}
 	else
 		{
 			$("#contractNewStartDateSpan").css('color','green');
			$("#contractNewStartDateSpan").text("合同生效日期格式正确");
			return true;
 		}

 }
//合同结束时间contractNewEndDateSpan
 function vaildNewEndDate()
 {
 	var contractStartDate=$("#contractNewEndDate").val();
 	if(contractStartDate=="")
 		{
 			$("#contractNewEndDateSpan").css('color','red');
 			$("#contractNewEndDateSpan").text("合同结束日期不能为空");
 			return false;
 		}
 	else
 		{
 			$("#contractNewEndDateSpan").css('color','green');
			$("#contractNewEndDateSpan").text("合同结束日期格式正确");
			return true;
 		}

 }
$("#renewEnterBtn").on('click',function(){
	if(vaildNewContract()&vaildEnterpriseContact()&vaildenterprisePhone()&vaildNewStartDate()&vaildNewEndDate())
		{
			$("#renewVaildForm").submit();
		}
});
//文件预览
function imgPreview(fileDom){
    //判断是否支持FileReader
    if (window.FileReader) {
        var reader = new FileReader();
    } else {
        alert("您的设备不支持图片预览功能，如需该功能请升级您的设备！");
    }

    //获取文件
    var file = fileDom.files[0];
    var imageType = /^image\//;
    //是否是图片
    if (!imageType.test(file.type)) {
        alert("请选择图片！");
        return;
    }
    //读取完成
    reader.onload = function(e) {
        //获取图片dom
        var img = document.getElementById("preview");
        //图片路径设置为读取的图片
        img.src = e.target.result;
    };
    reader.readAsDataURL(file);
}

/* $("#contractPicture").hide();
$("#imgSelectBtn").on('click',function(){
	$("#contractPicture").click();
}); */ 
</script>
</html>