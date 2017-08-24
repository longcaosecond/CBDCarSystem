/**
 * 
 */
function oldenterprisePwdupdates(){
		var oldenterprisePwdupdate=$("#oldenterprisePwdupdate").val()
			$.ajax({
				url:"../../oldenterprisePwdupdate.do",
				type:"post",
				data:{"oldenterprisePwdupdate":oldenterprisePwdupdate,"userId":userId},
				success:function(result){
						if(result=="0"){
							$("#enterprisePwdSpanupdate").text("原密码正确")
							$("#enterprisePwdSpanupdate").css("color","green")
						}else{
							$("#enterprisePwdSpanupdate").text("原密码错误")
							$("#enterprisePwdSpanupdate").css("color","red")
						}
					}
			})
			if($("#enterprisePwdSpanupdate").text()=="原密码正确"){
				return true;
			}else{
				return false;
			}
	}
function enterprisePwds(){
	var enterprisePwd=$("#newenterprisePwdupdate").val()
	if(RegExpPwd.test(enterprisePwd)){
		$("#newenterprisePwdSpanupdate").text("密码格式正确")
		$("#newenterprisePwdSpanupdate").css("color","green")
		return true;
	}else{
		$("#newenterprisePwdSpanupdate").text("格式错误，请重新输入")
		$("#newenterprisePwdSpanupdate").css("color","red")
		return false;
	}
}
function reenterprisePwds(){
	var enterprisePwd=$("#newenterprisePwdupdate").val()
	var reenterprisePwd=$("#reenterprisePwdupdate").val()
	if(reenterprisePwd!=""){
		if(enterprisePwd==reenterprisePwd){
			$("#reenterprisePwdSpanupdate").text("密码验证通过")
			$("#reenterprisePwdSpanupdate").css("color","green")
			return true;
		}else{
			$("#reenterprisePwdSpanupdate").text("两次密码不同，请重新输入")
			$("#reenterprisePwdSpanupdate").css("color","red")
			return false;
		}
	}else{
		$("#reenterprisePwdSpanupdate").text("密码不能为空，请重新输入")
		$("#reenterprisePwdSpanupdate").css("color","red")
		return false;
	}
}
function updateEnterPricelc(){
	if(oldenterprisePwdupdates()&&enterprisePwds()&&reenterprisePwds()){
		$("#formEnterPrice").submit();
	}else{
		alert("页面有错误信息，请修改后再提交")
	}
}
function main(){
	RegExpPwd=new RegExp(/^[0-9a-zA-Z]{6,13}$/);
	currentPage=1;
	userId=$("#userNamelc").val();
	showCompanyCar(currentPage);
}

function toDate(r){
	var d=new Date(r);
	return d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate();
}
function showCompanyCar(currentPage){
	companyCarTbody=$("#companyCarTbody")
	$.ajax({
		url:"../../findAllCompanyCar.do",
		type:"post",
		data:{"currentPage":currentPage,"userId":userId},
		success:function(result){
			results=result.parks;
		 	var msg="";			 	
			for(var i=0;i<results.length;i++){
				msg+="<tr style='text-align:center;height:40px'><td>"+results[i].parkId+"</td><td>"+results[i].parkNumber+"</td><td>"+results[i].parkAddress+"</td></tr>" 
			}
			companyCarTbody.html(msg);
			createPage(result.totalPage,currentPage);
		}
	})
	$("#isRent").click(function(){
		location.href="companyisrent.jsp";
	})
	$("#isNotRent").click(function(){
		$.ajax({
			url:"../../findAllCompanyCarIsNotRent.do",
			type:"post",
			data:{"currentPage":currentPage,"userId":userId},
			success:function(result){
				alert(result.parks.length)
				results=result.parks;
			 	var msg="";			 	
				for(var i=0;i<results.length;i++){
					msg+="<tr style='text-align:center;height:40px'><td>"+results[i].parkId+"</td><td>"+results[i].parkNumber+"</td><td>"+results[i].parkAddress+"</td></tr>" 
				}
				companyCarTbody.html(msg);
				createPage(result.totalPage,currentPage);
			}
		})
	})
	$("#allrentlc").click(function(){
		location.href="company1.jsp";
	})
}
function showRentCar(){
	currentPage=1;
	userId=$("#userNamelc").val();
	companyCarTbodyRent=$("#companyCarTbodyRent")
	$.ajax({
		url:"../../findAllCompanyCarIsRent.do",
		type:"post",
		data:{"currentPage":currentPage,"userId":userId},
		success:function(result){
			alert(result.parks.length)
			results=result.parks;
		 	var msg="";			 	
			for(var i=0;i<results.length;i++){
				msg+="<tr style='text-align:center;height:40px'><td>"+results[i].parkId+"</td><td>"+results[i].parkNumber+"</td><td>"+results[i].parkAddress+"</td><td>"+toDate(results[i].parkContract.contractStartDate)+"</td><td>"+toDate(results[i].parkContract.contractEndDate)+"</td></tr>" 
			}
			companyCarTbodyRent.html(msg);
			createPage(result.totalPage,currentPage);
		}
	})
	$("#allrentlcRent").click(function(){
		location.href="company1.jsp";
	})
}
//创建分页按钮的功能实现
function createPage(totalPage, currentPage) {
	// 跳转首页
	$("#first").unbind("click");
	$("#first").click(function() {
		currentPage = 1;
		$("#first").addClass("disabled");
		showCompanyCar(currentPage);
	});

	// 跳转尾页
	$("#last").unbind("click");
	$("#last").click(function() {
		currentPage = totalPage;
		$("#last").addClass("disabled");
		showCompanyCar(currentPage);
	});
	// 设置跳转至上一页
	if (currentPage == 1) {
		$("#prev").addClass();
	} else {
	$("#prev").attr("style", "cursor:default !important;");
	}
	$("#prev").unbind("click");
	$("#prev").click(function() {
		if (currentPage > 1) {
			showCompanyCar(currentPage - 1); // 向servlet发送异步请求
		}
	});

	// 设置跳转至下一页
	if (currentPage == totalPage) {
		$("#next").addClass("disabled");
	} else {
		$("#next").addClass("disabled");
	}
	$("#next").unbind("click");
	$("#next").click(function() {
		if (currentPage < totalPage) {
			showCompanyCar(currentPage + 1);
		}
	});

	// 点击跳转至指定页面
	$("#goes").val(currentPage);
	$("#totpage").text(totalPage);
	$("#gopage").unbind("click");
	$("#gopage").click(function() {
	currentPage = $("#goes").val(); // 通过点击事件获取nowPage的值
	$("#gopage").attr("style", "cursor:default !important;");
	showCompanyCar(currentPage); // 向servlet发送异步请求
	});
}