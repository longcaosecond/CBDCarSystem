<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="description" content="我要租赁" />
<title>我要租赁</title>
<link rel="stylesheet" href="<c:url value='/css/bootstrap.css'/>" />
<link rel="stylesheet" href="<c:url value='/css/global.css'/>" />

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
<%@ include file="../user_head.jsp"%>

<div class="container">
  <div class="nav"><a href="index.html">首页</a> &gt; 我要租赁 &gt; 车位详情</div>
  <div class="con_car">
    <div class="title"></div>
    <div class="detail">
      <div class="top_car">
        <div class="news_flash">
          <div id="featured"> 
            <!--标签开始 -->
            <div class="slideshowItem" id="image_xixi-01" style="opacity: 1; display: block;"> <a href="#" class="open" > <img src="<c:url value='/images/tp_flash.jpg'/>"> </a>
              <div class="word">
                <h3> </h3>
              </div>
            </div>
            <!--标签结束 -->
            <div class="slideshowItem" id="image_xixi-02" style="opacity: 0; display: none;"><a href="#"> <img src="<c:url value='/images/tp_flash2.jpg'/>"> </a>
              <div class="word">
                <h3> </h3>
              </div>
            </div>
            <div class="slideshowItem" id="image_xixi-03" style="opacity: 0; display: none;"><a  href="#" ><img src="<c:url value='/images/tp_flash3.jpg'/>"> </a>
              <div class="word">
                <h3> </h3>
              </div>
            </div>
            <div class="slideshowItem" id="image_xixi-03" style="opacity: 0; display: none;"><a  href="#" ><img src="<c:url value='/images/tp_flash.jpg'/>"> </a>
              <div class="word">
                <h3> </h3>
              </div>
            </div>
            <div class="slideshowItem" id="image_xixi-05" style="opacity: 0; display: none;"> <a href="#"> <img src="<c:url value='/images/tp_flash2.jpg'/>"> </a>
              <div class="word">
                <h3> </h3>
              </div>
            </div>
          </div>
          
          <script type="text/javascript">
			var target = ["xixi-01","xixi-02","xixi-03","xixi-04","xixi-05"];
		</script> 
        </div>
        <div class="top_car_detail">
          <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_detail">
            <tr>
              <td colspan="2"><span class="name">${requestScope.rent.rentAddress}车位位置</span></td>
            </tr>
            <tr>
              <td width="60">价格：</td>
              <td><span class="red">￥${requestScope.rent.rentPrice}120</span></td>
            </tr>
            <tr>
              <td>出租时间：</td>
              <td><span>${requestScope.rent.rentStartDate}2015-8-9</span>至<span>${requestScope.rent.rentEndDate}2016-9-8</span></td>
            </tr>
            <tr>
              <td>出租人：</td>
              <td>${requestScope.rent.user.userName}</td>
            </tr>
            <tr>
              <td>联系方式：</td>
              <td>${requestScope.rent.user.userPhone}1359899254</td>
            </tr>
            <tr>
              <td valign="top">说明：</td>
              <td valign="top">${requestScope.rent.rent}红色 热情、活泼、热闹、革命、温暖、幸福、吉祥、危险...... 
由于红色容易引起注意，所以在各种媒体中也被广泛的利用，除了具有较佳的明视效果之外，更被用来传达有活力，积极，热诚，温暖，前进等涵义的企业形象与精神，另外红色也常用来作为警告，危险，禁止，防火等标示用色，人们在一些场合或物品上，看到红色标示时，常不必仔细看内容，及能了解警告危险之意，在工业安全用色中，红色即是警告，危险，禁止，防火的指定色。</td>
            </tr>
          </table>
        </div>
      </div>
      <div class="attr_car">
        <div class="title_attr">求租</div>
        <div class="detail_attr">
          <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_attr">
            <tr>
              <th style="text-align: center;"><input name="" type="button" value="申请租车位" class="button_sear" data-toggle="modal" data-target="#myModal"></th>
              
            </tr>
            
          </table>
          
          <!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">请输入留言</h4>
      </div>
      <div class="modal-body">
      <textarea rows="5" cols="90"></textarea>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">确认</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
          
          
         
        </div>
      </div>
     
    </div>
  </div>
</div>
</div<%@ include file="user_foot.jsp"%>>


</body>
<script src="<c:url value='/js/datepicker/laydate.js'/>"></script>
</html>
