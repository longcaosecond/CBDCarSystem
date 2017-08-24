$("#btn").click(function(){
	 var pathName = window.document.location.pathname;
		var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
	location.href = projectName+"/addDealIndo.do?";
});
$("#btn1").click(function(){
	 var pathName = window.document.location.pathname;
		var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
	location.href = projectName+"/changeWantTypeByB.do?wantType=4";
});
$("#btn2").click(function(){
	 var pathName = window.document.location.pathname;
		var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
	location.href = projectName+"/jsp/user/informationRight.jsp";
});