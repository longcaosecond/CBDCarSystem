<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="description" content="我要租赁" />
<title>我要租赁</title>
<link rel="stylesheet" href="<c:url value='/css/bootstrap.css'/>" />
<link rel="stylesheet" href="<c:url value='/css/global.css'/>" />
<link rel="stylesheet" href="<c:url value='/css/rent.css'/>" />

<script src="<c:url value='/js/jquery-3.2.1.min.js'/>"></script>
<script src="<c:url value='/js/bootstrap.js'/>"></script>

<!--[if lt IE 7]>
<script type="text/javascript" src="js/unitpngfix.js"></script>
<![endif]-->
</head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="description" content="我要买车-按车型" />
<title>我要租车位</title>
<script>

</script>
<!--[if lt IE 7]>
<script type="text/javascript" src="js/unitpngfix.js"></script>
<![endif]-->
</head>

<body>
<%@ include file="../jsp/user/user_head.jsp"%>
<div class="container">
  <div class="nav"><a href="index.html">首页</a> &gt; 我要租车位</div>
  <div class="con_buy">
    <div class="title"></div>
    <div class="detail">
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_sear">
        <tr>
          <td width="140" valign="top"><p class="title_sear">查询</p></td>
          <td><div class="sear_item">
              <ul>
                <li><span class="name_item">地址&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                  <ul class="item_ul">
                    <li>
                      <div >
                         <input type="text" class="form-control inp" id="address">
                      </div>
                    </li>
                  </ul>
                </li>
                <li>
                  <ul class="item_ul">
                    <span class="name_item">开始时间</span>
                    <li>
                    <input id="startDate" class="form-control timeicon inpu" placeholder="请输入时间" type="button" onClick="laydate()">
                   
                    </li>
                    <span class="name_item">结束时间</span>
                    <li>
                    <input id="endDate" class="form-control timeicon inpu" placeholder="请输入时间" type="button" onClick="laydate()">
                    </li>
                    
                  </ul>
                </li>
                <li><span class="name_item">价格&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                  <ul class="item_ul">
                    <li>
                    <div >
                         <input name="min" id="minPrice" type="text" class="form-control  inp" reg="^([0-9]{0,9})$">
                         <span id="mints" style="color:red"></span>
                      </div>
                    </li>
                    <li><span class="name_item">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;至&nbsp;&nbsp;&nbsp;&nbsp;</span></li>
                    <li>
                    <div >
                         <input name="max" id="maxPrice" type="text" class="form-control  inp" reg="^([0-9]{0,9})$">
                         <span id="maxts" style="color:red"></span>
                      </div>
                    </li>
                  </ul>
                </li>
              </ul>
            </div></td>
          <td align="right" valign="bottom"><input name="" id="findBtn" type="button" value="查询" class="button_sear"></td>
        </tr>
      </table>
      <div class="search_list" id="tables">
        
      </div>
      <table cellspacing="0" cellpadding="0" border="0" width="100%"  >
        <tbody>
          <tr>
            <td>&nbsp;</td>
            <td align="right"><ul class="page-nav" id="pages">
               
              </ul></td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</div<%@ include file="../jsp/user/user_foot.jsp"%>>


</body>
<script src="<c:url value='/js/datepicker/laydate.js'/>"></script>
<script src="<c:url value='/js/buy.js'/>"></script>
</html>
