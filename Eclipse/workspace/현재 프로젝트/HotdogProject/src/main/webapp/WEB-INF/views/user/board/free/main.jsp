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
					<tr class="table-primary">
						<th class="text-center">글번호</th>
						<th width="50%" class="text-center">글제목</th>
						<th class="text-center">작성자</th>
						<th class="text-center">작성일</th>
					</tr>
					<c:forEach items="${list }" var="list">
					<c:set var="now" value="${now }" />
					<fmt:formatDate value="${list.writedate}" pattern="yyyy/MM/dd" var="writedate"/>
						<tr>
							<td class="text-center">${list.id }</td>
							<td class="text-center" width="50%"><a class="text-dark" href="/free/detail/${list.id}">${list.title }</a></td>
							<td class="text-center">${list.writer }</td>
							<c:if test="${writedate != now}">
								<td class="text-center"><fmt:formatDate value="${list.writedate}" pattern="yyyy/MM/dd"/></td>
							</c:if>
							<c:if test="${writedate == now}">
								<td class="text-center"><fmt:formatDate value="${list.writedate}" pattern="HH:mm"/></td>
							</c:if>							
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col-10 offset-1 text-right">
				<a href="/free/write" class="btn btn-primary">글 작성</a>
			</div> 
		</div>
		
		<nav class="mt-3 mb-3">
			<ul class="pagination justify-content-center">
			<c:if test="${criteria.prev }">
				<li class="page-item">
					<a class="page-link" href="/free?page=${criteria.start - 1}">
						<span aria-hidden="true">&laquo;</span>
					</a>
    			</li>
    		</c:if>
    		<c:forEach var="i" begin="${criteria.start }" end="${criteria.end }">
    				<li class="page-itme">
						<a class="page-link" href="/free?page=${ i }">
							${i }
						</a>
					</li>
			</c:forEach>
			<c:if test="${criteria.next }">
				<li class="page-item">
					<a class="page-link" href="/free?page=${criteria.end + 1 }">
						<span aria-hidden="true">&raquo;</span>
					</a>
				</li>
			</c:if>
			</ul>
		</nav>
	</div>
<%@include file = "../../../include/footer.jsp" %>
<script>
	$(function(){
		$("#btnSearch").on("click", function(e) {
			let text = $("#keyword").val();
			location.href = '/free?keyword=' + text;
		});
		$("#searchForm").on("submit", function(e){
			$("#btnSearch").click();
			return false;
		});
	});
</script>
</body>
</html>