$(function(){
	currentPage = 1;
	getWantInfo(currentPage);
	getCount();
	  $("#begin").on("click",function(){
		  var nowPage = $("#nowPage").text();
		  if(!(currentPage == 1)){	
			  currentPage = 1;
			  $("#nowPage").text( currentPage);
			  getWantInfo(currentPage);
		  }
	  });
	  $("#end").on("click",function(){
		  var totalPage = $("#totpage").text();
		  var nowPage = $("#nowPage").text();
		  if(!(currentPage==totalPage)){
			  currentPage = totalPage;
			  $("#nowPage").text( currentPage);
			  getWantInfo(currentPage);
		  }
	  });
	  $("#prev").on("click",function(){
		  var nowPage = $("#nowPage").text();
		  var page = new Number(nowPage);
		  if(nowPage>1){
			  currentPage = page-1;
			  $("#nowPage").text( currentPage);
			  getWantInfo(currentPage);
		  }
	  });
	  $("#next").on("click",function(){
		  var nowPage = $("#nowPage").text();
		  var totalPage = $("#totpage").text();
		  var page = new Number(nowPage);
		  if(nowPage<totalPage){
			  currentPage = page+1;
			  $("#nowPage").text( currentPage);
			  getWantInfo(currentPage);
		  }
	  });
});
function getWantInfo(currentPage){
	 var pathName = window.document.location.pathname;
		var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
	$.ajax({
		url:projectName+"/getWantInfoByZ.do?",
		type :"get",
		data:{currentPage,currentPage},
		success:function(result){
			if(result==""){
				location.href =projectName+"/jsp/user/noInformationRight.jsp";
			}else{
			createTable(result);
			}
		}
	});
}
function createTable(result){
	 var pathName = window.document.location.pathname;
		var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
	var flag = "";
	for(var i=0;i<result.length;i++){
		flag+="<tr><td class = 'lie'>"+result[i].rent.rentAddress+"</td><td class = 'lie'>该车位车主以同意出租</td><td class = 'lie'><a href='"+projectName+"/showWantInfo.do?wantId="+result[i].wantId+"'>查看详情》》</a></td></tr>";
	}
	$("#userInfo").html(flag);
	
}
function getCount(){
	var pathName = window.document.location.pathname;
	var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
$.ajax({
	url:projectName+"/getWantCountByZ.do?",
	type :"get",
	data:{currentPage,currentPage},
	success:function(result){
		$("#totpage").text(result);
	}
});
}