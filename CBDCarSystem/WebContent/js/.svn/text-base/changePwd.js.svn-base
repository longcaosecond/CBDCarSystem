 boo = false;
	function checkOldPwd(){
	var oldPwd = $("#oldPwd").val();
	var userId = $("#biaoshi").val();
	if(oldPwd==""){
		$("#old").text("原密码不能为空");
		$("#old").css("color","red");
		return false;
	}else{
		var regex = new RegExp("^[0-9]{8,15}$");
		if(regex.test(oldPwd)){
			var pathName = window.document.location.pathname;
			var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
			 $.ajax({
				 url:projectName+"/checkPwd.do",
				 type:"get",
				 asnyc:"false",
				 data:{userId:userId,userPwd:oldPwd},
				 success:function(result){
					
					 if(result==""){
						 $("#old").text("");
							boo = true;
					 }else{
						
						 $("#old").text("原密码不正确");
							$("#old").css("color","red");
							
					 }
				 }
			 });
			 return boo;
		}else{
			$("#old").text("格式错误");
			$("#old").css("color","red");
			return false;
		}
	}
}
	function checkNewPwd(){
		var newPwd = $("#newPwd").val();
		if(newPwd==""){
			$("#new").text("新密码不能为空");
			$("#new").css("color","red");
			return false;
		}else{
			var regex = new RegExp("^[0-9]{8,15}$");
			if(regex.test(newPwd)){
				$("#new").text("");
				return true;
			}else{
				$("#new").text("格式错误，请输入8-15位数字");
				$("#new").css("color","red");
				return false;
			}
		}
	}
	function checkUserPwd(){
		var userPwd = $("#userPwd").val();
		var newPwd = $("#newPwd").val();
		if(userPwd==""){
			$("#sure").text("请确认新密码");
			$("#sure").css("color","red");
			return false;
		}else{
			if(userPwd==newPwd){
				$("#sure").text("");
				return true;
			}else{
				$("#sure").text("两次密码不一致");
				$("#sure").css("color","red");
				return false;
			}
		}
	}
	$("#tijiao").submit(function(){
		var boo = checkOldPwd()&&checkNewPwd()&&checkUserPwd();
		return boo;
	});