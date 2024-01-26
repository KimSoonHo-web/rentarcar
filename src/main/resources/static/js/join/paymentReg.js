$(document).ready(function() {


	// 카드 유형 검증
	$('select').change(function() {
		// 카드 유형이 선택되지 않았다면 (빈 값)
		if ($(this).val() === '') {
			console.log("값 없음");
			// 에러 메시지 div를 표시
			$('#erorr-form1').show();
			// 에러 메시지 텍스트 설정
			$('#erorr-text1').text('카드 유형을 선택해주세요');
		} else {
			console.log("값 있음");
			// 카드 유형이 선택되었다면, 에러 메시지 div를 숨김
			$('#erorr-form1').hide();
		}
	});


	// 숫자만 입력 허용하는 이벤트 핸들러
	$('#cardNo').on('input', function() {
		var cardNo = $('#cardNo').val();
		// 입력값이 숫자가 아닌 경우 제거
		var modifiedCardNo = cardNo.replace(/[^0-9]/g, '');
		$(this).val(modifiedCardNo);

		// 입력값이 2자리 이상이지만 12자리 미만일 때 에러 메시지 표시
		if (modifiedCardNo.length > 1 && modifiedCardNo.length < 12) {
			// 숫자를 더 입력하라는 에러 메시지 표시
			$('#erorr-form2').show();
			$('#erorr-text2').text('카드 번호를 확인해 주세요.');
		} else {
			// 에러 메시지 숨김
			$('#erorr-form2').hide();
		}
	});

	// 리셋 버튼 클릭 시 입력 필드 초기화
	$('#cardNo-btn-reset').click(function() {
		$('#cardNo').val('');
		$('#error-form2').hide();
	});


	//유효기간 유효성 검사
	// 만료 날짜 입력 이벤트 핸들러 (MM/YY 형식)
	$('#expDtm').on('input', function() {
		var expDtm = $(this).val();
		var modifiedExpDtm = expDtm.replace(/[^0-9]/g, ''); // 숫자가 아닌 문자 제거

		// MM (2자리 숫자) 이후에 슬래시 삽입
		if (modifiedExpDtm.length > 2) {
			modifiedExpDtm = modifiedExpDtm.substring(0, 2) + '/' + modifiedExpDtm.substring(2);
		}

		// 값 업데이트 (포맷된 문자열로)
		$(this).val(modifiedExpDtm);

		// 길이가 5가 아닌 경우 (MM/YY는 슬래시 포함 5자리) 오류 메시지 표시
		if (modifiedExpDtm.length !== 5) {
			$('#erorr-form3').show();
			$('#erorr-text3').text('유효기간을 MM/YY 형식으로 입력해 주세요.');
		} else {
			$('#erorr-form3').hide();
		}
	});


	// 리셋 버튼 클릭 시 입력 필드 초기화
	$('#expDtm-btn-reset').click(function() {
		$('#expDtm').val('');
		$('#error-form3').hide();
	});

	// 카드 비밀번호 입력 필드에 대한 이벤트 핸들러
	$('#cardPw').on('input', function() {
		var cardPw = $(this).val();
		// 입력 값이 숫자가 아닌 경우 제거
		var modifiedCardPw = cardPw.replace(/[^0-9]/g, '');
		$(this).val(modifiedCardPw);

		// 입력 값이 2자 미만인 경우 에러 메시지 표시
		if (modifiedCardPw.length < 2) {
			$('#erorr-text4').text('비밀번호 첫 두 자리를 입력해주세요.');
			$('#erorr-form4').show();
		} else {
			// 2자리 숫자가 입력된 경우 에러 메시지 숨김
			$('#erorr-form4').hide();
		}
	});
	// 생년월일 유효성 검사
	$('#idNo').on('input', function() {
		console.log("클릭")
		var idNo = $('#idNo').val();
		// 숫자만 입력 허용 (다른 문자 제거)
		var modifiedIdNo = idNo.replace(/[^0-9]/g, '');
		$(this).val(modifiedIdNo);

		// 입력값이 6자리 미만일 경우 오류 메시지 표시
		if (modifiedIdNo.length > 0 && modifiedIdNo.length < 6) {
			$('#erorr-form5').show();
			$('#erorr-text5').text('6자리 숫자를 입력해주세요.');
		} else {
			// 6자리 숫자 입력 완료시 오류 메시지 숨김
			$('#erorr-form5').hide();
		}
	});

	// 입력 필드 초기화 버튼 이벤트
	$('#idNo-btn-reset').click(function() {
		$('#idNo').val('');
		$('#erorr-form5').hide();
	});



	// 'Total Agree'가 클릭될 때
	$('#totalChk').click(function() {
		var isChecked = $(this).is(':checked');
		// 두 체크박스 모두 체크하거나 해제
		$('#agree01, #agree03').prop('checked', isChecked);
	});

	// 개별 체크박스가 클릭될 때
	$('#agree01, #agree03').click(function() {
		// 두 체크박스가 모두 체크되었는지 확인
		var allChecked = $('#agree01').is(':checked') && $('#agree03').is(':checked');
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
		var allChecked = $('#agree01').is(':checked') && $('#agree03').is(':checked');
		// 'Total Agree' 체크박스 상태 업데이트
		$('#totalChk').prop('checked', allChecked);

	})

	//view3 선택 버튼
	$('#view3').click(function() {
		$('#view3-modal').show();
		$('body').css('overflow', 'hidden');

	})
	$('#vie3-close').click(function() {
		$('#view3	-modal').hide();
		$('body').css('overflow', 'visible');

	})
	$('#view3-ok').click(function() {
		$('#view3-modal').hide();
		$('body').css('overflow', 'visible');
		$('#agree03').prop('checked', true);
		var allChecked = $('#agree01').is(':checked') && $('#agree03').is(':checked');
		// 'Total Agree' 체크박스 상태 업데이트
		$('#totalChk').prop('checked', allChecked);

	})

	function updateRegisterButtonState() {
		var isAllFieldsValid = $('#cardNo').val().length >= 12 &&
			$('#expDtm').val().length === 5 &&
			$('#cardPw').val().length === 2 &&
			$('#idNo').val().length === 6 &&
			$('#agree01').is(':checked') &&
			$('#agree03').is(':checked');

		if (isAllFieldsValid) {
			$('#register-button').removeClass('disabled').prop('disabled', false);
		} else {
			$('#register-button').addClass('disabled').prop('disabled', true);
		}
	}

	// 각 입력 필드 및 체크박스에 대한 이벤트 핸들러에 updateRegisterButtonState() 함수를 호출
	$('#cardNo, #expDtm, #cardPw, #idNo, #agree01, #agree03').on('input change', function() {
		updateRegisterButtonState();
	});


	//버튼 클릭 이벤트
	$('#skip-button').click(function() {
		$('#successful').show(); // Show the successful message
	});

	$('#next-button').click(function() {
		if (!$(this).hasClass('disabled')) {
			$('#successful').show();

		}
	});

	$('#join-button').click(function() {
		var userId = $('#userId').val();
		var userPassword = $('#userPassword').val();
		var userName = $('#userName').val();
		var userPhone = $('#userPhone').val();
		var userAddress1 = $('#userAddress1').val();
		var userAddress2 = $('#userAddress2').val();
		var userAddress3 = $('#userAddress3').val();
		var licenseType = $('#licenseType').val();
		var expirationDate = $('#expirationDate').val();
		var licenseNumber = $('#licenseNumber').val();
		var issueDate = $('#issueDate').val();
		var cardClsNm = $('#cardClsNm').val();
		var cardNo = $('#cardNo').val();
		var expDtm = $('#expDtm').val();
		var cardPw = $('#cardPw').val();
		var idNo = $('#idNo').val();

		var form = $('<form></form>');
		form.attr("method", "post");
		form.attr("action", "join.dox");

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
		form.append($('<input>').attr('type', 'hidden').attr('name', 'cardClsNm').attr('value', cardClsNm));
		form.append($('<input>').attr('type', 'hidden').attr('name', 'cardNo').attr('value', cardNo));
		form.append($('<input>').attr('type', 'hidden').attr('name', 'expDtm').attr('value', expDtm));
		form.append($('<input>').attr('type', 'hidden').attr('name', 'cardPw').attr('value', cardPw));
		form.append($('<input>').attr('type', 'hidden').attr('name', 'idNo').attr('value', idNo));

		$(document.body).append(form);
		form.submit();
	});

	function updateButtonState() {
		var cardType = $('select[name="cardClsNm"]').val();  // 카드 유형
		var cardNo = $('#cardNo').val();                    // 카드 번호
		var expDtm = $('#expDtm').val();                    // 유효 기간
		var cardPw = $('#cardPw').val();                    // 카드 비밀번호
		var idNo = $('#idNo').val();                        // 신분증 번호
		var agree01Checked = $('#agree01').is(':checked');  // 첫 번째 체크박스 확인
		var agree03Checked = $('#agree03').is(':checked');  // 두 번째 체크박스 확인

		var allFieldsFilled = cardType && cardNo && expDtm && cardPw && idNo && agree01Checked && agree03Checked;

		// 각 필드의 값을 콘솔에 출력
		console.log("Card Type: ", cardType);
		console.log("Card Number: ", cardNo);
		console.log("Expiry Date: ", expDtm);
		console.log("Card Password: ", cardPw);
		console.log("ID Number: ", idNo);
		console.log("Agree01 Checked: ", agree01Checked);
		console.log("Agree03 Checked: ", agree03Checked);
		console.log("All Fields Filled: ", allFieldsFilled);

		// 모든 필드가 채워져 있으면 버튼 활성화
		if (allFieldsFilled) {
			$('#next-button').removeClass('disabled').prop('disabled', false);
		} else {
			$('#next-button').addClass('disabled').prop('disabled', true);
		}
	}

	// 입력 필드와 체크박스에 이벤트 리스너 연결
	$('input, select').on('change input', function() {
		updateButtonState();
	});


})
