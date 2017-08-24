
function checkUserName()
	{
		//用户名	
		var userName=$("#userName").val();
		
		if(userName.length==0)
		{	
			$("#yanzhangmaSpan").css('color','red');
			$("#yanzhangmaSpan").text('用户名输入不能为空');
			return false;
		}
		else
		{				
			$("#yanzhangmaSpan").text("");
			return true;
		}
	}
		//密码
	function checkUserPwd(){
		var userPwd=$("#userPwd").val();
		var regexPwd=new RegExp(/^[0-9a-zA-Z]{6,16}$/);
		
		if(userPwd=="")
		{
			$("#yanzhangmaSpan").css('color','red');
			$("#yanzhangmaSpan").text('密码输入不能为空');
			return false;
		}
		else
		{
			if(regexPwd.test(userPwd))
				{	
					$("#yanzhangmaSpan").text("");
					return true;
				}
			else
				{
					$("#yanzhangmaSpan").css('color','red');
					$("#yanzhangmaSpan").text('密码格式输入不正确');
					return false;
				}			
		}
	}
	var YZMFlag=false;
	//验证码
	function checkYanZhengMa()
	{
		var yanzhengma=$("#Yanzhengma").val();
		if(yanzhengma=="")
			{
				$("#yanzhangmaSpan").css('color','red');
				$("#yanzhangmaSpan").text('验证码输入不能为空');	
				return false;
			}
			
		else
			{
				var stringCode=$("#Yanzhengma").val();			
				$.ajax({					
					url:"checkImageCode.do?stringCode="+stringCode,
					type:"get",
					datatype:"json",					
					success:function(result)
					{
						if(result=="ok")
							{
								$("#yanzhangmaSpan").css('color','green');
								$("#yanzhangmaSpan").text('验证码输入正确');
								YZMFlag=true;
							}
						else if(result=="error")
							{
								$("#yanzhangmaSpan").css('color','red');
								$("#yanzhangmaSpan").text('验证码输入不正确');
								return false;
								
							}
						else if(result=="ImageCodeError")
							{
								$("#yanzhangmaSpan").css('color','red');
								$("#yanzhangmaSpan").text('验证码失效，请刷新验证码');
								return false;
							}
					}
					
				});
				
			}
	}


		$("#loginBtn").click(function(){
			//表单提交验证
			if(checkUserName() && checkUserPwd()&& YZMFlag)
			{
				$("#myform").submit();				
			}
			
			
		});
	


