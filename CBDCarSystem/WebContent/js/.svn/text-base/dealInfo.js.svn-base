  $(function(){
	   currentPage = 1;
	  send(currentPage);
	  getCount();
	  $("#begin").on("click",function(){
		  var nowPage = $("#nowPage").text();
		  if(!(currentPage == 1)){	
			  currentPage = 1;
			  $("#nowPage").text( currentPage);
			  send(currentPage);
		  }
	  });
	  $("#end").on("click",function(){
		  var totalPage = $("#totpage").text();
		  var nowPage = $("#nowPage").text();
		  if(!(currentPage==totalPage)){
			  currentPage = totalPage;
			  $("#nowPage").text( currentPage);
			  send(currentPage);
		  }
	  });
	  $("#prev").on("click",function(){
		  var nowPage = $("#nowPage").text();
		  var page = new Number(nowPage);
		  if(nowPage>1){
			  currentPage = page-1;
			  $("#nowPage").text( currentPage);
			  send(currentPage);
		  }
	  });
	  $("#next").on("click",function(){
		  var nowPage = $("#nowPage").text();
		  var totalPage = $("#totpage").text();
		  var page = new Number(nowPage);
		  if(nowPage<totalPage){
			  currentPage = page+1;
			  $("#nowPage").text( currentPage);
			  send(currentPage);
		  }
	  });
  });
  function send(currentPage){
	  var pathName = window.document.location.pathname;
		var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
	  $.ajax({
		  url:projectName+"/getDealInfo.do",
			 type:"get",
			 data:{currentPage,currentPage},
			 success:function(result){
				 if(result==""){
					 location.href = projectName+"/jsp/user/noDealInfo.jsp";
				 }else{
				createTable(result);
				 }
			 }
	  });
  }
  function getCount(){
	  var pathName = window.document.location.pathname;
		var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
	  $.ajax({
		  url:projectName+"/getDealCount.do",
			 type:"get",
			 success:function(result){
				$("#totpage").text(result);
			 }
	  });
  }
  function createTable(result){
	  var flag = "";
	  for(var i=0;i<result.length;i++){
		  flag+="<tr><td>"+result[i].dealId+"</td><td>"+result[i].rent.rentAddress+"</td><td>"+result[i].dealStartDate+"</td><td>"+result[i].dealEndDate+"</td><td>"+result[i].dealPrice+"</td><td><input type = 'button' class='btn btn-info sureBtn' id = 'btn' value = '投诉'></td></tr>";
	  }
	  
	  $("#biaoge").html(flag);
	  $(".sureBtn").on("click",function(){
		  var pathName = window.document.location.pathname;
			var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
		 var dealId = $(this).parent().parent().children().first().text();
		 location.href = projectName+"/dealInfo.do?dealId="+dealId+"";
	  });
  }