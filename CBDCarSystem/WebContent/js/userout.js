var currentPage = 1;
$(function() {
	var FIRST_PAGE = 1;
	//模糊查询
	$("#findBtn").click(function() {
		sendAjax(FIRST_PAGE);
	});
	sendAjax(FIRST_PAGE)
	$("#findInfo").click(function(){
		location.href = "jsp/user/userInfo.jsp";
	});
	
	//上传车位输入框失去焦点时的验证
	blurCheck()
});

//发送异步请求获取数据
function sendAjax(currentPage) {
	var address = $("#address").val();
	var startDate = $("#startDate").val();
	var endDate = $("#endDate").val();
	var minPrice = $("#minPrice").val();
	var maxPrice = $("#maxPrice").val();
	if(address == null){ address = "" }
	if(startDate == null || startDate == ""){ startDate = "1970-01-01";}
	if(endDate == null || endDate == ""){ endDate = "2099-12-31"; }
	if(minPrice == null || minPrice == ""){ minPrice = 0;}
	if(maxPrice == null || maxPrice == ""){ maxPrice = 99999;}
	$.ajax({
		url : "findMyRents.do",
		data : {
			address : address,
			startDate : startDate,
			endDate : endDate,
			minPrice : minPrice,
			maxPrice : maxPrice,
			currentPage :currentPage
		},
		type : "post",
		success : function(result) {
			if(result[0] != null){
				//创建表格，显示数据
				createTable(result[0]);
				//创建页码的显示
				createPage(result[1].totalPage,result[1].currentPage);
			}	
		}
	});
}

//创建表格
function createTable(result) {
	$("#infotab").html("");
	var msg = "";
	var starTime;
	var endTime;
	var rentType;
	var typeTxt;
	for (var i = 0; i < result.length; i++) {
		starTime = toDate(result[i].rentStartDate);
		endTime = toDate(result[i].rentEndDate);
		rentType = result[i].rentType;
		if(rentType == 0) typeTxt ="审核中";
		if(rentType == 1) typeTxt ="待租赁";
		if(rentType == 2) typeTxt ="已出租";
		if(rentType == 3) typeTxt ="审核未通过";
		var tab = "<tr class='table_list'><td width='112px'><img src='images/"
				+ result[i].rentCarPicture + "' width='107px' height='107px'/></td>"
				+ "<td valign='top' width='275px'><div class='title_car'>"
				+ "<p class='prices'>租金/月 ￥: <span style='color:red;font-size:18px'>"
				+ result[i].rentPrice + "</span> 元</p>"
				+ "<p class='adress'>位置:" + result[i].rentAddress + "</p>"
				+ "<p class='starTime'>起租日期:" + starTime + "</p>"
				+ "<p class='endTime'>截止日期:" + endTime + "</p></td>"
				+ "<td>" + result[i].rentMessage + "</td>"
				+ "<td>" + typeTxt + "</td>"
				+ "<td ><a href='showRentById.do?rentId=" + result[i].rentId 
				+ "' class='btn green_a'>查看详情</a></td></tr>";
		msg += tab;
	}
	$("#infotab").html(msg);
	/** *********** */
}
//转换日期格式
function toDate(r){
	var d=new Date(r);
	return d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate();
}
//预览图片
function PreviewImg(obj) {    
    var newPreview = $("#rentPictureShow");   
    var imgPath = getPath(obj);  
    alert(imgPath);  
    $("#imageShow").attr("src",imgPath);
    if( !obj.value.match( /.jpg|.gif|.png|.bmp/i ) ){  
        alert("图片格式错误！");  
        return false;  
    }  
      
    newPreview.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";      
    newPreview.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgPath;    
} 
//得到图片绝对路径
function getPath(obj){   
    if(obj) {     
        if(navigator.userAgent.indexOf("MSIE")>0) {    
            obj.select();     
            //IE下取得图片的本地路径     
            return document.selection.createRange().text;    
        } else if(isFirefox=navigator.userAgent.indexOf("Firefox")>0) {    
             if (obj.files) {  // Firefox下取得的是图片的数据     
                return files.item(0).getAsDataURL();     
             }     
             return obj.value;     
         } else if(navigator.userAgent.indexOf("Google")>0) {    
             if (obj.files) {  // Google下取得的是图片的数据     
                 return files.item(0).getAsDataURL();     
              }     
              return obj.value;     
          }  
         return obj.value;     
    }     
} 
function tempClick(){ 
	$("#rentPicturetxt").click(); //调用rentPictureTitle的onclick事件 
} 

