		var currentPage=1;
		findAllManager();
		//查询管理员数据
		function findAllManager(){
			$.ajax({
				url:"findCurrentManager.do",//
				type:"post",
				data:{
					currentPage:currentPage
				},
				success:function(result){
					//创建表格，显示数据
					if(result==null||result==""){
						alert("您已掉线,请重新登录!");
						location.href="login/manager/LoginTest.jsp";
					}
					else
						createTable(result);
					
				},
			});
		}
		//创建管理员表格
		function createTable(result){
			$("#t_body").html("");
			var msg="";
		
				var quanxian="";
				for(var j=0;j<result.powers.length;j++){
					if(result.powers[j].powerMiaosu!=""&&result.powers[j].powerMiaosu!=null)
					quanxian+=result.powers[j].powerMiaosu+",";
				}
				quanxian=quanxian.substring(0,quanxian.length-1);//
				msg+="<tr align='center'>"+
				"<td>"+result.managerAccount+"</td>"+
				"<td>"+result.managerName+"</td>"+
				"<td>"+result.managerPhone+"</td>"+
				"<td>"+quanxian+"</td>"+
				"<td><button type='button' class='managerUpdate btn btn-primary btn-xs' data-toggle='modal' data-target='#reviseUser'>修改</button></td>"+
			"</tr>";
			
			$("#t_body").html(msg);
			//修改自动传值给弹出框
			$(".managerUpdate").bind("click",function(){
				$(".tankuang").val("");
				$(".ts").text("");
				var tds=$(this).parent().parent().children("td");
				$("#managerAccountUpdate").val(tds.eq(0).text());
				$("#managerNameUpdate").val(tds.eq(1).text());
				$("#managerPhoneUpdate").val(tds.eq(2).text());
				$("#quanxianUpdate").val(tds.eq(3).text());
			});
		}
		
		//关闭弹框清空输入内容
		$(".quxiao").click(function(){
			$(".tankuang").val("");
			$(".ts").text("");
		});
		//显示输入验证提示
		$("#password").blur(function(){password()});
		$("#newPassword").blur(function(){newPassword()});
		$("#newPasswordAgain").blur(function(){newPasswordAgain()});
		$("#managerPhoneUpdate").blur(function(){managerPhoneUpdate()});
		//提交
		 $("#sure").click(function(){
			 if(password()&&newPassword()&&newPasswordAgain()&&managerPhoneUpdate())
			 updateManager();
		 });
		//更新个人信息
		function updateManager(){
			$.ajax({
				url:"updateManager.do",//
				type:"post",
				data:{
				newPwd:$("#newPassword").val(),
				phone:$("#managerPhoneUpdate").val()
				},
				success:function(result){
					//创建表格，显示数据
					if(result=="ok")
					{findAllManager();
						alert("修改成功");
					}
					else if(result=="notLogin") 
						{alert("您已掉线请重新登陆!");
						location.href="login/manager/LoginTest.jsp";}
					else{
						alert("修改失败");
					}
				},
					error:function(e){
						alert("error");
					}
			});
		}
		//密码是否正确验证
		function checkManagerPwd(){
			var b=false;
			$.ajax({
				url:"checkManagerPwd.do",//
				type:"post",
				data:{
				password:$("#password").val()
				},
				async:false,
				success:function(result){
					//创建表格，显示数据
					if(result=="ok")
					{ b=true;
						
					}
					else if(result=="false")
						{b=false;
						}
					else 
						{alert("您已掉线，请重新登陆!");
						location.href="login/manager/LoginTest.jsp";}
				},
					error:function(e){
						alert("error");
					}
			});
			return b;
		}
		//****************验证格式
		//原始密码验证
		function password(){
			var bool=false;
			var reg=new RegExp($("#password").attr("reg"));
			if(reg.test($("#password").val())){
				var b=checkManagerPwd();
				if(b){$("#passwordTS").css("color","green");
				$("#passwordTS").text("密码正确");
				bool=true;
					}
				else{$("#passwordTS").css("color","red");
				$("#passwordTS").text("密码不正确");
					}
			}
			else{
				$("#passwordTS").css("color","red");
				$("#passwordTS").text("格式不正确");
			}
			return bool;
		} 
		//新密码验证
		function newPassword(){
			var bool=false;
			var reg=new RegExp($("#newPassword").attr("reg"));
			if(reg.test($("#newPassword").val())){
				bool=true;
				$("#newPasswordTS").css("color","green");
				$("#newPasswordTS").text("格式正确");
			}
			else{
				$("#newPasswordTS").css("color","red");
				$("#newPasswordTS").text("格式不正确");
			}
			return bool;	
		}
		//新密码确认验证
		function newPasswordAgain(){
			var bool=false;
			var reg=new RegExp($("#newPasswordAgain").attr("reg"));
			if(reg.test($("#newPasswordAgain").val())){
				if($("#newPasswordAgain").val()==$("#newPassword").val()){
				bool=true;
				$("#newPasswordAgainTS").css("color","green");
				$("#newPasswordAgainTS").text("格式正确");}
				else{
					$("#newPasswordAgainTS").css("color","red");
					$("#newPasswordAgainTS").text("两次密码输入不一致");
				}
			}
			else{
				$("#newPasswordAgainTS").css("color","red");
				$("#newPasswordAgainTS").text("格式不正确");
			}
			return bool;	
		} 
		//手机号验证
		function managerPhoneUpdate(){
			var bool=false;
			var reg=new RegExp($("#managerPhoneUpdate").attr("reg"));
			if(reg.test($("#managerPhoneUpdate").val())){
				bool=true;
				$("#managerPhoneUpdateTS").css("color","green");
				$("#managerPhoneUpdateTS").text("格式正确");
			}
			else{
				$("#managerPhoneUpdateTS").css("color","red");
				$("#managerPhoneUpdateTS").text("格式不正确");
			}
			return bool;	
		}
		//**********************
		