$(document).ready(function() {
	console.log("차량 디테일 js 호출");


	// 현재 차량 항목에서 가격과 할인율을 추출합니다.
	var originalPrice = parseFloat($(this).find('#price_regular').text().replace('원', ''));
	var discountRate = parseFloat($(this).find('#rate').text().replace('%', ''));
	console.log(originalPrice);
	console.log(discountRate);
	// 할인된 가격을 계산합니다.
	var discountedPrice = originalPrice - (originalPrice * discountRate / 100);
	// 할인된 가격을 현재 차량 항목에 표시합니다.

	var roundedPrice = discountedPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	var originalPrice = originalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	console.log(roundedPrice);
	console.log(originalPrice);

	$(this).find('#price_sale').text(roundedPrice + '원');
	$(this).find('#price_sale_btn').text(roundedPrice + '원으로 예약하기');
	$(this).find('#price_regular').text(originalPrice + '원');


	// 지도 및 기타 기능을 초기화하는 함수
	function initMap() {
		// 지도 컨테이너와 옵션
		var mapContainer = document.getElementById('react-naver-map'),
			mapOption = {
				center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심 좌표
				level: 2 // 지도의 확대 레벨
			};

		// 지도 생성
		var map = new kakao.maps.Map(mapContainer, mapOption);


		// <dd> 요소에 접근하여 주소 추출
		var ddElement = document.querySelector('dd');
		var fullText = ddElement.textContent;
		var addresses = fullText.split('\n');
		var branchAddress1 = addresses[1].trim();

		console.log("branchAddress1 : ", branchAddress1); // 추출된 주소 로그 출력

		/*var branchName = $('.point_name').text();
			console.log("branchName : " , branchName);*/

		// 주소를 좌표로 변환하는 지오코더
		var geocoder = new kakao.maps.services.Geocoder();

		// 주소로 지오코딩
		geocoder.addressSearch(branchAddress1, function(result, status) {

			if (status === kakao.maps.services.Status.OK) {
				var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

				// 마커 생성 및 배치
				var marker = new kakao.maps.Marker({
					map: map,
					position: coords
				});
				marker.setMap(map);

				// 지도 중심을 새 좌표로 이동
				map.setCenter(coords);
			}

		});
	}

	// 카카오 지도 API가 로드된 후에 지도 초기화 함수 호출
	window.onload = function() {
		initMap();
	};

	// 비회원 예약하기 클릭 시
	$('#no_member_btn').click(function() {
		$('body').css('overflow', 'hidden');
		$('#no_member_modal').show();
	})
	// 모달 닫기
	$('#no_member_close').click(function() {
		$('body').css('overflow', 'visible');
		$('#no_member_modal').hide();
	})
	// ~으로 예약하기클릭시 이벤트
	$('#price_sale_btn').click(function() {
		
		//window.location.href="login.do"

	})

});