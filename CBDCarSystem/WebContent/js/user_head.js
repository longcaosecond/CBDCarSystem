$.post("getUserBySession.do",function(user){
	var msg="";
	$("#user").html("");
	if(user!=null&&user!="")
		{msg+="<li><a id='userName' href='jsp/user/userInfo.jsp' style='font-size:8px'>"+user.userName+"</a></li>"+
		"<input type='hidden' id='userId' value='"+user.userName+"'>"+
		"<li class='lineli'>|</li>"+
		"<li><a href='exit.do'>注销</a></li>";
		$("#user").html(msg);	
		}
		else
			{msg+="<li><span>游客</span></li>"+
			"<li class='lineli'>|</li>"+
			"<li id='zhuxiao'><a href='login/user/login.jsp'>登录</a></li>";
			$("#user").html(msg);
			}
});