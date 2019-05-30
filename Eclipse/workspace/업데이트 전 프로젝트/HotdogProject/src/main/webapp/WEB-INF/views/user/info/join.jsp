<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../../include/bootstrap.jsp"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="js/registerValidate.js"></script>
<style>
</style>
</head>
<body>

	<script>
		/* $(function() {
			//submit 할때
			$("#regist_form").on("submit", function(e) {
				//폼 안의 값들을 id=val&pw=val&email=val 형태로 만들어줌
				var formdata = $("#regist_form").serialize();
				/* var obj = {
					id: id.value,
					name: name.value,
					nickname: nickname.value,
					email: email.value
				} 
				$.ajax({
					type : "POST",
					url : "/registerAjax",
					data : formdata,
					success : onSuccess,
					error : onError
				});
				return false;
			});
		});
		function onSuccess(str) { //성공
			alert(str)
		}
		function onError() { //에러
			alert("error!")
		} */
	</script>
	<%@include file="../../include/header.jsp"%>
	<div class="container pt-4 pb-4">
		<div class="row">
			<div class="col-10 offset-1">
				<h2>회원가입</h2>
				<form action="/register" method="post" id="regist_form">
					<div class="form-group">
						<label for="id">Id</label> <input type="text" class="form-control"
							id="id" name="id" placeholder="Enter id">
							<small id = "idMsg" class="form-text">
								영문,숫자를 포함한 4글자~20글자
							</small>
					</div>
					<div class="form-group">
						<label for="password">Password</label> <input type="password"
							class="form-control" name="password" id="password"
							placeholder="Enter Password">
							<small id = "pwMsg" class="form-text">
								영문,숫자를 포함한 4글자~20글자
							</small>
					</div>
					<div class="form-group">
						<label for="NickName">Nick name</label> <input type="text"
							class="form-control" id="nickname" name="nickname"
							placeholder="Enter Nickname">
							<small id = "nickMsg" class="form-text">
								특수문자를 제외한 2글자~10글자
							</small>
					</div>
					<div class="form-group">
						<label for="Email">Email address</label> <input type="email"
							class="form-control" name="email" id="email"
							aria-describedby="emailHelp" placeholder="Enter email"> <small
							id="emailHelp" class="form-text">저희는 절대 다른 사람과 당신의
							이메일을 공유하지 않습니다.</small>
					</div>
					<div class="form-group">
						<label for="PhoneNumber">Phone</label> <input type="text"
							class="form-control" id="phone" name="phonenumber"
							placeholder="Enter phonenumber"><small id="phoneHelp"
							class="form-text">숫자만 기입하여주십시오.</small>
					</div>
					<button type="button" id="submit_btn" class="btn btn-primary">회원가입</button>
				</form>
			</div>
		</div>
	</div>
	<%@include file="../../include/footer.jsp"%>
	<script>
	
	</script>
</body>
</html>