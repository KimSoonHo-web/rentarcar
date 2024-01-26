$(document).ready(function(){
	//탑 버튼 클릭 시
	$('.top_btn').click(function() {
		$('html, body').animate({ scrollTop: 0 }, 'fast'); // 페이지 맨 위로 부드럽게 스크롤
	});
});
