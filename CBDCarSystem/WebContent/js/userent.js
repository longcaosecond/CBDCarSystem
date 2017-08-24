/**
 * 用户注册方法的js
 */
$(function() {
	
});

function checkAll(){
	var target = ["xixi-01","xixi-02","xixi-03","xixi-04","xixi-05"];
	var rentnum= rentnumCheck();
	var rentPri = rentPriCheck();
	var rentPic = rentPictureCheck();
	var res = rentCnum && addres &&rentnum && rentPri && rentPic;
	var starData = $("#rentStartDate").val();
	var endData = $("#rentEndDate").val();
	$("#rentMessagetxt").html("<span>fdgdfs</span>");
	return res;
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
	var cardReg = /^[+][.jpg|.png]$/;
	var cardtxt = $("#rentPicturetxt").files[0];
	alert(cardtxt);
	if (cardReg.test(cardtxt)) {
		$("#pictureHint").html("<span style='color:green'></span>");
		return true;
	} else {
		$("#pictureHint").html("<span style='color:red'>请至少上传一张图片(jpg或png)</span>");
		return false;
	}
}