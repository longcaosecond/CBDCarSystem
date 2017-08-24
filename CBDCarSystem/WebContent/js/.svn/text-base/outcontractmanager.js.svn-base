	
	startPage=1;//起始页
	currentPage=startPage;
	outContractNewNo="";//合同编号
	contractNo=outContractNewNo;
	type=1;//合约状态
	flag = true;//用于做标记
	
	//页面加载完成时执行
	$(function(){
		sendAjax(currentPage,type,contractNo);
		
		//查看有效合约 
		$("#effective").click(function(){
			flag = true;
			type=1;
			sendAjax(startPage,type,outContractNewNo);
		});
		
		//查看无效合约 
		$("#invalid").click(function(){
			flag = true;
			type=0;
			sendAjax(startPage,type,outContractNewNo);
		});
		
		//模糊查询
		$("#search").click(function(){
			flag = false;
			contractNo = $("#contractNo").val();
			if (contractNo == "") {
				alert("请输入您要查询的内容");
			}else {
				sendAjax(currentPage,type,contractNo);
				$("#contractNo").val("");
			}
		});
		
		$("#newNo").blur(function(){
			checkNewNo();
		})
		$("#newNo2").blur(function(){
			checkNewNo2();
		})
		$("#company").blur(function(){
			checkCompany();
		})
		$("#company2").blur(function(){
			checkCompany2();
		})
		$("#address").blur(function(){
			checkAddress();
		})
		/*$("#startTime").blur(function(){
			checkStartTime();
		})
		$("#startTime2").blur(function(){
			checkStartTime2();
		})
		$("#endTime").blur(function(){
			checkEndTime();
		})
		$("#endTime2").blur(function(){
			checkEndTime2();
		})*/
		$("#phone").blur(function(){
			checkPhone();
		})
		$("#phone2").blur(function(){
			checkPhone2();
		})
		$("#contact").blur(function(){
			checkContact();
		})
		$("#contact2").blur(function(){
			checkContact2();
		})
		$("#carNo").blur(function(){
			checkCarNo();
		})
		$("#copyImg").blur(function(){
			checkCopyImg();
		})
		$("#copyImg2").blur(function(){
			checkCopyImg2();
		})
	});

	//发送ajax();
	function sendAjax(currentPage,type,contractNo){
		$.ajax({
			url:"findAllOutContract.do",
			data:{currentPage:currentPage,type:type,outContractNewNo:contractNo},
			type:"get",
			dataType:"json",
			success:function(result){
				if (type==1) {
					creatTable(result.outContract);
				}else {
					creatTable2(result.outContract);
				}
				initPage(result.currentPage,result.totalPage);
			}
		});
	}

	//用于转换后台传递过来的日期格式
	function toDate(obj){
		var date = new Date(obj);
		return date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();
	}
	
	//动态生成有效合约表格数据
	function creatTable(outContract){
		$("#first").nextAll().remove(); 
		var msg = "";
		for (var i = 0; i < outContract.length; i++) {
			msg += "<tr align='center'><td>"+outContract[i].outContractNewNo+"</td>" +
					"<td>"+outContract[i].outContractCompany+"</td>" +
					"<td>"+toDate(outContract[i].outContractStartTime)+"</td>" +
					"<td>"+toDate(outContract[i].outContractEndTime)+"</td>" +
					"<td>"+outContract[i].outContractPhone+"</td>" +
					"<td>"+outContract[i].outContractContact+"</td>" +
					"<td><button class='btn btn-success btn-xs continue' data-toggle='modal'"+
						"data-target='#reviseSchool'>续约</button> <button class='btn btn-danger btn-xs del'"+
						"data-toggle='modal'>解约</button></td></tr>";
		}
		$(".table").append(msg);
		
		$(".continue").click(function(){
			var outContractOldNo =  $(this).parent().parent().children().eq(0).text();
			$("#oldNo").val(outContractOldNo);
			$("#oldNo2").val(outContractOldNo);
		});
		
		//解约
		$(".del").click(function(){
			var outContractNewNo = $(this).parent().parent().children().eq(0).text();
			var boo = confirm("确定要跟该单位解约吗？解约后不可恢复！");
			if (boo) {
				$.ajax({
					url:"termination.do",
					data:{outContractNewNo:outContractNewNo},
					type:"get",
					async:false,
					success:function(result){
						if(result == "1"){
							alert("解约成功！");
							sendAjax(currentPage,type,contractNo);
						}else {
							alert("该合约包含已租车位，不能被解约！");
						}
					}
				});
			}
		});
	}
	
	//动态生成无效合约表格数据
	function creatTable2(outContract){
		$("#first").nextAll().remove(); 
		var msg = "";
		for (var i = 0; i < outContract.length; i++) {
			msg += "<tr align='center'><td>"+outContract[i].outContractNewNo+"</td>" +
					"<td>"+outContract[i].outContractCompany+"</td>" +
					"<td>"+toDate(outContract[i].outContractStartTime)+"</td>" +
					"<td>"+toDate(outContract[i].outContractEndTime)+"</td>" +
					"<td>"+outContract[i].outContractPhone+"</td>" +
					"<td>"+outContract[i].outContractContact+"</td>" +
					"<td><button class='btn btn-danger btn-xs delete'"+
						"data-toggle='modal'>删 除</button></td></tr>";
		}
		$(".table").append(msg);
		
		//删除无效合约记录
		$(".delete").click(function(){
			var outContractNewNo = $(this).parent().parent().children().eq(0).text();
			var boo = confirm("确定要删除这条合约记录吗？删除后不可恢复！");
			if (boo) {
				$.ajax({
					url:"delete.do",
					data:{outContractNewNo:outContractNewNo},
					type:"get",
					async:false,
					success:function(result){
						if(result == "1"){
							alert("删除成功！");
						}
					}
				});
				sendAjax(currentPage,type,contractNo);
			}
		});
	}

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
					sendAjax(startPage,type,outContractNewNo);
				}else {
					sendAjax(startPage,type,contractNo);
				}
			});
			
			$("#prev").click(function(){
				currentPage -= 1;
				if (flag) {
					sendAjax(currentPage,type,outContractNewNo);
				}else {
					sendAjax(currentPage,type,contractNo);
				}
			});
		}
		
		if (currentPage < totalPage) {
			$("#next").click(function(){
				currentPage += 1;
				if (flag) {
					sendAjax(currentPage,type,outContractNewNo);
				}else {
					sendAjax(currentPage,type,contractNo);
				}
			});
			
			$("#end").click(function(){
				if (flag) {
					sendAjax(totalPage,type,outContractNewNo);
				}else {
					sendAjax(totalPage,type,contractNo);
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
	
	//检查添加新合同编号
	function checkNewNo(){
		var newNo = $("#newNo") .val();
		var newNoReg = /^[A-Za-z0-9\u4e00-\u9fa5]+$/;
		var span = $("#newNoSpan");
		if (newNo == "") {
			span.text("编号不能为空");
			span.removeClass("true");
			span.addClass("false");
			return false;
		}else if (!newNoReg.test(newNo)) {
			span.text("编号可为汉字、英文或数字相组合");
			span.removeClass("true");
			span.addClass("false");
			return false;
		}else {
			var boo = false;
			$.ajax({
				url:"checkNewNo.do?outContractNewNo="+newNo,
				async:false,
				success:function(result){
					if (result != "0") {
						span.text("该编号已经存在！请重新输入！");
						span.removeClass("true");
						span.addClass("false");
						boo = false;
					}else {
						span.text("该编号可以被使用");
						span.removeClass("false");
						span.addClass("true");
						boo = true;
					}
				}
			});
			return boo;
		}
	}
	
	//检查续约新合同编号
	function checkNewNo2(){
		var newNo = $("#newNo2") .val();
		var newNoReg = /^[A-Za-z0-9\u4e00-\u9fa5]+$/;
		var span = $("#newNoSpan2");
		if (newNo == "") {
			span.text("编号不能为空");
			span.removeClass("true");
			span.addClass("false");
			return false;
		}else if (!newNoReg.test(newNo)) {
			span.text("编号可为汉字、英文或数字相组合");
			span.removeClass("true");
			span.addClass("false");
			return false;
		}else {
			var boo = false;
			$.ajax({
				url:"checkNewNo.do?outContractNewNo="+newNo,
				async:false,
				success:function(result){
					if (result != "0") {
						span.text("该编号已经存在！请重新输入！");
						span.removeClass("true");
						span.addClass("false");
						boo = false;
					}else {
						span.text("该编号可以被使用");
						span.removeClass("false");
						span.addClass("true");
						boo = true;
					}
				}
			});
			return boo;
		}
	}
	
	//检查添加单位名称
	function checkCompany(){
		var company = $("#company").val();
		var companyReg = /^[A-Za-z0-9\u4e00-\u9fa5]+$/;
		var span = $("#companySpan");
		if (company == "") {
			span.text("单位名称不能为空");
			span.removeClass("true");
			span.addClass("false");
			return false;
		}else if (!companyReg.test(company)) {
			span.text("单位名称可为汉字、英文或数字相组合");
			$span.removeClass("true");
			span.addClass("false");
			return false;
		}else {
			span.text("单位名称格式正确");
			span.removeClass("false");
			span.addClass("true");
			return true;
		}
	}
	
	//检查续约单位名称
	function checkCompany2(){
		var company = $("#company2").val();
		var companyReg = /^[A-Za-z0-9\u4e00-\u9fa5]+$/;
		var span = $("#companySpan2");
		if (company == "") {
			span.text("单位名称不能为空");
			span.removeClass("true");
			span.addClass("false");
			return false;
		}else if (!companyReg.test(company)) {
			span.text("单位名称可为汉字、英文或数字相组合");
			$span.removeClass("true");
			span.addClass("false");
			return false;
		}else {
			span.text("单位名称格式正确");
			span.removeClass("false");
			span.addClass("true");
			return true;
		}
	}
	
	//检查添加地址名称
	function checkAddress(){
		var address = $("#address").val();
		var addressReg = /^[A-Za-z0-9\u4e00-\u9fa5]+$/;
		var span = $("#addressSpan");
		if (address == "") {
			span.text("单位地址不能为空");
			span.removeClass("true");
			span.addClass("false");
			return false;
		}else if (!addressReg.test(address)) {
			span.text("单位地址可为汉字、英文或数字相组合");
			span.removeClass("true");
			span.addClass("false");
			return false;
		}else {
			span.text("单位地址格式正确");
			span.removeClass("false");
			span.addClass("true");
			return true;
		}
	}
	
	//检查合添加同生效日期
	function checkStartTime(){
		var startTime = $("#startTime").val();
		var startTimeReg = /^(19|20)\d{2}-(1[0-2]|0?[1-9])-(0?[1-9]|[1-2][0-9]|3[0-1])$/;
		var span = $("#startTimeSpan");
		if (startTime == "") {
			span.text("生效日期不能为空");
			span.removeClass("true");
			span.addClass("false");
			return false;
		}else if (!startTimeReg.test(startTime)) {
			span.text("日期格式如：XXXX-XX-XX，期间(1900-2099");
			span.removeClass("true");
			span.addClass("false");
			return false;
		}else {
			$("#startTime3").val(startTime);
			span.text("");
			span.removeClass("false");
			span.addClass("true");
			return true;
		}
	}
	
	//检查合续约同生效日期
	function checkStartTime2(){
		var startTime = $("#startTime2").val();
		var startTimeReg = /^(19|20)\d{2}-(1[0-2]|0?[1-9])-(0?[1-9]|[1-2][0-9]|3[0-1])$/;
		var span = $("#startTimeSpan2");
		if (startTime == "") {
			span.text("生效日期不能为空");
			span.removeClass("true");
			span.addClass("false");
			return false;
		}else if (!startTimeReg.test(startTime)) {
			span.text("日期格式如：XXXX-XX-XX，期间(1900-2099");
			span.removeClass("true");
			span.addClass("false");
			return false;
		}else {
			$("#startTime4").val(startTime);
			span.text("");
			span.removeClass("false");
			span.addClass("true");
			return true;
		}
	}
	
	//检查合添加同截止日期
	function checkEndTime(){
		var endTime = $("#endTime").val();
		var endTimeReg = /^(19|20)\d{2}-(1[0-2]|0?[1-9])-(0?[1-9]|[1-2][0-9]|3[0-1])$/;
		var span = $("#endTimeSpan");
		if (endTime == "") {
			span.text("截止日期不能为空");
			span.removeClass("true");
			span.addClass("false");
			return false;
		}else if (!endTimeReg.test(endTime)) {
			span.text("日期格式如：XXXX-XX-XX，期间(1900-2099");
			span.removeClass("true");
			span.addClass("false");
			return false;
		}else {
			$("#endTime3").val(endTime);
			span.text("");
			span.removeClass("false");
			span.addClass("true");
			return true;
		}
	}
	
	//检查续约合同截止日期
	function checkEndTime2(){
		var endTime = $("#endTime2").val();
		var endTimeReg = /^(19|20)\d{2}-(1[0-2]|0?[1-9])-(0?[1-9]|[1-2][0-9]|3[0-1])$/;
		var span = $("#endTimeSpan2");
		if (endTime == "") {
			span.text("截止日期不能为空");
			span.removeClass("true");
			span.addClass("false");
			return false;
		}else if (!endTimeReg.test(endTime)) {
			span.text("日期格式如：XXXX-XX-XX，期间(1900-2099");
			span.removeClass("true");
			span.addClass("false");
			return false;
		}else {
			$("#endTime4").val(endTime);
			span.text("");
			span.removeClass("false");
			span.addClass("true");
			return true;
		}
	}
	
	//检查添加电话
	function checkPhone(){
		var phone = $("#phone").val();
		var phoneReg = /^(135|159|189)[0-9]{8}$/;
		var span = $("#phoneSpan");
		if (phone == "") {
			span.text("联系号码不能为空");
			span.removeClass("true");
			span.addClass("false");
			return false;
		}else if (!phoneReg.test(phone)) {
			span.text("电话为135、159、189开始的11位手机号码");
			span.removeClass("true");
			span.addClass("false");
		return false;
		}else {
			span.text("电话号码格式正确");
			span.removeClass("false");
			span.addClass("true");
			return true;
		}
	}
	
	//检查续约电话
	function checkPhone2(){
		var phone = $("#phone2").val();
		var phoneReg = /^(135|159|189)[0-9]{8}$/;
		var span = $("#phoneSpan2");
		if (phone == "") {
			span.text("联系号码不能为空");
			span.removeClass("true");
			span.addClass("false");
			return false;
		}else if (!phoneReg.test(phone)) {
			span.text("电话为135、159、189开始的11位手机号码");
			span.removeClass("true");
			span.addClass("false");
		return false;
		}else {
			span.text("电话号码格式正确");
			span.removeClass("false");
			span.addClass("true");
			return true;
		}
	}
	
	//检查添加联系人
	function checkContact(){
		var contact = $("#contact").val();
		var contactReg = /^[A-Za-z\u4e00-\u9fa5]+$/;
		var span = $("#contactSpan");
		if (contact == "") {
			span.text("联系人不能为空");
			span.removeClass("true");
			span.addClass("false");
			return false;
		}else if (!contactReg.test(contact)) {
			span.text("联系人名可为英文或中文");
			span.removeClass("true");
			span.addClass("false");
			return false;
		}else {
			span.text("联系人格式正确");
			span.removeClass("false");
			span.addClass("true");
	  		return true;
		}
	}
	
	//检查续约联系人
	function checkContact2(){
		var contact = $("#contact2").val();
		var contactReg = /^[A-Za-z\u4e00-\u9fa5]+$/;
		var span = $("#contactSpan2");
		if (contact == "") {
			span.text("联系人不能为空");
			span.removeClass("true");
			span.addClass("false");
			return false;
		}else if (!contactReg.test(contact)) {
			span.text("联系人名可为英文或中文");
			span.removeClass("true");
			span.addClass("false");
			return false;
		}else {
			span.text("联系人格式正确");
			span.removeClass("false");
			span.addClass("true");
	  		return true;
		}
	}
	
	//检查添加车位编号
	function checkCarNo(){
		var carNo = $("#carNo").val();
		var carNoReg = /^[A-Za-z0-9\u4e00-\u9fa5]+$/;
		if (carNo == "") {
			$("#carNoSpan").text("车位编号不能为空");
			$("#carNoSpan").removeClass("true");
			$("#carNoSpan").addClass("false");
			return false;
		}else if (!carNoReg.test(carNo)) {
			$("#carNoSpan").text("车位编号可为汉字、英文或数字相组合");
			$("#carNoSpan").removeClass("true");
			$("#carNoSpan").addClass("false");
			return false;
		}else {
			$("#carNoSpan").text("车位编号格式正确");
			$("#carNoSpan").removeClass("false");
			$("#carNoSpan").addClass("true");
			return true;
		}
	}
	
	//检车添加上传合同复印件
	function checkCopyImg(){
		var copyImg = $("#copyImg").val();
		var copyImgReg = /([a-zA-Z0-9_]+)(.jpg|.JPG|.jpeg|.JPEG|.png)/;
		var span = $("#copyImgSpan");
		if (copyImg == "") {
			span.text("合同复印件不能为空");
			span.removeClass("true");
			span.addClass("false");
			return false;
		}else if (!copyImgReg.test(copyImg)) {
			span.text("请上传以.jpg、.jpeg、.png格式的文件");
			span.removeClass("true");
			span.addClass("false");
			return false;
		}else {
			span.text("合同复印件格式正确");
			span.removeClass("false");
			span.addClass("true");
			return true;
		}
	}
	
	//检车续约上传合同复印件
	function checkCopyImg2(){
		var copyImg = $("#copyImg2").val();
		var copyImgReg = /([a-zA-Z0-9_]+)(.jpg|.JPG|.jpeg|.JPEG|.png)/;
		var span = $("#copyImgSpan2");
		if (copyImg == "") {
			span.text("合同复印件不能为空");
			span.removeClass("true");
			span.addClass("false");
			return false;
		}else if (!copyImgReg.test(copyImg)) {
			span.text("请上传以.jpg、.jpeg、.png格式的文件");
			span.removeClass("true");
			span.addClass("false");
			return false;
		}else {
			span.text("合同复印件格式正确");
			span.removeClass("false");
			span.addClass("true");
			return true;
		}
	}
	
	$("#addFrom").submit(function(){
		var boo = checkNewNo() && checkCompany() && checkAddress() && checkStartTime() && checkEndTime() 
					&& checkPhone() && checkContact() && checkCarNo() && checkCopyImg();
		if (boo) {
			alert("添加合约成功！");
		}
		return boo;
	});
	
	$("#continueFrom").submit(function(){
		var boo = checkNewNo2() && checkCompany2() && checkStartTime2() && checkCopyImg2()
					&& checkEndTime2() && checkPhone2() && checkContact2();
		if (boo) {
			alert("续约成功！");
		}
		return boo;
	});
	
	//添加合约图片预览
	function imgPreview(fileDom){
        //判断是否支持FileReader
        if (window.FileReader) {
            var reader = new FileReader();
        } else {
            alert("您的设备不支持图片预览功能，如需该功能请升级您的设备！");
        }

        //获取文件
        var file = fileDom.files[0];
        var imageType = /^image\//;
        //是否是图片
        if (!imageType.test(file.type)) {
            alert("请选择图片！");
            return;
        }
        //读取完成
        reader.onload = function(e) {
            //获取图片dom
            var img = document.getElementById("img");
            //图片路径设置为读取的图片
            img.src = e.target.result;
        };
        reader.readAsDataURL(file);
    }
	
	//续约合约图片预览
	function imgPreview2(fileDom){
        //判断是否支持FileReader
        if (window.FileReader) {
            var reader = new FileReader();
        } else {
            alert("您的设备不支持图片预览功能，如需该功能请升级您的设备！");
        }

        //获取文件
        var file = fileDom.files[0];
        var imageType = /^image\//;
        //是否是图片
        if (!imageType.test(file.type)) {
            alert("请选择图片！");
            return;
        }
        //读取完成
        reader.onload = function(e) {
            //获取图片dom
            var img = document.getElementById("img2");
            //图片路径设置为读取的图片
            img.src = e.target.result;
        };
        reader.readAsDataURL(file);
    }
	