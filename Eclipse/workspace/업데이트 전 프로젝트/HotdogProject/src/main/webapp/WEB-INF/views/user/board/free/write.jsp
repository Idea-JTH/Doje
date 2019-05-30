<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				<h2>글작성</h2>
				<form method="post" action="/free/write" enctype="multipart/form-data">
					<input type="hidden" name="writer" value="${sessionScope.user.nickname }">
					<input type="hidden" name="table" value="freeboard">
					<div class="form-group">
						<label for="title">글 제목</label> 
						<input type="text" class="form-control" id="title" name="title" placeholder="글 제목을 입력하세요">
					</div>
					
					<div class="form-group">
						<textarea class="form-control" id="content" name="content" placeholder="글 내용을 입력하세요"></textarea>					
					</div>
					
					<button type="submit" class="btn btn-primary">글작성</button>
				</form>
			</div>
		</div>
	</div>
<%@include file = "../../../include/footer.jsp" %>
<script src="/tinymce/js/tinymce/tinymce.min.js"></script>
<script src="/js/tinymce.js"></script>
</body>
</html>