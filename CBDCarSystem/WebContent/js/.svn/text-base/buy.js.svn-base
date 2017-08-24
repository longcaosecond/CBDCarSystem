	var FIRST_PAGE=1;
	var currentPage=FIRST_PAGE;
	//模糊查询
	$("#findBtn").click(function(){
		var b=checkPrice();
		if(b)
		sendAjax(FIRST_PAGE);
	});
	sendAjax(FIRST_PAGE);

	//发送异步请求获取数据
	function sendAjax(currentPage){
		var address=$("#address").val();
		var startDate=$("#startDate").val();
		var endDate=$("#endDate").val();
		var minPrice=$("#minPrice").val();
		var maxPrice=$("#maxPrice").val();
		if(startDate==""){startDate="1970-01-01"}
		if(endDate==""){endDate="2200-01-01"}
		if(minPrice==""){minPrice=0}
		if(maxPrice==""){maxPrice=9999999}
		$.ajax({
			url:"showAllRent.do",
			data:{
				currentPage:currentPage,
				rentAddress:address,
				 rentStartDate:startDate,
				rentEndDate:endDate,
				minPrice:minPrice,
				maxPrice:maxPrice
				},
				type:"post",
			success:function(result){
				//创建表格，显示数据
				createTable(result[0]);
				//创建页码的显示
				createPage(result[1].totalPage,result[1].currentPage);
			},
				error:function(e){
					alert("error");
				}
		});
	}
	//***********
	function toDate(r){
		var d=new Date(r);
		return d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate();
	}
	//创建表格
	function createTable(result){
		$("#tables").html("");
		var msg="";
		/*********/
		for(var i=0;i<result.length;i++){
		var tab="<table width='100%' border='0' cellspacing='0' cellpadding='0' class='table_list'>"+
        "<tr>"+
          "<td width='135'><img src='images/"+result[i].rentCarPicture+"' width='105' height='70'></td>"+
          "<td width='100'><div class='title_car'><a  class='name' >"+result[i].rentAddress+"</a>"+
          "<td width='625'><div class='title_car'>"+
            "<a  class='name'style='color:red'>"+toDate(result[i].rentStartDate)+"</a>"+
            "<a  class='name'>至</a>"+
            "<a  class='name' style='color:red' >"+toDate(result[i].rentEndDate)+"</a>"+
             "<p class='price'>价格：<span class='red'>￥"+result[i].rentPrice+"</span></p>"+
            "</div>"+
            "<div class='detail_car'>"+result[i].rentMessage+"</div></td>"+
          "<td align='right'><a rentId='"+result[i].rentId+"' class='green_a pointer'>查看详情>></a></td>"+
        "</tr>"+
      "</table>";
		msg+=tab;
		}
		$("#tables").html(msg);
		/**************/
		$(".pointer").bind("click",function(){
			var rentId=$(this).attr("rentId");
			location.href="showRentByRentId.do?rentId="+rentId;
		});
	}
	//创建页码
	//每页5页
	function createPage(totalPage,currentPage){
		//页码分成5页显示
		var ye=5;
		var start=parseInt((currentPage-1)/ye)*ye+1;
		var temp=parseInt((currentPage-1)/ye)*ye+ye;
		var end=totalPage<temp?totalPage:temp;
		$("#pages").html("");
		if(start==1)
		var msg="";
		else{msg="<li id='prev'><a><<</a></li>";}
		for(var i=start;i<=end;i++){
			if(currentPage==i)
				msg+="<li class='changePage curr-page'><a>"+i+"</a></li>";
			else
				msg+="<li class='changePage'><a>"+i+"</a></li>";
		}
		if(end<totalPage)
			msg+="<li id='next'><a>>></a></li>";
		$("#pages").html(msg);
		$("#prev").click(function(){
			currentPage=start-1;
			sendAjax(currentPage)
		});
		$("#next").click(function(){
			currentPage=end+1;
			sendAjax(currentPage)
		});
		$(".changePage").click(function(){
			if(currentPage!=$(this).text())
				{currentPage=$(this).text();
			sendAjax(currentPage);}
		});
	}
	//价格输入验证提示
	checkPriceTs();
	function checkPriceTs(){
	$(".inp").bind("blur",function(){
		var reg=new RegExp($(this).attr("reg"));
		var namets=$(this).attr("name");
		if(!reg.test($(this).val()))
			{
			$("#"+namets+"ts").text("请输入数字，不超过9位");
			}
		else{
			b=true;
			$("#"+namets+"ts").text("");
		}
	});
	}
	//验证输入价格是否是数字
	function checkPrice(){
		var b=true;
		var r=true;
		$(".inp").each(function(){
			var reg=new RegExp($(this).attr("reg"));
			var namets=$(this).attr("name");
			if(reg.test($(this).val()))
				{
				b=true;
				r=r&&b;
				$("#"+namets+"ts").text("");
			}else{
				b=false;
				r=r&&b;
			}
		});
		return r;
		}
