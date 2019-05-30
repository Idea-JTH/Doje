<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<script defer
	src="https://use.fontawesome.com/releases/v5.0.13/js/all.js"
	integrity="sha384-xymdQtn1n3lH2wcu0qhcdaOpQwyoarkgLVxC/wZ5q7h9gHtxICrpcaSUfygqZGOe"
	crossorigin="anonymous">	
</script>
<%@include file = "include/bootstrap.jsp" %>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<img class="bg2" src="imgs/bg2.jpg">
	<%@include file="include/header.jsp"%>
	<div id = "wrap">
		<header>

			<h1>Hot &nbsp;Dog</h1>

			<div class="big-box">
				<div class="img-box">
					<img class="rank_img" src="imgs/pic14.jpg"> <img class="rank"
						src="imgs/rank.jpg">
				</div>
			</div>
		</header>

		<section>

			<h2>Please vote for yourself and decide next week's Hot dog!</h2>


			<h3>
				<span class="day">00</span>d&nbsp;: <span class="hour">00</span>h&nbsp;:
				<span class="minute">00</span>m&nbsp;
				<!-- <span class="second">00</span>s -->
			</h3>

			<div class="img-box2">
				<img src="imgs/pic1.jpg">
				<div class="like-box">
					<i class="fas fa-thumbs-up like-icon"></i> <span>Like it!</span>
				</div>
			</div>
			<div class="img-box2">
				<img src="imgs/pic2.jpg">
				<div class="like-box">
					<i class="fas fa-thumbs-up like-icon"></i> <span>Like it!</span>
				</div>
			</div>
			<div class="img-box2">
				<img src="imgs/pic3.jpg">
				<div class="like-box">
					<i class="fas fa-thumbs-up like-icon"></i> <span>Like it!</span>
				</div>
			</div>

			<div class="img-box2">
				<img src="imgs/pic4.jpg">
				<div class="like-box">
					<i class="fas fa-thumbs-up like-icon"></i> <span>Like it!</span>
				</div>
			</div>
			<div class="img-box2">
				<img src="imgs/pic5.jpg">
				<div class="like-box">
					<i class="fas fa-thumbs-up like-icon"></i> <span>Like it!</span>
				</div>
			</div>
			<div class="img-box2">
				<img src="imgs/pic6.jpg">
				<div class="like-box">
					<i class="fas fa-thumbs-up like-icon"></i> <span>Like it!</span>
				</div>
			</div>

			<div class="img-box2">
				<img src="imgs/pic7.jpg">
				<div class="like-box">
					<i class="fas fa-thumbs-up like-icon"></i> <span>Like it!</span>
				</div>
			</div>
			<div class="img-box2">
				<img src="imgs/pic8.jpg">
				<div class="like-box">
					<i class="fas fa-thumbs-up like-icon"></i> <span>Like it!</span>
				</div>
			</div>
			<div class="img-box2">
				<img src="imgs/pic9.jpg">
				<div class="like-box">
					<i class="fas fa-thumbs-up"></i> <span>Like it!</span>
				</div>
			</div>

			<div class="img-box2">
				<img src="imgs/pic10.jpg">
				<div class="like-box">
					<i class="fas fa-thumbs-up like-icon"></i> <span>Like it!</span>
				</div>
			</div>
			<div class="img-box2">
				<img src="imgs/pic11.jpg">
				<div class="like-box">
					<i class="fas fa-thumbs-up like-icon"></i> <span>Like it!</span>
				</div>
			</div>
			<div class="img-box2">
				<img src="imgs/pic12.jpg">
				<div class="like-box">
					<i class="fas fa-thumbs-up like-icon"></i> <span>Like it!</span>
				</div>
			</div>
		</section>
	</div>

	<div class="overay" style="display: none">
		<div class="popup">
			<img class="popup-img" src="" alt="">
		</div>
		<div class="close-popup">Close</div>
	</div>

	<span class="pageNum">1 2 3 4 5 6 7 8 9 10</span>

	<%@include file="include/footer.jsp"%>
</body>
</html>