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
                        <select class="btn btn-yellow btn-xs" style="margin-top: 10%" id="select">
                        	<option value="0">请选择合约</option>
                        </select>
                        <a href="jsp/manager/park/carmanager.jsp"><button  class="btn btn-yellow btn-xs" style="margin-top: 10%">修改车位 </button></a>
                    </div>
                    <div class="col-lg-4 col-xs-5" style="margin-left: 41.5%">
                        <input type="text" id="shuru" class=" form-control input-sm " placeholder="车位地址/车位编号/合约编号"/>
                        <button id="chaxun" class="btn btn-white btn-xs ">查 询 </button>
                    </div>
                </div>
                <div class="data-div" style="height: 250px">
                <table class="table table-hover" style="color:black;">
						<tr align="center">
							<td>
							全选 <input type="checkbox" id="chooseAll"/>
							</td>
							<td>所在地</td>
							<td>车位编号</td>
							<td>外部合约编号</td>
							<td>租赁状态</td>
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
                <button class="btn btn-white btn-xs" style="margin-left: 40%;font-size: 14px" id="commit"> 提 交 </button>
            </div>
        </div>
</section>
</body>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/jquery.json-2.4.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery.nouislider.js"></script>
<script type="text/javascript" src="js/parkAndContract.js"></script>
</html>