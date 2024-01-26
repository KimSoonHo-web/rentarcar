$(document).ready(function() {
	// 버튼 상태를 업데이트하는 함수
	function updateButtonState() {
		// 'agree01'과 'agree02' 체크박스가 모두 선택되었는지 확인
		var areAllRequiredChecked = $('#agree01').is(':checked') && $('#agree02').is(':checked');
		if (areAllRequiredChecked) {
			// 두 체크박스 모두 선택되었다면 버튼 활성화
			$('#agreeCompleteBtn').removeClass('disabled').prop('disabled', false);
		} else {
			// 아니면 버튼 비활성화
			$('#agreeCompleteBtn').addClass('disabled').prop('disabled', true);
		}
	}

	// '전체 동의' 체크박스에 대한 핸들러 제거 (다른 체크박스에 영향을 주지 않도록)
	$('#totalChk').click(function() {
		$('.agree_list input[type="checkbox"]').prop('checked', $(this).is(':checked'));
		updateButtonState();
	});

	// '.agree_list' 내 체크박스 클릭 이벤트
	$('.agree_list input[type="checkbox"]').click(function() {
		// 모든 체크박스가 선택되었는지 확인
		var allChecked = $('.agree_list input[type="checkbox"]').length === $('.agree_list input[type="checkbox"]:checked').length;
		$('#totalChk').prop('checked', allChecked);
		updateButtonState();
	});

	// 페이지 로드 시 초기 버튼 상태 설정
	updateButtonState();



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
		updateButtonState()
	})
	//view2 선택 버튼
	$('#view2').click(function() {
		$('#view2-modal').show();
		$('body').css('overflow', 'hidden');

	})
	$('#view2-close').click(function() {
		$('#view2-modal').hide();
		$('body').css('overflow', 'visible');

	})
	$('#view2-ok').click(function() {
		$('#view2-modal').hide();
		$('body').css('overflow', 'visible');
		$('#agree02').prop('checked', true);
		updateButtonState()
	})
	//view3 선택 버튼
	$('#view3').click(function() {
		$('#view3-modal').show();
		$('body').css('overflow', 'hidden');

	})
	$('#view3-close').click(function() {
		$('#view3-modal').hide();
		$('body').css('overflow', 'visible');

	})
	$('#view3-ok').click(function() {
		$('#view3-modal').hide();
		$('body').css('overflow', 'visible');
		$('#prsnInfoPeriod').prop('checked', true);
	})
	//view3 선택 버튼
	$('#view4').click(function() {
		$('#view4-modal').show();
		$('body').css('overflow', 'hidden');

	})
	$('#view4-close').click(function() {
		$('#view4-modal').hide();
		$('body').css('overflow', 'visible');

	})
	$('#view4-ok').click(function() {
		$('#view4-modal').hide();
		$('body').css('overflow', 'visible');
		$('#mktAgree').prop('checked', true);
	})

	// 동의 완료 버튼 클릭 이벤트
	$('#agreeCompleteBtn').click(function() {
		$('body').css('overflow', 'hidden');
		$('#join-modal').show();
	});
	// 조인 모달 닫기 버튼 클릭 이벤트
	$('#btnClose').click(function() {
		$('body').css('overflow', 'visible');
		$('#join-modal').hide();
		$('#error2').hide();
		$('#error3').hide();
		$('#pw-form').removeClass('error');
		$('#pwck-form').removeClass('error');
		$('#error1').hide();
		$('#id-form').removeClass('error');

	});


	//로그인 유효성 검사
	$('#id').on('input', idValidation);
	// 패스워드, 패스워드 확인
	$('#password, #passwordCheck').on('input', validatePassword);

	// 다음버튼 클릭 시 이벤트
	$('#join-button').click(function() {
		var userName = $('#userName').val();
		var userPhone = $('#userPhone').val();
		var userId = $('#id').val();
		var userPassword = $('#password').val();
		var form = $('<form></form>');
		form.attr("method", "post");
		form.attr("action", "/address.do");

		// 폼 필드 추가
		form.append($('<input>').attr('type', 'userName').attr('name', 'userName').attr('value', userName));
		form.append($('<input>').attr('type', 'userPhone').attr('name', 'userPhone').attr('value', userPhone));
		form.append($('<input>').attr('type', 'userId').attr('name', 'userId').attr('value', userId));
		form.append($('<input>').attr('type', 'userPassword').attr('name', 'userPassword').attr('value', userPassword));

		// 폼 제출
		$(document.body).append(form);
		form.submit();
	});


}); //end


