
	startPage=1;

	$(function(){
		sendAjax(startPage);
	});

	//发送ajax();
	function sendAjax(startPage){
		$.ajax({
			url:"findAllManager.do",
			data:{currentPage:startPage},
			type:"get",
			dataType:"json",
			success:function(result){
				creatTable(result.manager);
				initPage(result.currentPage,result.totalPage);
			}
		});
	}

	//动态生成表格
	function creatTable(manager){
		$("#first").nextAll().remove(); 
		var msg = "";
		for (var i = 0; i < manager.length; i++) {
			msg+="<tr align='center'><td>"+manager[i].managerId+"</td><td>"+manager[i].managerName+"</td>"+
				"<td>"+manager[i].managerPhone+"</td><td>"+manager[i].powers[0].powerName+"</td>"+
				"<td><button type='button' class='btn btn-primary btn-xs' data-toggle='modal'"+
				"data-target='#reviseUser01'>修改</button> <button class='btn btn-danger btn-xs'"+
				"data-toggle='modal' data-target='#deleteSchool'>删除</button></td></tr>"
		}
		$(".table").append(msg);
	}

	//页码块
	function initPage(currentPage,totalPage){
		$("#begin").unbind("click");
		$("#prev").unbind("click");
		$("#end").unbind("click");
		$("#next").unbind("click");
		
		if (totalPage==0) {
			alert("当前没有用户存在");
			$("#page").text(totalPage+" / "+totalPage);
		}else {
			$("#page").text(currentPage+" / "+totalPage);
		}
		
		if (currentPage > 1) {
			$("#begin").click(function(){
				sendAjax(startPage);
			});
			
			$("#prev").click(function(){
				sendAjax(currentPage-1);
			});
		}
		
		if (currentPage < totalPage) {
			$("#end").click(function(){
				sendAjax(totalPage);
			});
			
			$("#next").click(function(){
				sendAjax(currentPage+1);
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
	
	
	
	
	
	
	
	
	
	
	
	