/**
 * 查看包租婆提交审核的车位信息
 */
function main(){
	currentPage=1;
	showLandLordApply(currentPage);
}
function toDate(r){
	var d=new Date(r);
	return d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate();
}
function showLandLordApply(currentPage){
	landlordTbody=$("#landlordTbody")
	$.ajax({
		url:"findAllLandLordApply.do",
		type:"post",
		data:{"currentPage":currentPage},
		success:function(result){
			users=result.users;
			rents=result.rents;
			var msg="";			 	
			for(var i=0;i<users.length;i++){
				msg+="<tr style='text-align:center;height:40px'><input type='hidden' value='"+rents[i].rentId+"'><input type='hidden' value='"+users[i].userId+"'><td>"+users[i].userAccount+"</td><td><input type='button' class='showApplyRent' data-toggle='modal' data-target='#reviseLandLord' value='查看申请车位'/></td><td><input type='button' class='showLandLord' data-toggle='modal' data-target='#reviseUser' value='查看包租婆信息'/></td><td>"+toDate(rents[i].rentStartDate)+"</td><td><input type='button' class='passApplyBtn btn btn-success btn-xs' value='通过'/>&nbsp;<input type='button' class='refuseApplyBtn btn btn-danger btn-xs' value='拒绝'/></td></tr>" 
			}
			landlordTbody.html(msg);
			initPage(currentPage,result.totalPage);
			$(".showApplyRent").on('click',function(){
				var rentId=$(this).parent().parent().children().first().val()
				for(var i=0;i<users.length;i++){
					if(rentId==rents[i].rentId){
						$("#rentAddresslc").text(rents[i].rentAddress)
						$("#rentNumberlc").text(rents[i].rentNumber)
						$("#rentCnumberlc").text(rents[i].rentCnumber)
						$("#rentImglc").attr("src","uploadimg/"+rents[i].rentPicture)
						break;
					}
				}
			})
			$(".showLandLord").on('click',function(){
				var userId=$(this).parent().parent().children().first().next().val()
				for(var i=0;i<users.length;i++){
					if(userId==users[i].userId){
						$("#landlordCountlc").text(users[i].userAccount)
						$("#landlordNamelc").text(users[i].userName)
						$("#landlordIDnumberlc").text(users[i].userCardId)
						$("#landlordCreditlc").text(users[i].userCredit)
						$("#landlordPhonelc").text(users[i].userPhone)
						$("#landlordAddresslc").text(users[i].userAddress)
						$("#landlordDescripelc").text(users[i].userWork)
						$("#landlordApplyTimelc").text(toDate(users[i].userDate))
						break;
					}
				}
			})
			$(".passApplyBtn").on('click',function(){
				var rentId=$(this).parent().parent().children().first().val()
					$.ajax({
						url:"passApply.do",
						type:"post",
						data:{"rentId":rentId},
						success:function(result){
							if(result==1){
								showLandLordApply(currentPage);
								}
							}
						})
				})
			$(".refuseApplyBtn").on('click',function(){
				var rentId=$(this).parent().parent().children().first().val()
					$.ajax({
						url:"refuseApply.do",
						type:"post",
						data:{"rentId":rentId},
						success:function(result){
							if(result==1){
								showLandLordApply(currentPage);
								}
							}
						})
				})	
		}
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
				showLandLordApply(1)
			});
			$("#prev").click(function(){
				showLandLordApply(currentPage-1);
			});
		}
		if (currentPage < totalPage) {
			$("#end").click(function(){
				showLandLordApply(totalPage)
			});
			$("#next").click(function(){
				showLandLordApply(currentPage+1)
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