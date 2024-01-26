$(document).ready(function() {

	
	//view1 선택 버튼
	$('#view1').click(function() {
		$('#view1-modal').show();
		$('body').css('overflow', 'hidden');

	})
	$('#view1-close').click(function() {
		$('#view1-modal').hide();
		$('body').css('overflow', 'visible');

	})
	$('#view1-ok').click(function() {
		$('#view1-modal').hide();
		$('body').css('overflow', 'visible');
		$('#agree01').prop('checked', true);
		updateNextButtonState();

	})

	// 주소 버튼 클릭 시 이벤트
	$('#add-button').click(function() {
		new daum.Postcode({
			oncomplete: function(data) {
				// 우편번호와 주소 정보를 각각의 input 필드에 채워줍니다.
				$('#zipNo').val(data.zonecode); // 우편번호 입력
				$('#addr').val(data.address); // 주소 입력
			}
		}).open();
	})

	// 상세 주소 포커스 이벤트
	$('#dtlAddr').focus(function() {
		if ($('#zipNo').val() === '' || $('#addr').val() === '') {
			// 'add-modal'을 표시합니다.
			$('#add-modal').show();

			// 3초 후에 'add-modal'을 숨깁니다.
			setTimeout(function() {
				$('#add-modal').hide();
			}, 3000);
			// 상세 주소 입력란에 포커스를 제거합니다.
			$(this).blur();
		}
	});
	// dtlAddr 입력 필드와 agree01 체크박스의 변화에 따라 버튼 상태 업데이트
	$('#dtlAddr, #agree01').on('input change', function() {
		updateNextButtonState();
	});

	// 다음 버튼 클릭 이벤트
	$('#next-button').click(function() {
		var userId = $('#userId').val();
		var userPassword = $('#userPassword').val();
		var userName = $('#userName').val();
		var userPhone = $('#userPhone').val();
		var zipNo = $('#zipNo').val();
		var addr = $('#addr').val();
		var dtlAddr = $('#dtlAddr').val();

		// 동적으로 폼 생성
		var form = $('<form></form>');
		form.attr("method", "post");
		form.attr("action", "/license.do");

		// 폼 필드 추가
		form.append($('<input>').attr('type', 'hidden').attr('name', 'userId').attr('value', userId));
		form.append($('<input>').attr('type', 'hidden').attr('name', 'userPassword').attr('value', userPassword));
		form.append($('<input>').attr('type', 'hidden').attr('name', 'userName').attr('value', userName));
		form.append($('<input>').attr('type', 'hidden').attr('name', 'userPhone').attr('value', userPhone));
		form.append($('<input>').attr('type', 'hidden').attr('name', 'userAddress1').attr('value', zipNo));
		form.append($('<input>').attr('type', 'hidden').attr('name', 'userAddress2').attr('value', addr));
		form.append($('<input>').attr('type', 'hidden').attr('name', 'userAddress3').attr('value', dtlAddr));

		// 폼 제출
		$(document.body).append(form);
		form.submit();
	});


});//end	
function updateNextButtonState() {
	var dtlAddrValue = $('#dtlAddr').val();
	var isAgree01Checked = $('#agree01').is(':checked');

	if (dtlAddrValue && isAgree01Checked) {
		$('#next-button').removeClass('disabled').prop('disabled', false);
	} else {
		$('#next-button').addClass('disabled').prop('disabled', true);
	}
}


