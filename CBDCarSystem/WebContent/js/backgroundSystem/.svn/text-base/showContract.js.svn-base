/**
 * 
 */
 	contractName="";
 	getContractName=contractName;
	 currentPage=1;
	 type=1;
	 flag = true;//用于做标记

$(function()
{	 
	sendAjax(currentPage,contractName,type);
	showAllEnterprise();

});

//模糊查询
$("#searchBtn").on('click',function(){
	 getContractName=$("#getContractName").val();
	sendAjax(currentPage,getContractName,type);
})

/**
 * 获取所有企业名字，下拉列表用
 */
function showAllEnterprise(){	
	$.ajax({
		url:"showAllEnterpriseName.do",
		type:"post",
		datatype:"json",
		
		success:function(result)
		{	
			var option="";
			for(var i=0;i<result.length;i++)
				{
					option+="<option>"+result[i].enterpriseName+"</option>";
				}
			$("#enterpriseName").html(option);
		}
	});	
}
//把date类型转换成String类型
function DateToString(date)
{
	var d=new Date(date);
	return d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate();
}

/**
 * 页面加载完成，就发送ajax刷新显示表格
 */
function sendAjax(currentPage,contractName,type)
{	
	$.ajax({
		url:"showAllRenters.do",
		type:"post",
		datatype:"json",
		data:{currentPage:currentPage,contractName:contractName,type:type},
		
		success:function(result)
		{				
			var contracts=result.contracts;
			var msg="";
			for(var i=0;i<contracts.length;i++)
				{
					msg +="<tr class='mytr'><input type='hidden' value='"+contracts[i].contractId+"'><td>"+contracts[i].contractName+"</td>"+
					"<td>"+contracts[i].enterprise.enterpriseName+"</td>"+
					"<td>"+DateToString(contracts[i].contractStartDate)+"</td>"+
					"<td>"+DateToString(contracts[i].contractEndDate)+"</td>"+
					"<td>"+contracts[i].enterprise.enterprisePhone+"</td>"+
					"<td>"+contracts[i].enterprise.enterpriseContact+"</td>"+
					"<td><input type='button' value='续约'  class='renewBtn btn btn-success btn-xs' data-toggle='modal' data-target='#reviseSchool'>&nbsp;"+
					"<input type='button' value='解约' class='jieYueBtn btn btn-danger btn-xs' data-toggle='modal' data-target='#deleteSchool'></td></tr>";					
				}
			$("#rentersTbody").html(msg);							
			initPage(result.currentPage,result.totalPage);
			
			//续约			
			$(".renewBtn").on('click',function(){								
				var getContractId=$(this).parent().parent().children().first().next().text();
				$("#oldcontractId").val(getContractId);
			});
			//解约
			$(".jieYueBtn").on('click',function(){
				var getContractId=$(this).parent().parent().children().first().val();
				if(confirm("确定要跟该租户解约吗？解约后不可恢复"))
					{
						location.href="breakContract.do?contractId="+getContractId;
					}
			});
		}
	});
	

	//分页
	function initPage(currentPage,totalPage){
		$("#begin").unbind("click");
		$("#prev").unbind("click");
		$("#end").unbind("click");
		$("#next").unbind("click");
		
		if (totalPage==0) {
			alert("没有满足要求的合约记录！");
			$("#page").text(totalPage+" / "+totalPage);
		}else {
			$("#page").text(currentPage+" / "+totalPage);
		}
		
		if (currentPage > 1) {
			$("#begin").click(function(){				
				
				if (flag) {
					sendAjax(1,contractName,type);
					
				}else {
					sendAjax(1,getContractName,type);
				}
			});
			
			$("#prev").click(function(){
				currentPage -= 1;
				if (flag) {
					
					sendAjax(currentPage,contractName,type);
				}else {
					sendAjax(currentPage,getContractName,type);
				}
			});
		}
		
		if (currentPage < totalPage) {
			$("#next").click(function(){				
				currentPage += 1;
				if (flag) {
					sendAjax(currentPage,contractName,type);
				}else {
					sendAjax(currentPage,getContractName,type);
				}
			});
			
			$("#end").click(function(){
				if (flag) {
					sendAjax(totalPage,contractName,type);
				}else {
					sendAjax(totalPage,getContractName,type);
				}
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

	
/*	
*/	
}

