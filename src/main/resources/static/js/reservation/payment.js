$(document).ready(function() {

	console.log("카드 js 호출")

	var priceRegular = parseFloat($('#priceRegular').text().replace(/[^\d.]/g, ''));
	var memberDiscount = parseFloat($('#memberDiscount').text().replace(/[^\d.]/g, ''));
	var totalPayment = parseFloat($('#totalPayment').text().replace(/[^\d.]/g, ''));
	var insurancePremium = parseFloat($('#insurancePremium').text().replace(/[^\d.]/g, ''));

	var priceRegular = priceRegular.toFixed(0).replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '원';
	var memberDiscount = memberDiscount.toFixed(0).replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '원';
	var totalPayment = totalPayment.toFixed(0).replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '원';
	var insurancePremium = insurancePremium.toFixed(0).replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '원';


	// 가격을 표시합니다.
	$('#priceRegular').text(priceRegular);
	$('#memberDiscount').text('- ' + memberDiscount);
	$('#insurancePremium').text(insurancePremium);
	$('#totalPayment').text(totalPayment);
	$('#totalPaymentBtn').text(totalPayment + ' 으로 결제하기');

	// JavaScript 파일 안에서 결제 버튼 클릭 이벤트를 처리하는 함수
	$("#totalPaymentBtn").click(function() {
		// 선택된 결제 방법 확인
		var selectedPaymentMethod = $("input[name='radioDefault']:checked").val();

		// 만약 선택된 결제 방법이 카카오페이라면
		if (selectedPaymentMethod === 'kakao') {
			// 카카오페이 결제 프로세스 시작
			startKakaoPayPayment();
		} else if (selectedPaymentMethod === 'naver') {
			startnaverPayPayment();
		} else {
			alert("구현중인 결제 수단 입니다.")
		}
	});
	
	// 홈 버튼 클릭 시 이벤트
	$('#homeBtn').click(function(){
		window.location.href ="/main.do";
	});
	
	// 예약내역 확인 클릭 이벤트
	$('#reservationOkBtn').click(function(){
		window.location.href ="/reservationOk.do";
	});

}); // end
 
// 카카오페이 결제를 시작하는 함수
function startKakaoPayPayment() {
	// 여기에 카카오페이 결제를 시작하는 로직 구현
	console.log("카카오페이 결제 시작");

	var userNo = $("input[name='userNo']").val();
	var carNo = $("input[name='carNo']").val();
	var branchName = $("input[name='branchName']").val();
	var carName = $("input[name='carName']").val();
	var amount = $('#totalPayment').text();
	var date = $("input[name='date']").val();

	console.log("date : " , date);
	// 콤마와 화폐 기호 제거
	amount = amount.replace(/[^0-9]/g, '');


	// AJAX 호출을 사용하여 서버에 결제 요청을 보냄
	$.ajax({
		url: '/payment/kakao',
		type: 'POST',
		contentType: 'application/json',
		data: JSON.stringify({
			paymentMethod: 'kakao',
			amount: amount,
			userNo: userNo,
			carNo: carNo,
			branchName: branchName,
			carName: carName,
			date: date
		}),
		success: function(response) {
			// 결제 처리가 성공적이라면 서버로부터의 응답 처리
			console.log("결제 준비: ", response);
			window.location.href = response;
			
			
			 //window.location.href = '/payment-success';
		},
		error: function(xhr, status, error) {
			// 에러 처리
			console.error("결제 실패: ", error);
		}
	});
}



// 카카오페이 결제를 시작하는 함수
function startnaverPayPayment() {
	// 여기에 카카오페이 결제를 시작하는 로직 구현
	console.log("네이버 결제 시작");
}