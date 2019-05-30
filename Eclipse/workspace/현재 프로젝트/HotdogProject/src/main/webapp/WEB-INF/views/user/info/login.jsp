<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../../include/bootstrap.jsp"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<%@include file="../../include/header.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-10 offset-1">
				<h2>로그인</h2>
				<form id="login_form" method="post" action="/login">
					<div class="form-group">
						<label for="id">ID</label> <input type="text" class="form-control"
							id="id" name="id" placeholder="Enter id">
					</div>
					<div class="form-group">
						<label for="password">Password</label> <input type="password"
							class="form-control" id="password" name="password"
							placeholder="Password">
					</div>
					<input type="submit" class="btn btn-primary">
				</form>
			</div>
		</div>
	</div>
	<%@include file="../../include/footer.jsp"%>
</body>
</html>