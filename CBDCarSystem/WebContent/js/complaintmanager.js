$(function(){
	currentPage = 1;
	getComplaintInfo(currentPage);
	getCount();
	 $("#begin").on("click",function(){
		  var nowPage = $("#nowPage").text();
		  if(!(currentPage == 1)){	
			  currentPage = 1;
			  $("#nowPage").text( currentPage);
			  getComplaintInfo(currentPage);
		  }
	  });
	  $("#end").on("click",function(){
		  var totalPage = $("#totpage").text();
		  var nowPage = $("#nowPage").text();
		  if(!(currentPage==totalPage)){
			  currentPage = totalPage;
			  $("#nowPage").text( currentPage);
			  getComplaintInfo(currentPage);
		  }
	  });
	  $("#prev").on("click",function(){
		  var nowPage = $("#nowPage").text();
		  var page = new Number(nowPage);
		  if(nowPage>1){
			  currentPage = page-1;
			  $("#nowPage").text( currentPage);
			  getComplaintInfo(currentPage);
		  }
	  });
	  $("#next").on("click",function(){
		  var nowPage = $("#nowPage").text();
		  var totalPage = $("#totpage").text();
		  var page = new Number(nowPage);
		  if(nowPage<totalPage){
			  currentPage = page+1;
			  $("#nowPage").text( currentPage);
			  getComplaintInfo(currentPage);
		  }
	  });
});

function getComplaintInfo(currentPage){
	 var pathName = window.document.location.pathname;
		var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
	$.ajax({
		url:projectName+"/getComplaintInfo.do",
		type:"get",
		 data:{currentPage,currentPage},
		 success:function(result){
			 if(result==""){
				 location.href = projectName+"/jsp/manager/complain/noComplaintInfo.jsp";
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
	for(var i = 0;i<result.length;i++){
		flag+="<tr><td>"+result[i].tUser.userAccount+"</td><td>"+result[i].bUser.userAccount+"</td><td>"+result[i].complaintDate+"</td><td><a href ='"+projectName+"/showComplaint.do?complaintId="+result[i].complaintId+"'>受理</a></td></tr>";
	}
    $("#biaoge").html(flag);
}

function getCount(){
	var pathName = window.document.location.pathname;
	var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
	$.ajax({
		url:projectName+"/getComplaintCount.do",
		type:"get",
		 success:function(result){
			 $("#totpage").text(result);
		 }
		
	});
}