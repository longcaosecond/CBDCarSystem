
selectOutContract();
//根据选择的公司Id查询合同
function selectOutContract(){
	$.ajax({
		url:"selectOutContract.do",//
		type:"post",
		success:function(result){
			//创建表格，显示数据
			$(".hetong").html("");
			var msg="";
			for(var i=0;i<result.length;i++){
			msg+="<option value='"+result[i].outContractId+"'>"+result[i].outContractNewNo+"</option>";
			}
			$(".hetong").html(msg);
		},
			error:function(e){
				alert("error");
			}
	});
}

//单添加提交
function addPark(){
	$.ajax({
		url:"addPark.do",//
		type:"post",
		data:{
			outContractId:$("#companyIdhetong").val(),
			parkNumber:$("#parkNumber").val(),
			parkAddress:$("#parkAddress").val()
		},
		success:function(result){
			//创建表格，显示数据
			if(result=="ok")
			alert("添加成功");
			else 
				alert(result+"已存在");
		},
			error:function(e){
				alert("error");
			}
	});
}
//修改车位
function parkUpdate(){
	var parkType=1;
	if($("#zhuangtai").prop("checked"))
		parkType=0;
	$.ajax({
		url:"updatePark.do",//
		type:"post",
		data:{
			parkId:$("#parkIdUpdate").val(),
			outContractId:$("#hetongUpdate").val(),
			parkNumber:$("#parkNumberUpdate").val(),
			parkAddress:$("#parkAddressUpdate").val(),
			parkType:parkType
		},
		success:function(result){
			//创建表格，显示数据
			if(result=="ok")
			{findPark();
				alert("修改成功");
			}
			else 
				alert(result+"已存在");
		},
			error:function(e){
				alert("error");
			}
	});
}
//单添加确认提交
$("#danbaocun").click(function(){
	if(tijiaoyanzheng("yz"))
	addPark();
});

//多添加提交
function addParks(){
	$.ajax({
		url:"addParks.do",//
		type:"post",
		data:{
			outContractIds:$("#companyIdshetong").val(),
			parkNumbers:$("#parkNumbers").val(),
			parkAddresss:$("#parkAddresss").val(),
			startnum:$("#startnum").val(),
			endnum:$("#endnum").val()
		},
		success:function(result){
			//创建表格，显示数据
			if(result.length>2)
				{var msg="";
				for(var i=0;i<result.length;i++){
					msg+=result[i];
				}
			alert("以下车位号重复:"+msg);}
			else{
				findPark();
				alert("添加成功");
			}
		},
			error:function(e){
				alert("error");
			}
	});
}
//多添加确认提交
$("#duobaocun").click(function(){
	if(tijiaoyanzheng("yzs"))
	addParks();
});
//单表多表一起提交
$("#quanbubaocun").click(function(){
	if(tijiaoyanzheng("yz")&&tijiaoyanzheng("yzs"))
	{addPark();
	addParks();}
});
//修改提交
$("#parkUpdate").click(function(){
	$(".ts").html("");
	if(tijiaoyanzheng("yzUpdate")&&tijiaoyanzheng("yzUpdate"))
	{parkUpdate();
	findPark();
	}
});
//查询点击事件
$("#chaxun").click(function(){
	currentPage=1;
	findPark();
});

//查询所有车位
var currentPage=1;
findPark();
function findPark(){
	$.ajax({
		url:"findPark.do",//
		type:"post",
		data:{
			msg:$("#shuru").val(),
			currentPage:currentPage
		},
		success:function(result){
			//创建表格，显示数据
			createTable(result[0]);
			//创建页码的显示
			currentPage=result[1].currentPage;
			initPage(result[1].totalPage);
		},
	});
}
//创建车位表
function createTable(result){
	$("#t_body").html("");
	var msg="";
	/*********/
	for(var i=0;i<result.length;i++){
		var j=result[i].parkType;
		var zhuangtai="未知";
		if(j==0)
			zhuangtai="未租";
		else if(j==1)
			zhuangtai="已租";
		var outContract=result[i].outContract;
		var outContractId=0;
		if(outContract!=null)
			{outContract=result[i].outContract.outContractNewNo;
			outContractId=result[i].outContract.outContractId;}
		else outContract="无";
		var parkContract=result[i].parkContract;
		if(parkContract!=null)
			parkContract=result[i].parkContract.contractName;
		else
			parkContract="无";
	var tab="<tr style='text-align: center;'>"+
	 	"<td>"+result[i].parkAddress+"</td>"+
		"<td>"+result[i].parkNumber+"</td>"+
		"<td outContractId='"+outContractId+"'>"+outContract+"</td>"+
		"<td>"+parkContract+"</td>"+
		"<td>"+zhuangtai+"</td>"+
		"<td><input type='button' parkId='"+result[i].parkId+"' class='parkId btn btn-yellow btn-xs' data-toggle='modal' data-target='#xiugai' value='修改'/></input>"+
		"</tr>";
		msg+=tab;
	}
	$("#t_body").html(msg);
	$(".parkId").bind("click",function(){
		$(".ts").text("");
	var tds=$(this).parent().parent().children("td");
	$("#parkIdUpdate").val($(this).attr("parkId"));
	$("#hetongUpdate").val(tds.eq(2).attr("outContractId"));
	$("#parkNumberUpdate").val(tds.eq(1).text());
	$("#parkAddressUpdate").val(tds.eq(0).text());
	var zt=tds.eq(4).text()=="已租"?1:0;
	if(zt==1)
		{
		
		$("#jiechu").css("display","block");
		}
	else
		{
		$("#jiechu").css("display","none");
		}
});
	/**************/
}
//创建页码
function initPage(totalPage){
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
			currentPage=1;
			findPark();
		});
		
		$("#prev").click(function(){
			currentPage -= 1;
			findPark();
		});
	}
	
	if (currentPage < totalPage) {
		$("#next").click(function(){
			currentPage += 1;
			findPark();
		});
		
		$("#end").click(function(){
			currentPage=totalPage;
			findPark();
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
yanzheng("yz");//单添加验证
yanzheng("yzs");//批量添加验证
yanzheng("yzUpdate");//修改时验证
//验证提示显示(yz是类名)
function yanzheng(yz){
	$("."+yz).blur(function(){
		var reg=new RegExp($(this).attr("reg"));
		var b=reg.test($(this).val());
		var yzname=$(this).attr("name");
		if(!b)
		{$("#"+yzname+"ts").html("格式不正确");
		$("#"+yzname+"ts").css("color","red");
		}
		else
			{$("#"+yzname+"ts").html("验证通过");
			$("#"+yzname+"ts").css("color","green");
			}});
	$("."+yz).focus(function(){
		var yzname=$(this).attr("name");
		$("#"+yzname+"ts").html("输入中...");
		$("#"+yzname+"ts").css("color","gray");
	});
}
//提交时验证(yz是类名)
function tijiaoyanzheng(yz){
	var b=true;
	$("."+yz).each(function(){
		var reg=new RegExp($(this).attr("reg"));
		var bool=reg.test($(this).val());
		var yzname=$(this).attr("name");
		if(!bool)
		{$("#"+yzname+"ts").html("格式不正确");
		$("#"+yzname+"ts").css("color","red");
		}
		else
			{$("#"+yzname+"ts").html("验证通过");
			$("#"+yzname+"ts").css("color","green");
			}
		b=b&&bool;
	});
	return b;
}
//清空输入面板
$(".quxiao").click(function(){
	$(".yz").val("");
	$(".yzs").val("");
	$("#zhuangtai").prop("checked",false);
	$(".ts").html("");
});
