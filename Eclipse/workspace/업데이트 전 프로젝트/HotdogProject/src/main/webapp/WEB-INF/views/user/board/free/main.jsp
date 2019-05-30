<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../../css/style.css">
<%@include file = "../../../include/bootstrap.jsp" %>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<%@include file = "../../../include/header.jsp" %>
<div class="container">
		<div class="row">
			<div class="col-10 offset-1">
				<h2>자유 게시판</h2>
				<div class="row">
					<div class="col-12 text-right">
						<form class="form-inline justify-content-end" id="searchForm">
							<input type="text" class="form-control mb-2 mr-sm-2" id="keyword"
								placeholder="검색어를 입력하세요">
							<button type="button" id="btnSearch" class="btn btn-primary mb-2">
								검색
							</button>
						</form>
					</div>
				</div>
				<table class="table table-striped">
					<tr>
						<th>글번호</th>
						<th width="50%">글제목</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
					<c:forEach items="${list }" var="list">
						<tr>
							<th>${list.id }</th>
							<th width="50%">${list.title }</th>
							<th>${list.writer }</th>
							<th><fmt:formatDate value="${list.writedate}" pattern="yyyy-MM-dd"/></th>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		<div class="row mt-3">
			<div class="col-10 offset-1 text-right">
				<a href="/free/write" class="btn btn-primary">글작성</a>
			</div> 
		</div>
	</div>
<%@include file = "../../../include/footer.jsp" %>
</body>
</html>