$(function(){

	// $(".overay").hide();

	$(".rank_img,.img-box2 img").on("click", function(e){
		var src = $(this).attr("src");

		$(".popup-img").attr("src", src);

		$(".overay").fadeIn();
		
	});

	$(".close-popup").on("click", function(e){
		$(".overay").fadeOut();
	});

	timer();

	setInterval(function(){
		timer();
	}, 1000);	

	function timer() {
		var date = new Date();

		var endDate = 30;

		var day = endDate - date.getDate();
		var hour = 24 - date.getHours();
		var minute = 60 - date.getMinutes();
		// var second = 60 - date.getSeconds();




		if(day < 10) {
			day = "0" + day;
		}

		if(hour < 10) {
			hour = "0" + hour;
		}

		if(minute < 10) {
			minute = "0" + minute;
		}

		// if(second < 10) {
		// 	second = "0" + second;
		// }

		$(".day").text(day);
		$(".hour").text(hour);
		$(".minute").text(minute);
		// $(".second").text(second);
	}

	/*좋아요 클릭 이벤트*/

	$(document).on("click", ".like-box > svg", function(){
		if($(this).siblings("span").attr("class") != "on"){
			$(this).siblings("span").addClass("on");
		}else{
			$(this).siblings("span").removeClass('on');
		}
	});
});