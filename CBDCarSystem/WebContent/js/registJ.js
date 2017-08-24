/**
 * 用户注册方法的js
 */
$(function() {
	$("#nametxt").blur(function() {
		nameCheck();
	});
	$("#pwdtxt").blur(function() {
		pwdCheck();
	});
	$("#pwdagain").blur(function() {
		pwdcheck2();
	});
	$("#emailtxt").blur(function() {
		mailCheck();
	});
	$("#phonetxt").blur(function() {
		phoneCheck();
	});
	$("#realname").blur(function() {
		realNameChack();
	});
	$("#cardidtxt").blur(function() {
		cardIdCheck();
	});
	$("#addrestxt").blur(function() {
		addresCheck();
	});
	$("#worktxt").blur(function() {
		workCheck();
	});
});

function checkAll(){
	var name = nameCheck();
	var pwd = pwdCheck();
	var pwd2 = pwdcheck2();
	var card = cardIdCheck();
	var addres = addresCheck();
	var phone = phoneCheck();
	var mail = mailCheck();
	var realname = realNameChack();
	var work = workCheck();
	return name && pwd && pwd2 && realname && card && addres && phone && mail && work;
}

// 用户名验证
boo = false;
function nameCheck() {
	$("#nameHint").html("");
	var nameReg = /^[a-zA-Z0-9]{6,18}$/;
	var nametxt = $("#nametxt").val();
	if (nameReg.test(nametxt)) {
		$.ajax({
			url:"findUserAccount.do",
			data:{userAccount:nametxt},
			type:"get",
			async:false,
			success:function(result){
				if (result=="0") {
					$("#nameHint").html("<span style='color:green'>用户名可以使用</span>");
					boo = true;
				}else {
					$("#nameHint").html("<span style='color:red'>用户名已被使用</span>");
				}
			}
		});
	} else {
		$("#nameHint").html("<span style='color:red'>用户名必须6-18位</span>");
	}
	return boo;	
}

// 密码验证
function pwdCheck() {
	$("#pwdHint").html("");
	var pwdReg = /^[0-9]{8,15}$/;
	var pwd = $("#pwdtxt").val();
	if (pwdReg.test(pwd)) {
		$("#pwdHint").html("<span style='color:green'>密码正确,可以使用</span>");
		return true;
	} else {
		$("#pwdHint").html("<span style='color:red'>密码格式必须8-15位数字</span>");
		return false;
	}
}

// 两次密码必须相同
function pwdcheck2() {
	$("#pwd2Hint").html("");
	var pwdtxt = $("#pwdtxt").val();
	var pwdagain = $("#pwdagain").val();
	if (pwdtxt == pwdagain) {
		$("#pwd2Hint").html("<span style='color:green'>两次密码输入一致</span>");
		return true;
	} else {
		$("#pwd2Hint").html("<span style='color:red'>两次密码必须相同</span>");
		return false;
	}
}

//姓名验证
function realNameChack(){
	$("#realNameHint").html("");
	var addres = $("#realname").val();
	var addresReg = /^[\u4e00-\u9fa5]{2,8}$/;
	if (addresReg.test(addres)) {
		$("#realNameHint").html("<span style='color:green'>姓名格式正确</span>");
		return true;
	} else {
		$("#realNameHint").html("<span style='color:red'>请输入2-8位中文的姓名</span>");
		return false;
	}
}
// 身份证验证
function cardIdCheck() {
	$("#cardHint").html("");
	var cardReg = /^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d))|3[0-1]\d{3}([0-9]|X)$/;
	var cardtxt = $("#cardidtxt").val();
	if (cardReg.test(cardtxt)) {
		$("#cardHint").html("<span style='color:green'>身份证格式正确</span>");
		return true;
	} else {
		$("#cardHint").html("<span style='color:red'>请正确输入18位身份证号</span>");
		return false;
	}
}

//地址验证
function addresCheck(){
	$("#addresHint").html("");
	var addres = $("#addrestxt").val();
	var addresReg = /^([\u4e00-\u9fa5]+[市][\u4e00-\u9fa5]+[区|县].*){1,50}$/;
	if (addresReg.test(addres)) {
		$("#addresHint").html("<span style='color:green'>地址格式符合</span>");
		return true;
	} else {
		$("#addresHint").html("<span style='color:red'>格式(50字以内):XX市 XX区/县 xxx</span>");
		return false;
	}
}

//地址验证
function workCheck(){
	$("#workHint").html("");
	var work = $("#worktxt").val();
	var workReg = /^([\u4e00-\u9fa5]){1,50}$/;
	if (workReg.test(work)) {
		$("#workHint").html("<span style='color:green'>填写正确</span>");
		return true;
	} else {
		$("#workHint").html("<span style='color:red'>工作单位是50字以内中文</span>");
		return false;
	}
}

// 电话号码验证
function phoneCheck() {
	$("#phoneHint").html("");
	var phone = $("#phonetxt").val();
	var phoneReg = /^1(3|5|8)\d{9}$/;
	if (phoneReg.test(phone)) {
		$("#phoneHint").html("<span style='color:green'>电话号可以使用</span>");
		return true;
	} else {
		$("#phoneHint").html("<span style='color:red'>请输入电话(13*/15*/18*)</span>");
		return false;
	}
}

//邮箱验证
function mailCheck() {
	$("#emailHint").html("");
	var emailReg = /^[a-zA-Z0-9]+@(163|qq|sina)\.com$/;
	var emailtxt = $("#emailtxt").val();
	if (emailReg.test(emailtxt)) {
		$("#emailHint").html("<span style='color:green'>该邮箱可以使用</span>");
		return true;
	} else {
		$("#emailHint").html("<span style='color:red'>请输入邮箱(163/qq/sina)</span>");
		return false;
	}
}