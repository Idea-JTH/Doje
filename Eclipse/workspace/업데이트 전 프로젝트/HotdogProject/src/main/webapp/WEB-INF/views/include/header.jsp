<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<a class="navbar-brand" href="/main">HotDog</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="/main">Home
					<span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item"><a class="nav-link" href="/notice">공지사항</a>
			</li>
			<li class="nav-item"><a class="nav-link" href="/free">자유게시판</a>
			</li>
			<li class="nav-item"><a class="nav-link" href="#">포인트샵</a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> 종별 게시판 </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="#">푸들</a> <a class="dropdown-item"
						href="#">비숑</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#">Something else here</a>
				</div></li>

		</ul>
		<c:if test="${empty sessionScope.user }">
		<form class="form-inline my-2 my-lg-0" id="ajaxLogin_form">
				<input class="form-control mr-sm-2" type="text" placeholder="회원아이디" name="id">
				<input class="form-control mr-sm-2" type="password" placeholder="비밀번호" name="password">
				<button class="btn btn-outline-success my-2 mr-2 my-sm-0" type="submit">로그인</button>
				<a href="/register" class="btn btn-outline-info my-2 my-sm-0">회원가입</a>
			</form>
		</c:if>
		<c:if test="${!empty sessionScope.user}">
		<div>
			<button class="btn btn-outline-success"><c:out value="${sessionScope.user.nickname}"/> 님</button>
			<a href="/logout" class="btn btn-outline-warning">로그아웃</a>
		</div>
		</c:if>
	</div>
</nav>
<c:set var="msg" value="${msg}"/>
<c:if test="${!empty msg}">
<div class="alert alert-warning alert-dismissible fade show">
		<strong>알림!</strong><span>&nbsp;&nbsp;${msg}</span>
		<button type="button" class="close" data-dismiss="alert">
			<span>&times;</span>
		</button>
</div>
</c:if>
<div class="mb-4">

</div>
<script>
		$(function() {
			//submit 할때
			$("#ajaxLogin_form").on("submit", function(e) {
				//폼 안의 값들을 id=val&pw=val&email=val 형태로 만들어줌
				var formdata = $("#ajaxLogin_form").serialize();
				$.ajax({
					type : "POST",
					url : "/loginProcAjax",
					data : formdata,
					success : onSuccess,
					error : onError
				});
				return false;
			});
		});
		function onSuccess(check) { //성공
			if(check == 1) {
				alert("로그인 성공!");
				window.location.href="/main";
			} else {
				alert("로그인 실패!");
			}
		}
		function onError() { //에러
			alert("ajax error!");
		}
</script>