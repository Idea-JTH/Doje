<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file = "../../../include/bootstrap.jsp" %>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<%@include file = "../../../include/header.jsp" %>
	<div class="container">
		<div class="row">
			<div class="col-10 offset-1">
				<div class="row d-flex mb-2">
					<div class="ml-2 border border-primary rounded" style="width:128px;height:128px;overflow: hidden;">
						<img src="adsf" width="128" height="128">
					</div>
					<div class="col">
						<h4 class="card-title">${data.title}</h4>
						<p class="card-text">
							<span class="badge badge-primary">글쓴이 : ${data.writer }</span><br>
							<span class="badge badge-secondary">레벨</span><br>
							<span class="badge badge-warning">작성일 : <fmt:formatDate value="${data.writedate}" pattern="yyyy/MM/dd HH:mm"/></span>
							<c:if test="${sessionScope.user != null and sessionScope.user.nickname == data.writer }">
							<div class="text-right">
								<a href="/free/update?id=${data.id }&writer=${data.writer}" class="btn btn-success">수정</a>
								<a href="/free/delete?id=${data.id }&writer=${data.writer}" class="btn btn-danger">삭제</a>
							</div>
							</c:if>
						</p>
					</div>
				</div>
				
				<div class="card border-primary min-vh-500">
					<div class="card-body ">
						${data.content }
					</div>
				</div>
			</div>
		</div>
		<div class="row mt-3">
			<div class="col-10 offset-1 text-right">
				<a href="/free" class="btn btn-primary">목록보기</a>
			</div> 
		</div>
	</div>
<%@include file = "../../../include/footer.jsp" %>
</body>
</html>