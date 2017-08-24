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
<title>CBD车位管理</title>
</head>
<body>
<!--header-->
	<%@ include file="../headmanager.jsp"%>
	<%@ include file="../leftmanager.jsp"%>
<section class="rt_wrap content mCustomScrollbar">
 <div class="rt_content">
      <div role="tabpanel" class="tab-pane" id="scho">
                <div class="check-div form-inline">
                    <div class="col-xs-3">
                        <button id="atest" class="btn btn-yellow btn-xs" style="margin-top: 10%" data-toggle="modal" data-target="#addChewei">添加CBD车位 </button>
                        <a href="jsp/manager/park/parkAndContract.jsp"><button  class="btn btn-yellow btn-xs" style="margin-top: 10%">CBD车位出租 </button></a>
                    </div>
                    <div class="col-lg-4 col-xs-5" style="margin-left: 41.5%">
                        <input type="text" id="shuru" class=" form-control input-sm " placeholder="车位地址/车位编号合/同编号搜索"/>
                        <button id="chaxun" class="btn btn-white btn-xs ">查 询 </button>
                    </div>
                </div>
                <div class="data-div" style="height: 250px">
                <table class="table table-hover" style="color:black;">
		<tr align="center">
			<td>所在地</td>
			<td>车位编号</td>
			<td>外部合约编号</td>
			<td>租赁合约编号</td>
			<td>租赁状态</td>
			<td>操作</td>
		</tr>
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

                 <!--弹出添加车位窗口-->
                <div  class="modal fade" id="addChewei" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div  class="modal-dialog" role="document">
                        <div style="width:250%;margin-left:-60%" class="modal-content">
                            <div class="modal-header" >
                                <button type="button" class="close quxiao" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="gridSystemModalLabel">添加CBD车位</h4>
                            </div>
                            <div class="modal-body">
                                <div  class="container-fluid">
                                   
                                    	<div class="form-group " style="margin-left: 40%">
                                            <label for="sLink" class="col-xs-3 control-label">单个添加</label>
                                        </div>
                                        <table style="margin-left:5%; width:90%;"><tr>
                                        <td>
                                        <div class="form-group  ">
                                            <label for="sName" class="col-xs-4 control-label">外部合同编号：</label>
                                            <div class="col-xs-6 ">
                                                <select id="companyIdhetong" name="outContractId" class="hetong form-control input-sm duiqi hetong"></select>
                                            </div>
                                        </div>
                                        </td>
                                        <td></td><td></td><td></td>
                                        </tr><tr><td>
                                        <div class="form-group  ">
                                            <label for="sName" class="col-xs-4 control-label">车位编号：</label>
                                            <div class="col-xs-6 ">
                                                <input reg="^[\u4E00-\u9FA50-9a-zA-Z_-]{1,20}$" id="parkNumber" name="parkNumber" type="text" class="form-control input-sm duiqi yz"  placeholder="如:CF303">
                                            </div>
                                        </div></td><td width=100px><span id="parkNumberts" class="ts">&nbsp;</span></td>
                                        <td><div class="form-group  ">
                                            <label for="sName" class="col-xs-4 control-label">车位所在地址：</label>
                                            <div class="col-xs-6 ">
                                                <input reg="^[\u4E00-\u9FA50-9a-zA-Z_-]{1,20}$" type="text" name="parkAddress" class="form-control input-sm duiqi yz" id="parkAddress" placeholder="如：成都市天府广场创业中心158号">
                                            </div>
                                        </div></td><td width=100px><span id="parkAddressts" class="ts">&nbsp;</span></td>
                                        </tr>
                                        </table>
                                        <div class="modal-footer">
                                <input type="button"id="danbaocun" class="btn btn-xs btn-green " value="保 存"></input>
                                <input type="button" class="btn btn-xs btn-white quxiao" data-dismiss="modal" value="取 消"></input>
                            </div>
                                        <div class="form-group " style="margin-left: 40%">
                                            <label for="sLink" class="col-xs-3 control-label">批量添加</label>
                                        </div>
                                        <table style="margin-left:5%; width:90%;"><tr>
                                        <td>
                                        <div class="form-group  ">
                                            <label for="sName" class="col-xs-4 control-label">外部合同编号：</label>
                                            <div class="col-xs-6 ">
                                             <select id="companyIdshetong" name="outContractIds"  class="form-control input-sm duiqi hetong"></select>
                                            </div>
                                        </div>
                                        </td>
                                        <td></td><td></td><td></td>
                                        </tr><tr><td>
                                        <div class="form-group  ">
                                            <label for="sName" class="col-xs-4 control-label">车位编号开始名：</label>
                                            <div class="col-xs-6 ">
                                                <input reg="^[\u4E00-\u9FA50-9a-zA-Z_-]{1,10}$" type="text" class="form-control input-sm duiqi yzs " id="parkNumbers" name="parkNumbers" placeholder="如:CF">
                                            </div>
                                        </div></td><td width=100px><span id="parkNumbersts" class="ts">&nbsp;</span></td>
                                        <td><div class="form-group  ">
                                            <label for="sName" class="col-xs-4 control-label">车位所在地址：</label>
                                            <div class="col-xs-6 ">
                                                <input reg="^[\u4E00-\u9FA50-9a-zA-Z_-]{1,20}$" type="text" class="form-control input-sm duiqi yzs " id="parkAddresss" name="parkAddresss" placeholder="如：成都市天府广场创业中心158号">
                                            </div>
                                        </div></td><td width=100px><span id="parkAddresssts" class="ts">&nbsp;</span></td>
                                        </tr>
                                        <tr><td>
                                        <div class="form-group  ">
                                            <label for="sName" class="col-xs-4 control-label">编号开始数字：</label>
                                            <div class="col-xs-6 ">
                                                <input reg="^[0-9]{1,9}$" type="text" class="form-control input-sm duiqi yzs " id="startnum" name="startnum" placeholder="如:1">
                                            </div>
                                        </div></td><td width=100px><span id="startnumts" class="ts">&nbsp;</span></td>
                                        <td><div class="form-group  ">
                                            <label for="sName" class="col-xs-4 control-label">编号结束数字：</label>
                                            <div class="col-xs-6 ">
                                                <input reg="^[0-9]{1,10}$" type="text" class="form-control input-sm duiqi yzs " id="endnum" name="endnum" placeholder="如:20">
                                            </div>
                                        </div></td><td width=100px><span id="endnumts" class="ts">&nbsp;</span></td>
                                        </tr>
                                        </table>
                                    <div class="modal-footer">
                                <input type="button" id="duobaocun" class="btn btn-xs btn-green "  value="保 存"></input>
                                <input type="button" class="btn btn-xs btn-white quxiao" data-dismiss="modal" value="取 消"></input>
                            </div>
                            <div class="form-group " style="margin-left: 40%">
                                           <input type="button" id="quanbubaocun" class="btn btn-xs btn-green "  value="全部保 存"></input>
                                <input type="button" class="btn btn-xs btn-white quxiao" data-dismiss="modal" value="取 消"></input>  
                                        </div>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                </div>
                
                <!-- 弹出修改框 -->
						<div class="modal fade" id="xiugai" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close quxiao" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="gridSystemModalLabel">修改CBD车位</h4>
                            </div>
                            <div class="modal-body">
                                <div class="container-fluid">
                                    
                                    	<div class="form-group " style="margin-left: 45%">
                                            <label for="sLink" class="col-xs-6 control-label">修改</label>
                                            <input type="hidden" id="parkIdUpdate"/>
                                        </div>
                                        <table >
                                        <tr><td>
                                        <div class="form-group  ">
                                            <label for="sName" class="col-xs-5 control-label">外部合同编号：</label>
                                            <div class="col-xs-7 ">
                                             <select id="hetongUpdate" name="hetongUpdate"  class="form-control input-sm duiqi hetong"></select>
                                            </div>
                                        </div>
                                        </td></tr>
                                        <tr><td>
                                        <div class="form-group  " style="margin-top: 15px">
                                            <label for="sName" class="col-xs-5 control-label">车位编号：</label>
                                            <div class="col-xs-7 ">
                                                <input reg="^[\u4E00-\u9FA50-9a-zA-Z_-]{1,20}$" id="parkNumberUpdate" name="parkNumberUpdate" type="text" class="form-control input-sm duiqi yzUpdate"  placeholder="如:CF303">
                                            </div>
                                        </div></td></tr><tr><td>
                                        	<div class="form-group  ">
                                            <label for="sName" class="col-xs-5 control-label">&nbsp;</label>
                                            <div class="col-xs-7 ">
                                            	<span id="parkNumberUpdatets" class="ts"></span>
                                            </div>
                                        </div>
                                        	</td></tr>
                                        <tr><td>
                                        <div class="form-group  ">
                                            <label for="sName" class="col-xs-5 control-label">车位所在地址：</label>
                                            <div class="col-xs-7 ">
                                                <input reg="^[\u4E00-\u9FA50-9a-zA-Z_-]{1,20}$" type="text" class="form-control input-sm duiqi yzUpdate " id="parkAddressUpdate" name="parkAddressUpdate" placeholder="如：成都市天府广场创业中心158号">
                                            </div>
                                        </div></td></tr>
                                        <tr><td>
                                        	<div class="form-group  ">
                                            <label for="sName" class="col-xs-5 control-label">&nbsp;</label>
                                            <div class="col-xs-7 ">
                                            	<span id="parkAddressUpdatets" class="ts"></span>
                                            </div>
                                        </div>
                                        	</td></tr>
                                        	
                                        	<tr><td>
                                        	<div class="form-group" id="jiechu">
                                            <label for="sName" class="col-xs-5 control-label"></label>
                                            <div class="col-xs-7" id="zhuangtaidiv">
                                            	解除租赁&nbsp;&nbsp;<input type="checkbox" id="zhuangtai" value=1/>
                                            </div>
                                        </div>
                                        	</td></tr>
                                         </table>
                                    
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" id="parkUpdate" class="btn btn-xs btn-green"data-dismiss="modal">修改</button>
                                <button type="button" class="btn btn-xs btn-white quxiao" data-dismiss="modal">取 消</button>
                            </div>
                        </div>
                    </div>
                </div>                <!-- ******** -->
            </div>
        </div>
</section>
</body>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery.nouislider.js"></script>
<script type="text/javascript" src="js/carmanager.js"></script>
</html>