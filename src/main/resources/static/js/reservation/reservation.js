$(document).ready(function() {
	console.log("예약 js 호출");


	$('.insur_tab li').on('click', function() {
		// 'on' 클래스를 모든 li 요소에서 제거합니다.
		$('.insur_tab li').removeClass('on');

		// 클릭된 li에 'on' 클래스를 추가합니다.
		$(this).addClass('on');

		var dataPremium = $(this).data('premium');
		var formattedDataPremium = dataPremium.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '원';

		$('#insurance-premium').text(formattedDataPremium);

		// 현재 차량 항목에서 가격과 할인율을 추출합니다.
		var originalPrice = parseFloat($('#price_regular').text().replace(/[^\d.]/g, ''));
		var discountRate = parseFloat($('#rate').text().replace(/[^\d.]/g, ''));

		// 계산을 위해 dataPremium을 숫자로 변환합니다.
		dataPremium = parseFloat($('#insurance-premium').text().replace(/[^\d.]/g, ''));

		// 할인된 가격을 계산합니다.
		var discountedPrice = originalPrice + dataPremium - (originalPrice * discountRate / 100);

		// 할인된 금액을 계산합니다.
		var deducting = originalPrice - discountedPrice;

		// 가격을 형식화합니다.
		var formattedDiscountedPrice = discountedPrice.toFixed(0).replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '원';
		var formattedOriginalPrice = originalPrice.toFixed(0).replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '원';
		var formattedDeducting = deducting.toFixed(0).replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '원';

		// 가격을 표시합니다.
		$('#price_sale').text(formattedDiscountedPrice);
		$('#price_regular').text(formattedOriginalPrice);
		$('#deducting').text('- ' + formattedDeducting);
	});


	$('.insur_tab li').first().click();


	$('.insur_link').click(function() {
		$('body').css('overflow', 'hidden');
		$('#reservationModal').show();

	});


	$('.btn_close').click(function() {
		$('body').css('overflow', 'visible');
		$('#reservationModal').hide();

	});

	function extractNumericValue(str) {
		return str.replace(/[^\d.-]/g, '');
	}

	//결제 버튼
	$("#payBtn").click(function() {
		console.log("클릭");

		var priceRegular = extractNumericValue($("#price_regular").text());
		var insurancePremium = extractNumericValue($("#insurance-premium").text());
		var memberDiscount = extractNumericValue($("#deducting").text());
		var totalPayment = extractNumericValue($("#price_sale").text());

		console.log(priceRegular);
		console.log(insurancePremium);
		console.log(memberDiscount);
		console.log(totalPayment);
		var formData = {
			carNo: $("[name='carNo']").val(),
			userNo: $("[name='userNo']").val(),
			date: $("[name='date']").val(),
			priceRegular: priceRegular,
			insurancePremium: insurancePremium,
			memberDiscount: memberDiscount,
			totalPayment: totalPayment
		};

		$.ajax({
			type: "POST",
			url: "/payForm.do",
			data: formData,
			success: function(response) {
				$(".container").html(response);


			},
			error: function(xhr, status, error) {
				console.error("Error in form submission:", error);
			}
		});
	});

});