<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	span {
		color: cornflowerblue;
	}
</style>
<%@include file="../../include/bootstrap.jsp"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
	$(function() {
		$("#modifyPw_form").on("submit", function() {
			var password = $("#modifyPw_form").serialize();

			$.ajax({
				url : "/modifypasswordAjax",
				type : "POST",
				data : password,
				success : onSuccess,
				error : onError
			});
			return false;
		});

		function onSuccess(str) {
			alert(str);
		}
		function onError() {
			alert("error!");
		}
	});
</script>
</head>
<body>
	<%@include file="../../include/header.jsp"%>
	<h1>비밀번호 수정 페이지 입니다.</h1>
	<h2>id : <span>${data.id }</span></h2>
	<h2>nickname : <span>${data.nickname }</span></h2>
	<h2>email : <span>${data.email }</span></h2>
	<h2>regdate : <span>${data.regdate }</span></h2>
	<form id="modifyPw_form" method="post" style="width: 400px">
			<input type="hidden" id="nickname" name="nickname"
				value="${data.nickname }">
				<label for="pw" style="margin-left : 5px">password</label> <input type="text"
				class="form-control" id="password" name="password"
				value="${data.password }"> <input type="submit" value="수정">
	</form>
</body>
</html>