var isIdValid = false;
var isPasswordValid = false;



//아이디 유효성검사
function idValidation() {
	var id = $('#id').val();
	var regex = /^[a-zA-Z0-9]{4,20}$/; // 4~20자의 영문자 및 숫자만 허용하는 정규식

	if (id.length >= 4) {
		checkIdAvailability(id); // ID 중복 검사 함수 호출
		isIdValid = false;
		updateButtonState();

	}
	if (id === '') {
		$('#error1').show();
		$('#error1-text').text('아이디를 입력해주세요.');
		$('#id-form').addClass('error');
		isIdValid = false;
		updateButtonState();


	} else if (!regex.test(id)) {
		$('#error1').show(); $('#error1').show();
		$('#error1-text').text('아이디는 4~20자의 영문자 및 숫자를 포함해야 합니다.');
		$('#id-form').addClass('error');
		isIdValid = false;
		updateButtonState();

	} else {
		$('#error1').hide();
		$('#id-form').removeClass('error');
		isIdValid = true;
		updateButtonState();
	}
}


// 아이디 중복 체크
function checkIdAvailability(id) {
	$.ajax({
		url: '/check-id', // 서버 URL
		type: 'POST',
		data: { userId: id },
		success: function(isDuplicate) {
			if (!isDuplicate) {
				$('#error1').hide();
				$('#id-form').removeClass('error');
			} else {
				$('#error1').show();
				$('#error1-text').text('이미 사용 중인 ID입니다.');
				$('#error-Icon').show();
				$('#id-form').addClass('error');
				isIdValid = false;
				updateButtonState();

			}
		},
		error: function() {
			$('#error1').show();
			$('#error1-text').text('ID 사용 가능 여부를 확인하는 중 오류가 발생했습니다.');
			$('#id-form').addClass('error');
			isIdValid = false;
			updateButtonState();

		}
	});
}

// 패스워드 유효성 검사
function validatePassword() {
	var password = $('#password').val();
	var passwordCheck = $('#passwordCheck').val();
	var passwordRegex = /^(?=.*[!@#$%^&*()_+])[A-Za-z0-9!@#$%^&*()_+]{10,20}$/; // 적어도 하나의 특수문자를 포함하는 10~20자리의 영문, 숫자, 특수문자

	// 비밀번호 입력 여부 확인
	if (password === '') {
		$('#error2').show();
		$('#error2-text').text('비밀번호를 입력해주세요.');
		$('#pw-form').addClass('error');
		isPasswordValid = false;
		updateButtonState();

	}
	// 비밀번호 형식 확인
	else if (!passwordRegex.test(password)) {
		$('#error2').show();
		$('#error2-text').text('비밀번호는 10~20자의 영문, 숫자, 특수문자를 포함해야 하며, 적어도 하나의 특수문자 (!@#$%^&+=)를 사용해야 합니다.');
		$('#pw-form').addClass('error');
		isPasswordValid = false;
		updateButtonState();


	}
	// 비밀번호 일치 여부 확인
	else if (password !== passwordCheck) {
		$('#pw-form').removeClass('error');
		$('#error2').hide();
		$('#error3').show();
		$('#error3-text').text('입력한 비밀번호가 일치하지 않습니다.');
		$('#pwck-form').addClass('error');
		isPasswordValid = false;
		updateButtonState();


	}
	// 모든 검사 통과
	else {
		$('#error2').hide();
		$('#error3').hide();
		$('#pw-form').removeClass('error');
		$('#pwck-form').removeClass('error');
		isPasswordValid = true;
		updateButtonState();


	}
}

function updateButtonState() {
	if (isIdValid && isPasswordValid) {
		$('#join-button').prop('disabled', false);
		$('#join-button').removeClass('disabled');
		$('#join-button').text('다음');
	} else {
		$('#join-button').prop('disabled', true);
		$('#join-button').addClass('disabled');
		$('#join-button').addClass('아이디와 비밀번호를 입력해주세요');
	}
}
