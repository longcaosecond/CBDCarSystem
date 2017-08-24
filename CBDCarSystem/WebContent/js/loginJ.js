/**
 * 用户注册方法的js
 */
var yanzhencode = false;
$(function() {
	// 粒子背景特效
	$('body').particleground({
		dotColor : '#5cbdaa',
		lineColor : '#5cbdaa'
	});

	// 初始化验证码图片
	validate()
	$("#loginform").submit(function() {
		var name = nameCheck(); // 用户名
		var pwd = pwdCheck(); // 密码
		var yanzhen = yanzhenCheck(); // 验证码
		var res = name && pwd && yanzhencode;
		return res;
	});
	$("#nametxt").blur(function() {
		nameCheck();
	});
	$("#pwdtxt").blur(function() {
		pwdCheck();
	});
	$("#J_codetext").blur(function() {
		yanzhenCheck();
	});
});

// 用户名验证
function nameCheck() {
	$("#nameHint").html("");
	var nameReg = /^[a-zA-Z0-9]{6,18}$/;
	var nametxt = $("#nametxt").val();
	if (nameReg.test(nametxt)) {
		$("#nameHint").html("<span style='color:green'>用户名格式正确</span>");
		return true;
	} else {
		$("#nameHint").html("<span style='color:red'>用户名:6-18位字母或数字</span>");
		return false;
	}
}

// 密码验证
function pwdCheck() {
	$("#pwdHint").html("");
	var pwdReg = /^[a-zA-Z0-9]{8,15}$/;
	var pwd = $("#pwdtxt").val();
	if (pwdReg.test(pwd)) {
		$("#pwdHint").html("<span style='color:green'>密码格式正确</span>");
		return true;
	} else {
		$("#pwdHint").html("<span style='color:red'>密码: 8-15位字母或数字</span>");
		return false;
	}
}

// 验证码的验证
function yanzhenCheck() {
	$("#yanzhenHint").html("");
	//var yanzhenReg = /^[a-zA-Z0-9]{6}$/;
	var yanzhen = $("#J_codetext").val();
	if (yanzhen != null && yanzhen != "") {
		$.ajax({
			url : "checkImageCode.do?stringCode=" + yanzhen,
			type : "get",
			datatype : "json",
			success : function(result) {
				if (result == "ok") {
					$("#yanzhenHint").html(
							"<span style='color:green'>验证码已通过</span>");
					yanzhencode = true;
				} else if (result == "error") {
					$("#yanzhenHint").html(
							"<span style='color:red'>验证码输入有误</span>");
				} else if (result == "ImageCodeError") {
					$("#yanzhenHint").html(
							"<span style='color:red'>验证码失效，请刷新</span>");
				}
			}
		});
	} else {
		$("#yanzhenHint").html("<span style='color:red'>请输入验证码</span>");
	}
	return yanzhencode;
}

// 获取验证码
function validate() {
	$("#yanzhenCodeImg").attr("src",
			"getYanzhangma.do?timestamp=" + (new Date()).valueOf());
}

function logincheck() {
	nameCheck()
	pwdCheck()
	yanzhenCheck()
}