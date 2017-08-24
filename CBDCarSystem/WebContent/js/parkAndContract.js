


$(function(){
	
	selectContract();
	
	//操作全选框
	$("#chooseAll").click(function(){
		var flag = $(this).prop("checked");
		$(".choose").prop("checked",flag);
	});
	
	$("#commit").click(function(){
		var nums = [];
		$(".choose").each(function(){
			var boo = $(this).is(":checked");
			if (boo) {
				nums.push($(this).val());
			}
		});
		
		var select = $("#select").val();
		if (select != 0) {
			//将所选合约ID添加到数组第一位，并返回数组长度
			var length = nums.unshift(select);
			if (length != 1) {
				$.ajax({
					url:"commit.do",
					type:"post",
					async:false,
					data:$.toJSON(nums),
		            contentType:"application/json",
		            success: function(data){
		            	if (data==0) {
		            		findPark(1);
		            		alert("提交成功！");
						}
		            }
				});
				$("#select").val(0);
				$("#chooseAll").prop("checked",false);
			}else {
				alert("请选择车位！");
			}
		}else {
			alert("请选择合约!");
		}
		
	});
	
});


//查询所有的出租合约
function selectContract(){
	$.ajax({
		url:"selectContract.do",//
		success:function(result){
			//创建下拉框
			var msg="";
			for(var i=0;i<result.length;i++){
			msg+="<option value='"+result[i].contractId+"'>"+result[i].contractName+"</option>";
			}
			$("#select").append(msg);
		},
		error:function(e){
			alert("error");
		}
	});
}

//查询点击事件
$("#chaxun").click(function(){
	findPark(1);
	$("#shuru").val("");
});

//查询所有车位
var currentPage=1;
findPark(currentPage);
function findPark(currentPage){
	$.ajax({
		url:"getPark.do",//
		type:"get",
		data:{
			msg:$("#shuru").val(),
			currentPage:currentPage
		},
		success:function(result){
			//创建表格，显示数据
			createTable(result.park);
			//创建页码的显示
			initPage(result.currentPage,result.totalPage);
		},
	});
}

//创建车位表
function createTable(park){
	$("#t_body").html("");
	var msg="";
	/*********/
	for(var i=0;i<park.length;i++){
		var j=park[i].parkType;
		var zhuangtai="未知";
		if(j==0)
			zhuangtai="未租";
		var outContract=park[i].outContract;
		if(outContract!=null)
			outContract=park[i].outContract.outContractNewNo;
		else outContract="无";
	var tab="<tr style='text-align: center;'>"+
			"<td><input type='checkbox' class='choose' value='"+park[i].parkId+"'/>"+
		 	"<td>"+park[i].parkAddress+"</td>"+
			"<td>"+park[i].parkNumber+"</td>"+
			"<td>"+outContract+"</td>"+
			"<td>"+zhuangtai+"</td>"+
			"</tr>";
			msg+=tab;
	}
		$("#t_body").html(msg);

		$(".choose").click(function(){
			var flag = true;
			$(".choose").each(function(){
				flag = flag&&$(this).prop("checked");
			});
			$("#chooseAll").prop("checked",flag);
		});
	
	/**************/
}

//创建页码
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
			currentPage=1;
			findPark(currentPage);
		});
		
		$("#prev").click(function(){
			currentPage -= 1;
			findPark(currentPage);
		});
	}
	
	if (currentPage < totalPage) {
		$("#next").click(function(){
			currentPage += 1;
			findPark(currentPage);
		});
		
		$("#end").click(function(){
			currentPage=totalPage;
			findPark(currentPage);
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
