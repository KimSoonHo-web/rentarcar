$(document).ready(function() {
	console.log("호출");

	// 면허증 종류 유효성
	$('select').change(function() {
		// 선택된 값이 비어 있는지 확인
		if ($(this).val() === '') {
			// 면허 종류가 선택되지 않았으면 에러 메시지 표시
			$('#erorr-form1').show();
			$('#erorr-text1').text('면허 종류를 선택해주세요');
			$('#license-type').addClass('error');
		} else {
			// 면허 종류가 선택되었으면 에러 메시지 숨김
			$('#erorr-form1').hide();
			$('#license-type').removeClass('error');

		}
	});

	// 면허번호 유효성
	$('#number').on('input', function() {
		var inputValue = $('#number').val();
		var validRegex = /^[가-힣0-9]{12}$/;

		if (validRegex.test(inputValue)) {
			$('#erorr-form2').hide();
			$('#license-no').removeClass('error');
		} else {
			$('#erorr-form2	').show();
			$('#erorr-text2').text('면허번호를 입력해주세요.');
			$('#license-no').addClass('error');

		}
	});

	//발급 일자 유효성
	$('#issue-date').on('input', function() {
		var inputValue = $('#isDate').val();
		var dateRegex = /^[0-9]{4}(0[1-9]|1[0-2])(0[1-9]|[12][0-9]|3[01])$/; // YYYYMMDD 형식 검사 정규 표현식

		if (inputValue.length > 8) {
			// 입력값이 8자를 초과하면 잘라냄
			$('#isDate').val(inputValue.substring(0, 8));
		}
		if (!inputValue) {
			// 입력값이 없으면 에러 메시지 표시
			$('#erorr-text3').text('발급일자를 입력해주세요.');
			$('#erorr-form3').show();
			$('#issue-date').addClass('error');
		} else if (!dateRegex.test(inputValue)) {
			// 입력값이 형식에 맞지 않으면 에러 메시지 표시
			$('#erorr-text3').text('발급일자를 20200101 형식으로 입력해주세요.');
			$('#erorr-form3').show();
			$('#issue-date').addClass('error');
		} else {
			// 모든 조건을 만족하면 에러 메시지 숨김
			$('#erorr-form3').hide();
			$('#issue-date').removeClass('error');
		}
	});

	//만료일자 유효성	
	$('#expiration-date').on('input', function() {
		var inputValue = $('#exDate').val();
		var dateRegex = /^[0-9]{4}(0[1-9]|1[0-2])(0[1-9]|[12][0-9]|3[01])$/; // YYYYMMDD 형식 체크 정규식

		if (inputValue.length > 8) {
			// 입력값이 8자를 초과하면 잘라냄
			$('#exDate').val(inputValue.substring(0, 8));
		}

		if (!inputValue) {
			// 입력값이 없으면 에러 메시지 표시
			$('#erorr-text4').text('만료일자를 입력해주세요.');
			$('#erorr-form4').show();
			$('#expiration-date').addClass('error');
		} else if (!dateRegex.test(inputValue)) {
			// 입력값이 형식에 맞지 않으면 에러 메시지 표시
			$('#erorr-text4').text('만료일자를 20251231 형식으로 입력해주세요.');
			$('#erorr-form4').show();
			$('#expiration-date').addClass('error');
		} else {
			// 모든 조건을 만족하면 에러 메시지 숨김
			$('#erorr-form4').hide();
			$('#expiration-date').removeClass('error');
		}
	});

	// 체크 박스

	// 'Total Agree'가 클릭될 때
	$('#totalChk').click(function() {
		var isChecked = $(this).is(':checked');
		// 두 체크박스 모두 체크하거나 해제
		$('#agree01, #agree02').prop('checked', isChecked);
	});

	// 개별 체크박스가 클릭될 때
	$('#agree01, #agree02').click(function() {
		// 두 체크박스가 모두 체크되었는지 확인
		var allChecked = $('#agree01').is(':checked') && $('#agree02').is(':checked');
		// 'Total Agree' 체크박스 상태 업데이트
		$('#totalChk').prop('checked', allChecked);
	});

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
		var allChecked = $('#agree01').is(':checked') && $('#agree02').is(':checked');
		// 'Total Agree' 체크박스 상태 업데이트
		$('#totalChk').prop('checked', allChecked);

	})

	//view2 선택 버튼
	$('#view2').click(function() {
		$('#view2-modal').show();
		$('body').css('overflow', 'hidden');

	})
	$('#vie2-close').click(function() {
		$('#view2-modal').hide();
		$('body').css('overflow', 'visible');

	})
	$('#view2-ok').click(function() {
		$('#view2-modal').hide();
		$('body').css('overflow', 'visible');
		$('#agree02').prop('checked', true);
		var allChecked = $('#agree01').is(':checked') && $('#agree02').is(':checked');
		// 'Total Agree' 체크박스 상태 업데이트
		$('#totalChk').prop('checked', allChecked);

	})
	// 다음버튼 클릭 이벤트
	$('#next-button').click(function() {
		var userId = $('#userId').val();
		var userPassword = $('#userPassword').val();
		var userName = $('#userName').val();
		var userPhone = $('#userPhone').val();
		var userAddress1 = $('#userAddress1').val();
		var userAddress2 = $('#userAddress2').val();
		var userAddress3 = $('#userAddress3').val();
		var licenseType = $('select').val();
		var licenseNumber = $('#number').val();
		var issueDate = $('#isDate').val();
		var expirationDate = $('#exDate').val();

		// 동적으로 폼 생성
		var form = $('<form></form>');
		form.attr("method", "post");
		form.attr("action", "/paymentReg.do");

		// 폼 필드 추가
		form.append($('<input>').attr('type', 'hidden').attr('name', 'userId').attr('value', userId));
		form.append($('<input>').attr('type', 'hidden').attr('name', 'userPassword').attr('value', userPassword));
		form.append($('<input>').attr('type', 'hidden').attr('name', 'userName').attr('value', userName));
		form.append($('<input>').attr('type', 'hidden').attr('name', 'userPhone').attr('value', userPhone));
		form.append($('<input>').attr('type', 'hidden').attr('name', 'userAddress1').attr('value', userAddress1));
		form.append($('<input>').attr('type', 'hidden').attr('name', 'userAddress2').attr('value', userAddress2));
		form.append($('<input>').attr('type', 'hidden').attr('name', 'userAddress3').attr('value', userAddress3));
		form.append($('<input>').attr('type', 'hidden').attr('name', 'licenseType').attr('value', licenseType));
		form.append($('<input>').attr('type', 'hidden').attr('name', 'licenseNumber').attr('value', licenseNumber));
		form.append($('<input>').attr('type', 'hidden').attr('name', 'issueDate').attr('value', issueDate));
		form.append($('<input>').attr('type', 'hidden').attr('name', 'expirationDate').attr('value', expirationDate));

		// 폼 제출
		$(document.body).append(form);
		form.submit();
	});
	function updateNextButtonState() {
		var allFieldsFilled =
			$('select').val() &&
			$('#number').val() && $('#isDate').val() && $('#exDate').val() &&
			$('#agree01').is(':checked') && $('#agree02').is(':checked');

		if (allFieldsFilled) {
			$('#next-button').removeClass('disabled').prop('disabled', false);
		} else {
			$('#next-button').addClass('disabled').prop('disabled', true);
		}
	}
	// 모든 입력 필드와 체크박스의 변경 이벤트에 함수 연결
	$('input, select, #agree01, #agree02').change(updateNextButtonState);


});	//end


