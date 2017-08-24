<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>没有权限</title>
	<link rel="stylesheet" href="css/bootstrap.css">
	<style type="text/css">
		.row{
			height:200px;
			margin-top: 2%
		}
		.col-lg-6{
           
            margin-left: 25%;
            margin-top:10%;
            background-color: white;
            align:center;
            border:1px solid gold;
        }
        .container{
        	background-image:url('images/index.jpg');
        	background-repeat:no-repeat;
        	background-size:100%;
        	height: 670px
        }
        .fontSize{
font-size:32px;
}
.fontSize:hover{
cursor:pointer;
color:blue
}
	</style>		
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-lg-6" >			
	<div  style="text-align:center;margin-top:50px"><img style="width:450px" src="<c:url value='/images/nopower.jpg'/>"></div>
  <div style="text-align:center;"><h1><span class="fontSize" id="esc">切换账号</span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="fontSize" id="backPage">返回</span></h1></div>
			
				
		</div>			
		</div>
	</div>
</body>
	<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
	<script>
	$("#esc").click(function(){
		location.href="managerExit.do";
	});
	$("#backPage").click(function(){
		window.history.back();
		location.reload();
	});
	
	</script>
	
</html>