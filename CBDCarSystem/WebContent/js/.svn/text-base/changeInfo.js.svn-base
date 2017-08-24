function checkWork(){
	var work = $("#userWork").val();
	if(work!=null){
		var regex = new RegExp("^[\u4e00-\u9fa5]{1,10}$");
		if(!(regex.test(work))){
			$("#work").text("格式错误,请输入中文1-10");
			$("#work").css("color","red");
			return false;
		}else{
			$("#work").text("");
		}
	}
	return true;
}
function checkPhone(){
	var phone = $("#userPhone").val();
	if(phone!=""){
		var regex = new RegExp("^1[34578][0-9]{9}$");
		if(!(regex.test(phone))){
			$("#phone").text("格式错误,请输入有效的电话");
			$("#phone").css("color","red");
			return false;
		}else{
			$("#phone").text("");
			return true;
		}
	}else{
		$("#phone").text("电话不能为空");
		$("#phone").css("color","red");
		return false;
	}
}
function checkEmail(){
	var email = $("#userEmail").val();
	if(email!=null){
		var regex = new RegExp("^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$");
		if(!(regex.test(email))){
			$("#email").text("格式错误,请输入正确的email地址");
			$("#email").css("color","red");
			return false;
		}else{
			$("#email").text("");
		}
	}
	return true;
}
function checkHome(){
	var home = $("#userHome").val();
	var addresReg = /^[\u4e00-\u9fa5]+[市][\u4e00-\u9fa5]+[区|县]$/;
	if(home==""){
		$("#home").text("住址不能为空");
		$("#home").css("color","red");
		return false;
	}else{
		if(addresReg.test(home)){
			$("#home").text("");
			return true;
		}else{
			$("#home").text("格式错误 参照格式:XX市 XX区/县");
			$("#home").css("color","red");
			return false;
		}
	}
}
$("#tijiao").submit(function(){
	var boo = checkWork()&&checkPhone()&&checkEmail()&&checkHome();
	return boo;
});
