function checkNeiRong(){
	var pathName = window.document.location.pathname;
	var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
	var info = $("#message").val();
	if(info==""){
            $("#xuqiu").text("投诉内容不能为空");
            $("#xuqiu").css("color","red");
            return false;
	}else{
		var regex = new RegExp("^[\u4e00-\u9fa5]{5,}[0-9]*$");
		if(regex.test(info)){
			 $("#xuqiu").text("");
			 return true;
			
		}else{
			  $("#xuqiu").text("请输入中文或数字，中文不能少于5个字符");
	            $("#xuqiu").css("color","red");
	            return false;
		}
	}
	
}
$("#myform").submit(function(){
	return checkNeiRong();
});