//创建分页按钮的功能实现
function createPage(totalPage, currentPage) {
	// 跳转首页
	$("#first").unbind("click");
	$("#first").click(function() {
		currentPage = 1;
		$("#first").addClass("disabled");
		sendAjax(currentPage);
	});

	// 跳转尾页
	$("#last").unbind("click");
	$("#last").click(function() {
		currentPage = totalPage;
		$("#last").addClass("disabled");
		sendAjax(currentPage);
	});
	// 设置跳转至上一页
	if (currentPage == 1) {
		$("#prev").addClass();
	} else {
	$("#prev").attr("style", "cursor:default !important;");
	}
	$("#prev").unbind("click");
	$("#prev").click(function() {
		if (currentPage > 1) {
		sendAjax(currentPage - 1); // 向servlet发送异步请求
		}
	});

	// 设置跳转至下一页
	if (currentPage == totalPage) {
		$("#next").addClass("disabled");
	} else {
		$("#next").addClass("disabled");
	}
	$("#next").unbind("click");
	$("#next").click(function() {
		if (currentPage < totalPage) {
			sendAjax(currentPage + 1);
		}
	});

	// 点击跳转至指定页面
	$("#goes").val(currentPage);
	$("#totpage").text(totalPage);
	$("#gopage").unbind("click");
	$("#gopage").click(function() {
	currentPage = $("#goes").val(); // 通过点击事件获取nowPage的值
	$("#gopage").attr("style", "cursor:default !important;");
		sendAjax(currentPage); // 向servlet发送异步请求
	});
}

//上传新车位输入框的验证
function addRentCheck(){
		var rentCnum = rentCnumCheck();
		var addres = addresCheck();
		var rentnum= rentnumCheck();
		var rentPri = rentPriCheck();
		var rentPic = rentPictureCheck();
		var res = rentCnum && addres &&rentnum && rentPri && rentPic ;
		var starData = $("#rentStartDate").val();
		var endData = $("#rentEndDate").val();
		if(starData == null || starData==""){
			$("#rentStartDate").val("1970-01-01");
		}
		if(endData == null || endData==""){
			$("#rentEndDate").val("2099-12-31");
		}
		//alert(res);
		return res;
}

//输入框失去焦点验证
function blurCheck(){
	$("#rentCnumtxt").blur(function(){
		rentCnumCheck();
	});
	$("#addrestxt").blur(function(){
		addresCheck();
	});
	$("#rentnumtxt").blur(function(){
		rentnumCheck();
	});
	$("#rentPritxt").blur(function(){
		rentPriCheck();
	});
}

//根据产权号码验是否证重复
var checkUsedRes;
function checkUsedByCnum(rentCnum){
	$.ajax({
		url : "checkMyRentByCnum.do",
		data : {
			rentCnum : rentCnum,
		},
		type : "post",
		success : function(result) {
			checkUsedRes = result;
		}
	});
	return checkUsedRes;
}
//产权号码验证
function rentCnumCheck() {
	$("#rentCnumHint").html("");
	var cardReg = /^[0-9a-zA-Z]+$/;
	var rentCnum = $("#rentCnumtxt").val();
	if (cardReg.test(rentCnum)) {
		var checkUsed = checkUsedByCnum(rentCnum);
		if(checkUsed == 1){
			$("#rentCnumHint").html("<span style='color:red'>该车位已被注册</span>");
			return false;
		}
		$("#rentCnumHint").html("<span style='color:green'>产权号码格式正确</span>");
		return true;
	} else {
		$("#rentCnumHint").html("<span style='color:red'>请输入字母数字组成的产权号</span>");
		return false;
	}
}

//车位地址验证
function addresCheck(){
	$("#addressHint").html("");
	var addres = $("#addrestxt").val();
	var addresReg = /^[\u4e00-\u9fa5]+[市][\u4e00-\u9fa5]+[区|县]\S*$/;
	if (addresReg.test(addres)) {
		$("#addressHint").html("<span style='color:green'>地址格式符合</span>");
		return true;
	} else {
		$("#addressHint").html("<span style='color:red'>参照格式:XX市 XX区/县 XXX</span>");
		return false;
	}
}
//车位编号验证
function rentnumCheck() {
	$("#rentNumHint").html("");
	var cardReg = /^[0-9a-zA-Z]+$/;
	var cardtxt = $("#rentnumtxt").val();
	if (cardReg.test(cardtxt)) {
		$("#rentNumHint").html("<span style='color:green'>车位编号格式正确</span>");
		return true;
	} else {
		$("#rentNumHint").html("<span style='color:red'>请输入字母数字组成的车位编号</span>");
		return false;
	}
}
//车位价格验证
function rentPriCheck() {
	$("#priceHint").html("");
	var cardReg = /^[1-9][0-9]{1,4}$/;
	var cardtxt = $("#rentPritxt").val();
	if (cardReg.test(cardtxt)) {
		$("#priceHint").html("<span style='color:green'>车位价格格式正确</span>");
		return true;
	} else {
		$("#priceHint").html("<span style='color:red'>请输入5位以内的车位价格</span>");
		return false;
	}
}
//产权图片验证
function rentPictureCheck() {
	$("#pictureHint").html("");
	var cardReg = /^\S*[.jpg|.png]$/;
	var cardtxt = $("#rentPicturetxt").val();
	if (cardReg.test(cardtxt)) {
		$("#pictureHint").html("<span style='color:green'>图片格式正确</span>");
		return true;
	} else {
		$("#pictureHint").html("<span style='color:red'>请上传jpg/png图片</span>");
		return false;
	}
}