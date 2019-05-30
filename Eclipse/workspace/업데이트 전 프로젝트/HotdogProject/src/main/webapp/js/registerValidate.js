$(function(){
	var idReg =  /^[a-zA-Z0-9]{4,20}$/;
	var pwReg =  /^[a-zA-Z0-9]{4,20}$/;
	var nickReg =  /^[\wㄱ-ㅎㅏ-ㅣ가-힣]{2,10}$/;
	var emailReg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	var phoneReg = /^\d{2,3}\d{3,4}\d{4}$/;
	
	//submit 했을 시 전체 검증
	$("#submit_btn").on("click", function(){
		var id = $("#id").val();
		var pw = $("#password").val();
		var nickname = $("#nickname").val();
		var email = $("#email").val();
		var phone = $("#phone").val();
		
		if(idReg.test(id) != true) {
			alert("id를 다시 입력해주세요!");
			$("#id").focus();
			return false;
		}
		if(pwReg.test(pw) != true) {
			alert("비밀번호를 다시 입력해주세요!");
			$("#password").focus();
			return false;
		}
		if(nickReg.test(nickname) != true) {
			alert("닉네임을 다시 입력해주세요!");
			$("#nickname").focus();
			return false;
		}
		if(emailReg.test(email) != true) {
			alert("이메일을 다시 입력해주세요!");
			$("#email").focus();
			return false;
		}
		if(phoneReg.test(phone) != true) {
			alert("전화번호를 다시 입력해주세요!");
			$("#phone").focus();
			return false;
		}
		
		$("#regist_form").submit();
	});
	
	//id
	$("#id").on("keyup", function(){
		var str = $("#id").val();
		
		if(idReg.test(str)) {
			idCheckAjax(str);
		} else {
			setTimeout(function() {
				$("#id").removeClass("is-valid");
				$("#id").addClass("is-invalid");
				
				$("#idMsg").text("사용 불가능한 아이디입니다! 영문,숫자를 포함한 4글자~20글자내로 기입하여주십시오.");
				$("#idMsg").removeClass("valid-feedback");
				$("#idMsg").addClass("invalid-feedback");
			},500);
		}
	});
	
	//ajaxIdCheck
	function idCheckAjax(str) {
		$.ajax({
			type:"GET",
			url:"/idCheckAjax?id=" + str,
			success : onSuccessId,
			error : onError
		});
	}
	
	function onSuccessId(result) {
		if(result == 0) {
			setTimeout(function() {
				$("#id").removeClass("is-invalid");
				$("#id").addClass("is-valid");
					
				$("#idMsg").text("사용 가능한 아이디입니다!");
				$("#idMsg").removeClass("invalid-feedback");
				$("#idMsg").addClass("valid-feedback");
			},500);
		} else {
			setTimeout(function() {
				$("#id").removeClass("is-valid");
				$("#id").addClass("is-invalid");
					
				$("#idMsg").text("이미 사용중인 아이디입니다!");
				$("#idMsg").removeClass("valid-feedback");
				$("#idMsg").addClass("invalid-feedback");
			},500);
		}
	}
	
	function onError() {
		alert("서버에 오류가 생겼습니다. 잠시후에 다시 시도해주세요!");
	}
	
	
	//pw
	$("#password").on("keyup", function(){
		var str = $("#password").val();
		if(pwReg.test(str)) {
			setTimeout(function() {
				$("#password").removeClass("is-invalid");
				$("#password").addClass("is-valid");
				
				$("#pwMsg").text("사용 가능한 비밀번호입니다!");
				$("#pwMsg").removeClass("invalid-feedback");
				$("#pwMsg").addClass("valid-feedback");
			},500);
			
		} else {
			setTimeout(function() {
				$("#password").removeClass("is-valid");
				$("#password").addClass("is-invalid");
				
				$("#pwMsg").text("사용 불가능한 비밀번호입니다! 영문,숫자를 포함한 4글자~20글자 내로 기입하여주십시오.");
				$("#pwMsg").removeClass("valid-feedback");
				$("#pwMsg").addClass("invalid-feedback");
			},500);
		}
	});
	
	//nickname
	$("#nickname").on("keyup", function(){
		var str = $("#nickname").val();
		if(nickReg.test(str)) {
			nickCheckAjax(str);
		} else {
			setTimeout(function() {
				$("#nickname").removeClass("is-valid");
				$("#nickname").addClass("is-invalid");
				
				$("#nickMsg").text("사용 불가능한 닉네임입니다! 한글,영문,숫자를 포함한 2글자~10글자 내로 기입하여주십시오.");
				$("#nickMsg").removeClass("valid-feedback");
				$("#nickMsg").addClass("invalid-feedback");
			},500);
		}
	});
	
	//nickname ajax로 중복 체크
	function nickCheckAjax(str) {
		$.ajax({
			url:"/nickCheckAjax?nickname=" + str,
			type:"GET",
			success:onSucessNick,
			error:onError
		});
	}
	
	function onSucessNick(result) {
		if(result == 0) {
			setTimeout(function() {
				$("#nickname").removeClass("is-invalid");
				$("#nickname").addClass("is-valid");
				
				$("#nickMsg").text("사용 가능한 닉네임입니다!");
				$("#nickMsg").removeClass("invalid-feedback");
				$("#nickMsg").addClass("valid-feedback");
			},500);
		} else {
			setTimeout(function() {
				$("#nickname").removeClass("is-valid");
				$("#nickname").addClass("is-invalid");
				
				$("#nickMsg").text("이미 사용중인 닉네임입니다!");
				$("#nickMsg").removeClass("valid-feedback");
				$("#nickMsg").addClass("invalid-feedback");
			},500);
		}
	}
	
	//email
	$("#email").on("keyup", function(){
		var str = $("#email").val();
		if(emailReg.test(str)) {
			setTimeout(function() {
				$("#email").removeClass("is-invalid");
				$("#email").addClass("is-valid");
				
				$("#emailHelp").text("사용 가능한 이메일입니다!");
				$("#emailHelp").removeClass("invalid-feedback");
				$("#emailHelp").addClass("valid-feedback");
			},500);
			
		} else {
			setTimeout(function() {
				$("#email").removeClass("is-valid");
				$("#email").addClass("is-invalid");
				
				$("#emailHelp").text("사용 불가능한 이메일입니다! 이메일 형식을 지켜주십시오.");
				$("#emailHelp").removeClass("valid-feedback");
				$("#emailHelp").addClass("invalid-feedback");
			},500);
		}
	});
	
	//phone
	$("#phone").on("keyup", function(){
		var str = $("#phone").val();
		if(phoneReg.test(str)) {
			setTimeout(function() {
				$("#phone").removeClass("is-invalid");
				$("#phone").addClass("is-valid");
				
				$("#phoneHelp").text("형식에 어긋나지않음.");
				$("#phoneHelp").removeClass("invalid-feedback");
				$("#phoneHelp").addClass("valid-feedback");
			},500);
			
		} else {
			setTimeout(function() {
				$("#phone").removeClass("is-valid");
				$("#phone").addClass("is-invalid");
				
				$("#phoneHelp").text("형식에 어긋납니다. 번호만 기입하여 주십시오.");
				$("#phoneHelp").removeClass("valid-feedback");
				$("#phoneHelp").addClass("invalid-feedback");
			},500);
		}
	});
});