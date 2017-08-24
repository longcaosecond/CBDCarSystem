var currentPage=1;
var managerName="";
		findAllManager();
		
		$("#search").click(function(){
			managerName= $("#managerName").val();
			findAllManager();
			$("#managerName").val("");
		});
		
		//查询管理员数据
		function findAllManager(){
			$.ajax({
				url:"findAllManager.do",
				type:"post",
				data:{
					currentPage:currentPage,
					managerName:managerName
				},
				success:function(result){
					//创建表格，显示数据
					createTable(result.manager);
					//创建页码的显示
					currentPage=result.currentPage;
					initPage(result.totalPage);
				},
			});
		}
		//创建管理员表格
		function createTable(result){
			$("#t_body").html("");
			var msg="";
			for(var i=0;i<result.length;i++){
				var quanxian="";
				var powerId="";
				for(var j=0;j<result[i].powers.length;j++){
					quanxian+=result[i].powers[j].powerMiaosu+",";
					if(result[i].powers[j].powerId==5)
						{powerId=5;break;}
				}
				if(powerId==5)continue;
				quanxian=quanxian.substring(0,quanxian.length-1);//
				msg+="<tr align='center'>"+
				"<td>"+result[i].managerAccount+"</td>"+
				"<td>"+result[i].managerName+"</td>"+
				"<td>"+result[i].managerPhone+"</td>"+
				"<td>"+quanxian+"</td>"+
				"<td><button managerId="+result[i].managerId+" class='managerUpdate btn btn-primary btn-xs' data-toggle='modal' data-target='#updateManagerTK'>修改</button>"+
				"<button managerId="+result[i].managerId+" class='managerDelete btn btn-danger btn-xs' data-toggle='modal' data-target='#deleteSchool'>删除</button>"+
				"</td></tr>";
			}
			$("#t_body").html(msg);
			//修改自动传值给弹出框
			$(".managerUpdate").bind("click",function(){
				//先清空
				$(".tankuang").val("");
				$(".checkb").prop("checked",false);
				$(".ts").text("");
				var tds=$(this).parent().parent().children("td");
				$("#managerIdUpdate").val($(this).attr("managerId"));
				$("#managerAccountUpdate").val(tds.eq(0).text());
				$("#managerNameUpdate").val(tds.eq(1).text());
				$("#managerPhoneUpdate").val(tds.eq(2).text());
				//$("#quanxianUpdate").val(tds.eq(3).text());
			});
			//确认删除
			$(".managerDelete").bind("click",function(){
				$("#deletesure").attr("managerId",$(this).attr("managerId"));
			});
		}
		//天加前先清空添加面板
		$("#addbutton").click(function(){
			$(".tankuang").val("");
			$(".checkb").prop("checked",false);
			$(".ts").text("");
		});
		//删除提交
		$("#deletesure").bind("click",function(){
			$.post("deleteManager.do",{managerId:$(this).attr("managerId")},function(result){
				if(result=="ok"){
					alert("删除成功!");
				findAllManager();}
			});
		});
		//修改提交
		$("#updateManagerSure").click(function(){
			updateManagerSure();
			findAllManager();
		});
		//确认更改权限
		function updateManagerSure(){
			var powers=[];//第一位管理员Id，后面的是权限Id
			powers.push($("#managerIdUpdate").val());
			$(".quanxianUpdate").each(function(){
				if($(this).prop("checked")==true)
					powers.push($(this).val());
			});
			$.ajax({
				url:"updateManagerPowers.do",
				data:$.toJSON(powers),
				contentType:"application/json",//这一句不能少
					type:"post",
				success:function(result){
					if(result=="ok")
					{powers.pop();//清空
						findAllManager();
						alert("修改成功");
					}
					else{
						alert("修改失败")
					};
				}
			});
		}
		//添加信管理员
		function addManger(){
			var powers=[];
			$(".quanxianAdd").each(function(){
				if($(this).prop("checked")==true)
					{var power={powerId:$(this).val()}
					powers.push(power);}
			});
			var manager={
					managerAccount:$("#managerAccountAdd").val(),
					managerPwd:	$("#managerPwdAdd").val(),
					managerName:$("#managerNameAdd").val(),
					managerPhone:$("#managerPhoneAdd").val(),
					powers:powers};
			$.ajax({
				url:"addManager.do",
				data:$.toJSON(manager),
				contentType:"application/json",//这一句不能少
					type:"post",
				success:function(result){
					if(result=="ok")
					{	powers.pop();//清空
						findAllManager();
						alert("添加成功");
					}
					else{
						alert("添加失败")
					};
				}
			});
		}
		//创建页码
		function initPage(totalPage){
			$("#begin").unbind("click");
			$("#prev").unbind("click");
			$("#end").unbind("click");
			$("#next").unbind("click");
			if (totalPage==0) {
				alert("没有满足要求的用户记录！");
				$("#page").text(totalPage+" / "+totalPage);
			}else {
				$("#page").text(currentPage+" / "+totalPage);
			}
			
			if (currentPage > 1) {
				$("#begin").click(function(){
					currentPage=1;
					findAllManager();
				});
				
				$("#prev").click(function(){
					currentPage -= 1;
					findAllManager();
				});
			}
			
			if (currentPage < totalPage) {
				$("#next").click(function(){
					currentPage += 1;
					findAllManager();
				});
				
				$("#end").click(function(){
					currentPage=totalPage;
					findAllManager();
				});
			}
			
			if (currentPage == 1) {
				$("#begin").parent().addClass("disabled");
				$("#prev").parent().addClass("disabled");
			}else{
				$("#begin").parent().removeClass("disabled");
				$("#prev").parent().removeClass("disabled");
			}
			
			if (currentPage == totalPage) {
				$("#end").parent().addClass("disabled");
				$("#next").parent().addClass("disabled");
			}else {
				$("#end").parent().removeClass("disabled");
				$("#next").parent().removeClass("disabled");
			}
		}
		//关闭弹框清空输入内容和复选框
		$(".quxiao").click(function(){
			$(".tankuang").val("");
			$(".checkb").prop("checked",false);
			$(".ts").text("");
		});
		//显示验证
		 yanzheng("yz");
		 $("#managerPwdAddSure").blur(function(){
			 managerPwdAddSure();
		 });
		 $("#managerAccountAdd").blur(function(){
			 managerAccount();
		 });
		 
		//验证提示显示(yz是类名)
		function yanzheng(yz){
			$("."+yz).blur(function(){
				var reg=new RegExp($(this).attr("reg"));
				var b=reg.test($(this).val());
				var yzname=$(this).attr("id");
				if(!b)
				{$("#"+yzname+"TS").html("格式不正确");
				$("#"+yzname+"TS").css("color","red");
				}
				else
					{$("#"+yzname+"TS").html("格式正确");
					$("#"+yzname+"TS").css("color","green");
					}});
			$("."+yz).focus(function(){
				var yzname=$(this).attr("name");
				$("#"+yzname+"TS").html("输入中...");
				$("#"+yzname+"TS").css("color","gray");
			});
		}
		//提交时验证(yz是类名)
		function tijiaoyanzheng(yz){
			var b=true;
			$("."+yz).each(function(){
				var reg=new RegExp($(this).attr("reg"));
				var bool=reg.test($(this).val());
				var yzname=$(this).attr("id");
				if(!bool)
				{$("#"+yzname+"TS").html("格式不正确");
				$("#"+yzname+"TS").css("color","red");
				}
				else
					{$("#"+yzname+"TS").html("验证通过");
					$("#"+yzname+"TS").css("color","green");
					}
				b=b&&bool;
			});
			return b;
		}
		//再次确认密码
		function managerPwdAddSure(){
			var reg=new RegExp($("#managerPwdAddSure").attr("reg"));
			var b=reg.test($("#managerPwdAddSure").val());
			if(b){
				var pwd=$("#managerPwdAdd").val();
				var spwd=$("#managerPwdAddSure").val();
			if(pwd==spwd)
				{$("#managerPwdAddSureTS").html("输入正确");
				$("#managerPwdAddSureTS").css("color","green");
				return true;}
			else 
				{$("#managerPwdAddSureTS").html("两次输入不一致 ");
				$("#managerPwdAddSureTS").css("color","red");
				return false;}
		}
		else{
			$("#managerPwdAddSureTS").html("格式不正确");
			$("#managerPwdAddSureTS").css("color","red");
			return false;
		}
		}
		//新增管理员工号格式和重复验证managerAccountAddTS
		function managerAccount(){
			var reg=new RegExp($("#managerAccountAdd").attr("reg"));
			var b=reg.test($("#managerAccountAdd").val());
			if(b){
				b=managerAccountChongFu();
			}
			else{
				$("#managerAccountAddTS").html("格式不正确");
				$("#managerAccountAddTS").css("color","red");
			}
			return b;
		}
		//工号是否重复验证
		function managerAccountChongFu(){
			var b=false;
			$.ajax({
				url:"checkManagerAccount.do",//
				type:"post",
				data:{
					managerAccount:$("#managerAccountAdd").val()
				},
				async:false,
				success:function(result){
					//创建表格，显示数据
					if(result==0)
					{ b=true;
					$("#managerAccountAddTS").html("工号可用");
					$("#managerAccountAddTS").css("color","green");
					}
					else
						{b=false;
						$("#managerAccountAddTS").html("工号已存在");
						$("#managerAccountAddTS").css("color","red");
						}
			},
			error:function(e){
				alert("error");
			}
			});
			return b;
		}
		
		//提交添加
		$("#addManagerSure").click(function(){
			if(managerPwdAddSure()&&tijiaoyanzheng("yz")&&managerAccount())
			{addManger();
			findAllManager();}
		});