<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file = "../../../include/bootstrap.jsp" %>
</head>
<body>
<%@include file = "../../../include/header.jsp" %>
<div class="container">
		<div class="row">
			<div class="col-10 offset-1">
			<c:if test="${empty data }">
				<h2>글 작성</h2>
				<form method="post" action="/free/write" enctype="multipart/form-data">
			</c:if>
			<c:if test="${!empty data }">
				<h2>글 수정</h2>
				<form method="post" action="/free/update" enctype="multipart/form-data">
				<input type="hidden" name="id" value="${data.id }">
			</c:if>
				
					<input type="hidden" name="writer" value="${sessionScope.user.nickname }">
					<input type="hidden" name="table" value="freeboard">
					<div class="form-group">
						<label for="title">제목</label> 
						<input type="text" class="form-control" id="title" name="title" maxlength="50" placeholder="글 제목을 입력하세요" value="${data.title }">
					</div>
					
					<div class="form-group">
						<textarea class="form-control" id="content" name="content" placeholder="글 내용을 입력하세요">${data.content }</textarea>					
					</div>
					<div class="form-group text-right">
						<button type="button" onclick=cansle() class="btn btn-warning">취소</button>
					<c:if test="${empty data }">				
						<button type="submit" class="btn btn-primary">작성</button>
					</c:if>
					<c:if test="${!empty data }">
						<button type="submit" class="btn btn-primary">수정</button>
					</c:if>
					</div>	
				</form>
			</div>
		</div>
		<div style="height: 40px"></div>
	</div>
<%@include file = "../../../include/footer.jsp" %>
<script>
	function cansle() {
		location.replace("/free");
	}
</script>
<script src="/tinymce/js/tinymce/tinymce.min.js"></script>
<script src="/js/tinymce.js"></script>
</body>
</html>