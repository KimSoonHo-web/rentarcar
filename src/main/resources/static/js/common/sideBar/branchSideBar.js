$(document).ready(function() {
	console.log("지점 사이드바 호출");

	$('#localCloseBtn').click(function() {
		$('#resultSideBar').show();
		$('#branchSideBar').hide();
	});

	$('.que').on('click', function() {
		$(this).toggleClass('on');
		
		$(".anw").hoid();
		
	});

});