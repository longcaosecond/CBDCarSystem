/**
 * 
 */
 function vaildNewPwd()
 {
 	var pwd=$("#newPwd").val();
 	var regexPwd=new RegExp(/^[0-9a-zA-Z]{6,16}$/);
 	if(pwd.length==0)
 		{
 			$("#newPwdSpan").css('color','red');
 			$("#newPwdSpan").text("密码输入不能为空");
 			return false;
 		}
 	else
 		{
 			if(regexPwd.test(pwd))
 				{
 					$("#newPwdSpan").css("color","green");
 					$("#newPwdSpan").text("密码格式输入正确");
 					return true;
 				}
 			else
 				{
 					$("#newPwdSpan").css("color","red");
 					$("#newPwdSpan").text("密码格式输入不正确");
 					return false;
 				}
 		} 
 }
/**
 * 验证确认密码，验证两次密码输入一致，非空验证和正则表达验证
 */
 function vaildSurePwd()
 {
	 var suerPwd=$("#surePwd").val();
	 var regexPwd=new RegExp(/^[0-9a-zA-Z]{6,16}$/);
	 
	 if(suerPwd.length==0)
		 {//非空验证
		 	$("#surePwdSpan").css("color","red");
		 	$("#surePwdSpan").text("密码输入不能为空");
		 	return false;
		 }
	 else
		 {//先验证正则表达式，然后密码一致性验证
			 if(regexPwd.test(suerPwd))
				{//正则验证
				    var pwd=$("#newPwd").val();		
				 	if(pwd!=suerPwd)
				 		{//密码一致性验证
					 		$("#surePwdSpan").css("color","red");
						 	$("#surePwdSpan").text("两次密码输入不一致");
						 	return false;
				 		}
				 	else
				 		{
					 		$("#surePwdSpan").css("color","green");
						 	$("#surePwdSpan").text("两次密码输入一致");
						 	return true;
				 		}
				
				}
			 else
				 {
					$("#surePwdSpan").css("color","red");
				 	$("#surePwdSpan").text("密码输入格式不正确");
				 	return false;				 
				 }
 	}
 }
/**
 * 手机号码验证
 */
function vaildPhone()
{
	var phone=$("#phone").val();
	var regexPhone=new RegExp(/^[1][3|4|5|7|8][0-9]{9}$/);
	
	if(phone.length==0)
		{
			$("#phoneSpan").css("color","red");
			$("#phoneSpan").text("手机号码输入不能为空");
			return false;
		}
	else
		{			
			if(regexPhone.test(phone))
				{
					$("#phoneSpan").css("color","green");
					$("#phoneSpan").text("手机号码输入正确");
					return true;
				}
			else
				{
					$("#phoneSpan").css("color","red");
					$("#phoneSpan").text("手机号格式输入不正确");
					return false;
				}
		}	
}
$("#EnterBtn").click(function(){
	if(vaildPhone()&&vaildSurePwd()&&vaildNewPwd())
		{
			$("#updateVaild").submit();
		}
})
