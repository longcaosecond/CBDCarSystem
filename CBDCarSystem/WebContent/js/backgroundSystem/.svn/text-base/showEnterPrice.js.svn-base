/**
 * 企业管理页面加载完成就执行方法
 * 生成分页表格
 */
function enterpriseAccounts(){
	var enterpriseAccount=$("#enterpriseAccount").val()
	if(RegExpAcount.test(enterpriseAccount)){
		$.ajax({
			url:"checkenterpriseAccount.do",
			type:"post",
			data:{"enterpriseAccount":enterpriseAccount},
			success:function(result){
					if(result=="0"){
						$("#enterpriseAccountSpan").text("新账号格式正确")
						$("#enterpriseAccountSpan").css("color","green")
					}else{
						$("#enterpriseAccountSpan").text("账号已存在，请重新输入")
						$("#enterpriseAccountSpan").css("color","red")
					}
				}
		})
		if($("#enterpriseAccountSpan").text()=="新账号格式正确"){
			return true;
		}else{
			return false;
		}
	}else{
		$("#enterpriseAccountSpan").text("格式错误，请重新输入")
		$("#enterpriseAccountSpan").css("color","red")
		return false;
	}
	}
function enterprisePwds(){
	var enterprisePwd=$("#enterprisePwd").val()
	if(RegExpPwd.test(enterprisePwd)){
		$("#enterprisePwdSpan").text("密码格式正确")
		$("#enterprisePwdSpan").css("color","green")
		return true;
	}else{
		$("#enterprisePwdSpan").text("格式错误，请重新输入")
		$("#enterprisePwdSpan").css("color","red")
		return false;
	}
}
function reenterprisePwds(){
	var enterprisePwd=$("#enterprisePwd").val()
	var reenterprisePwd=$("#reenterprisePwd").val()
	if(reenterprisePwd!=""){
		if(enterprisePwd==reenterprisePwd){
			$("#reenterprisePwdSpan").text("密码验证通过")
			$("#reenterprisePwdSpan").css("color","green")
			return true;
		}else{
			$("#reenterprisePwdSpan").text("两次密码不同，请重新输入")
			$("#reenterprisePwdSpan").css("color","red")
			return false;
		}
	}else{
		$("#reenterprisePwdSpan").text("密码不能为空，请重新输入")
		$("#reenterprisePwdSpan").css("color","red")
		return false;
	}
}
function enterpriseNames(){
	var enterpriseName=$("#enterpriseName").val()
	if(enterpriseName!=""){
		$("#enterpriseNameSpan").text("名称通过")
		$("#enterpriseNameSpan").css("color","green")
		return true;
	}else{
		$("#enterpriseNameSpan").text("还没有输入企业名称，请输入")
		$("#enterpriseNameSpan").css("color","red")
		return false;
	}
}
function enterpriseAddresss(){
	var enterpriseAddress=$("#enterpriseAddress").val()
	if(enterpriseAddress!=""){
		$("#enterpriseAddressSpan").text("楼层信息正确")
		$("#enterpriseAddressSpan").css("color","green")
		return true;
	}else{
		$("#enterpriseAddressSpan").text("还没有输入楼层信息，请输入")
		$("#enterpriseAddressSpan").css("color","red")
		return false;
	}
}
function enterpriseContacts(){
	var enterpriseContact=$("#enterpriseContact").val()
	if(RegExpPwdContact.test(enterpriseContact)){
		$("#enterpriseContactSpan").text("姓名格式正确")
		$("#enterpriseContactSpan").css("color","green")
		return true;
	}else{
		$("#enterpriseContactSpan").text("格式错误，请重新输入")
		$("#enterpriseContactSpan").css("color","red")
		return false;
	}
}
function enterprisePhones(){
	var enterprisePhone=$("#enterprisePhone").val()
	if(RegExpPhone.test(enterprisePhone)){
		$("#enterprisePhoneSpan").text("电话格式正确")
		$("#enterprisePhoneSpan").css("color","green")
		return true;
	}else{
		$("#enterprisePhoneSpan").text("格式错误，请重新输入")
		$("#enterprisePhoneSpan").css("color","red")
		return false;
	}
}
function main(){
	RegExpAcount=new RegExp(/^[a-zA-Z][\w]{5,12}$/);
	RegExpPwd=new RegExp(/^[0-9a-zA-Z]{8,15}$/);
	RegExpPwdContact=new RegExp(/^[\u4e00-\u9fa5]{2,6}$/)
	RegExpPhone=new RegExp(/^[1][3|4|5|8][0-9]{9}$/)
	currentPage=1;
	enterPriceName="";
	enterPriceFloar="";
	enterPriceContact="";
	enterPricePhone="";
	showEnterPrice(currentPage);

}
function showEnterPrice(currentPage){
	enterPriceTbody=$("#enterPriceTbody")
	$.ajax({
		url:"findAllEnterPrice.do",
		type:"post",
		data:{"currentPage":currentPage,"enterPriceName":enterPriceName,"enterPriceFloar":enterPriceFloar,"enterPriceContact":enterPriceContact,"enterPricePhone":enterPricePhone},
		success:function(result){
			results=result.enterprises;
		 	var msg="";			 	
			for(var i=0;i<results.length;i++){
				msg+="<tr style='text-align:center;height:40px'><input type='hidden' value='"+results[i].enterpriseId+"'><td>"+results[i].enterpriseName+"</td><td>"+results[i].enterpriseAddress+"</td><td>"+results[i].enterpriseContact+"</td><td>"+results[i].enterprisePhone+"</td><td><input type='button' class='delManager btn btn-danger btn-xs' value='删除'/></td></tr>" 
			}
			enterPriceTbody.html(msg);
			initPage(currentPage,result.totalPage);
			$(".delManager").on('click',function(){
				if(confirm("是否确认删除该企业？")){
					var id=$(this).parent().parent().children().first().val();
					$.ajax({
						url:"delOneEnterPricePage.do",
						type:"post",
						data:{"id":id},
						success:function(result){
								if(result==0){
									showEnterPrice(currentPage);
								}else{
									alert("当前企业还有合约存在，请解约后再删除")
								}
							}
					})
				}
			})
			}
	})
	
	$("#enterPriceSelect").bind('click',function(){
		enterPriceName=$("#enterPriceName").val();
		enterPriceFloar=$("#enterPriceFloar").val();
		enterPriceContact=$("#enterPriceContact").val();
		enterPricePhone=$("#enterPricePhone").val();
		showEnterPrice(1);
	})
	function initPage(currentPage,totalPage){
		$("#begin").unbind("click");
		$("#prev").unbind("click");
		$("#end").unbind("click");
		$("#next").unbind("click");
		if (totalPage==0) {
			alert("查询条件错误，请重新输入！");
			$("#page").text(totalPage+" / "+totalPage);
		}else {
			$("#page").text(currentPage+" / "+totalPage);
		}
		if (currentPage > 1) {
			$("#begin").click(function(){
				showEnterPrice(1)
			});
			$("#prev").click(function(){
				showEnterPrice(currentPage-1);
			});
		}
		if (currentPage < totalPage) {
			$("#end").click(function(){
				showEnterPrice(totalPage)
			});
			$("#next").click(function(){
				showEnterPrice(currentPage+1)
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
}
function addEnterPrice(){
	if(enterpriseAccounts()&&enterprisePwds()&&reenterprisePwds()&&enterpriseNames()&&enterpriseAddresss()&&enterpriseContacts()&&enterprisePhones()){
		$("#formEnterPrice").submit();
	}else{
		alert("页面还有错误信息，请修改后再提交")
	}
	
}
