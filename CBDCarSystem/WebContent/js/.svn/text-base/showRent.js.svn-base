$("#queren").bind("click",function(){
	$.ajax({
		url:"addWant.do",
		data:{
			rentId:$("#rentId").val(),//
			
			 liuyan:$("#liuyan").val()//留言板
			},
			type:"post",
		success:function(result){
			//alert(result);
			shengqing();
		},
	});
});
shengqing();
//判断是否已经申请
function shengqing(){

	$.post("selectWantsByUserId.do",{rentId:$("#rentId").val()},function(res){
		$("#shengqing").html("");
		var msg="";
		if(res=="true"||res=='')//没有留过言
		{//alert("未留言"+res);
		msg="<input name='' id='want' type='button' value='申请租车位' class='button_sear' data-toggle='modal' data-target=''>"
		}
	else 
		{//alert("留过言");
		msg="<input name='' id='want' type='button' value='您已申请过' disabled='disabled' class='button_sear' data-toggle='modal' data-target='' >"
		}
		$("#shengqing").html(msg);
		isLogin();
});

}
//判断是否已经登录
function isLogin(){
	$.post("isLogin.do",function(res){
		if(res=="true")
			{//alert("通过");
			$("#want").attr('data-target','#myModal')}
		else
			{//alert("请登录");
			$("#want").attr('data-target','#mylogin')
			}
		
	});
}

$("#gologin").click(function(){
	location.href="login/user/login.jsp";
});