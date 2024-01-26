
$(document).ready(function() {
	console.log("차량 디테일 js 호출");


	// 각 차량 항목에 대해 루프를 돕니다.
	$('.list_item').each(function() {
		// 현재 차량 항목에서 가격과 할인율을 추출합니다.
		var originalPrice = parseFloat($(this).find('.price_regular').text().replace('원', ''));
		var discountRate = parseFloat($(this).find('.rate').text().replace('%', ''));

		// 할인된 가격을 계산합니다.
		var discountedPrice = originalPrice - (originalPrice * discountRate / 100);
		// 할인된 가격을 현재 차량 항목에 표시합니다.

		var roundedPrice = discountedPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		var originalPrice = originalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");


		$(this).find('.price_sale').text(roundedPrice + '원');
		$(this).find('.price_regular').text(originalPrice + '원');
	});






	//수정 클릭 이벤트
	$('.btn_edit').on('click', function() {
		$('#resultSideBar').hide();
		$('#branchSideBar').show();
	});

	



});
