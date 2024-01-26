$(document).ready(function() {

	//아이디 비밀번호 클릭 시
	$('#idPwBtn').click(function() {
		$('body').css('overflow', 'hidden');
		$('#verificationMoal').show();
	});
	//아이디 비밀번호 클릭 시
	$('#verificationMoalClose').click(function() {
		$('body').css('overflow', 'visible');
		$('#verificationMoal').hide();
	});

	// 이름과 전화번호 입력 필드에 대한 input 이벤트 핸들러
	$('#nameInput, #phoneInput').on('input', function() {
		// 이름과 전화번호 값을 가져옴
		var name = $('#nameInput').val().trim();
		var phone = $('#phoneInput').val().trim();

		// 전화번호 유효성 검사 (숫자만, 길이 10 또는 11)
		var phoneRegex = /^[0-9]{11}$/;

		if (name !== '' && phoneRegex.test(phone)) {
			// 이름과 전화번호가 모두 유효한 경우 버튼 활성화
			$('#findBtn').removeClass('disabled').prop('disabled', false);
			console.log("버튼 활성화");
		} else {
			// 하나라도 유효하지 않은 경우 버튼 비활성화
			$('#findBtn').addClass('disabled').prop('disabled', true);
			console.log("버튼 비활성화");
		}
	});

	//비밀번호 찾기
	$('#findBtn').click(function() {
		// 이름과 전화번호 값을 가져옴
		var name = $('#nameInput').val().trim();
		var phone = $('#phoneInput').val().trim();
		console.log(name)
		console.log(phone)

		// AJAX 요청으로 서버에 회원 정보 확인
		$.ajax({
			url: '/checkMember', // 서버의 URL
			type: 'GET',
			data: {
				userName: name,
				userPhone: phone
			},
			success: function(response) {
				if (response === 'success' ) {
					window.location.href ="/find.do";
				} 
				if(response === 'fail'){
					alert("일치하는 회원정보가 없습니다.");
				}


			},
			error: function(xhr, status, error) {
				// 오류 처리
				console.log('Error:', error);
			}
		});
	});

	// 입력 필드에 입력이 있을 때 경고 메시지를 지우는 기능
	$('#id, #password').on('input', function() {
		$(this).next('.valid_box').find('.txt').text('');
	});
	// 로그인 버튼 클릭 이벤트
	$('#login').on('click', loginButtonClick);

	// 회원가입 클릭 시
	$('#signupLink').click(function() {
		$('body').css('overflow', 'hidden');
		$('#signupModal').show();
	});

	// joinModel 닫기 클릭 이벤트
	$('.btn_close').click(function() {
		$('body').css('overflow', 'visible');
		$('#signupModal').hide();
	});
	// joinButton 클릭 이벤트
	$('#joinButton').click(function() {
		/* window.location.href = '/clickWrap.do'; */
		$('#phone-modal').show();
	});
	// joinButton 닫기 클릭 이벤트
	$('#btnClose').click(function() {
		$('#phone-modal').hide();
		// 모든 입력 필드 초기화
		$('#userName').val('');
		$('#user_phon').val('');
		$('#phonCheckNo').val('');
		$('#userName-form').removeClass('error');
		// 모든 에러 메시지 숨기기
		$('#error1').hide();
		$('#error2').hide();
		$('#error3').hide();

		// 버튼 비활성화
		$('#sendPhoneButton').addClass('disabled').prop('disabled', true);
		$('#join-button').addClass('disabled').prop('disabled', true);
	});

	// 'userName' 필드에 대한 입력 이벤트 핸들러
	$('#userName').on('input', function() {
		var userName = $(this).val().trim();

		// 영어와 한글만 입력 허용 (정규식 사용)
		var nameRegex = /^[가-힣a-zA-Z\s]+$/;

		if (!userName) {
			// 이름이 입력되지 않은 경우
			$('#error1').show();
			$('#error1-text').text('성함을 입력해주세요.');
			$('#userName-form').addClass('error');
		} else if (!nameRegex.test(userName)) {
			// 영어나 한글이 아닌 다른 문자가 입력된 경우
			$('#error1').show();
			$('#error1-text').text('영어와 한글만 입력 가능합니다.');
			$('#userName-form').addClass('error');
		} else {
			// 유효한 이름인 경우
			$('#error1').hide();
			$('#userName-form').removeClass('error');
		}
	});
	/*
	
		});*/
	$('#user_phon').on('input', function() {
		var phoneNumber = $('#user_phon').val();
		// 숫자가 아닌 문자 제거
		var filteredNumber = phoneNumber.replace(/[^0-9]/g, '');
		$(this).val(filteredNumber);

		// 전화번호 정규식 (10자리 또는 11자리 숫자)
		var phoneRegex = /^[0-9]{11}$/;
		if (phoneRegex.test(filteredNumber)) {
			// 데이터베이스에서 전화번호가 존재하는지 확인
			$.ajax({
				url: '/check-phone', // 전화번호 중복 확인을 위한 서버 엔드포인트
				type: 'GET',
				data: { phone: filteredNumber },
				success: function(response) {
					if (response.exists) {
						// 전화번호가 이미 존재하면 오류 표시
						$('#sendPhoneButton').addClass('disabled').prop('disabled', true);
						$('#error2').show();
						$('#error2-text').text('이미 등록된 전화번호입니다.');
					} else {
						// 전화번호가 존재하지 않으면 버튼 활성화
						$('#sendPhoneButton').removeClass('disabled').prop('disabled', false);
						$('#error2').hide();
					}
				},
				error: function(xhr, status, error) {
					console.log('전화번호 확인 중 오류 발생: ', error);
				}
			});
		} else {
			// 전화번호가 유효하지 않으면 버튼 비활성화 및 오류 메시지 표시
			$('#sendPhoneButton').addClass('disabled').prop('disabled', true);
			$('#error2').show();
			$('#error2-text').text('‘-’ 없이 11자리 숫자만 입력해주세요.');
		}
	});
	// 전역 변수로 서버에서 받은 인증번호를 저장할 변수 선언
	var serverCode;
	// "전화번호 전송" 버튼 클릭 이벤트 핸들러
	$('#sendPhoneButton').click(function() {
		if (!$('#sendPhoneButton').hasClass('disabled')) {
			var phoneNumber = $('#user_phon').val().trim();

			// AJAX 요청을 사용하여 서버로 전화번호 전송
			$.ajax({
				url: '/sendSMS.dox', // 서버의 URL
				type: 'POST',
				data: { userPhon: phoneNumber },
				success: function(response) {
					serverCode = response;
					$('#sendPhoneButton').addClass('disabled').prop('disabled', true);
					alert('인증번호 : ' + response);
				},
				error: function(xhr, status, error) {
				}
			});
		}
	});

	// 인증번호 입력 이벤트 핸들러
	$('#phonCheckNo').on('input', function() {
		var inputCode = $('#phonCheckNo').val();
		// 숫자가 아닌 문자 제거
		var modifiedInputCode = inputCode.replace(/[^0-9]/g, '');
		$('#phonCheckNo').val(modifiedInputCode);

		console.log("입력된 인증번호: " + modifiedInputCode);
		console.log("서버에서 받은 인증번호: " + serverCode);

		// 인증번호 길이 및 일치 여부 확인
		if (modifiedInputCode.length === 6 && modifiedInputCode === serverCode) {
			// 인증번호가 6자리이고 서버에서 받은 번호와 일치할 경우
			$('#error3').hide();
			$('#join-button').addClass('disabled').prop('disabled', true);

		} else {
			// 유효하지 않은 경우 에러 메시지 표시
			$('#join-button').removeClass('disabled').prop('disabled', false);
			$('#error3').show();
			$('#error3-text').text('유효하지 않은 인증번호입니다.');
		}
	});

	// 각 입력 필드의 이벤트 핸들러에서 'updateButtonState' 함수 호출
	$('#userName, #user_phon, #phonCheckNo').on('input', function() {
		updateButtonState();
	});

	function updateButtonState() {
		var isNameValid = $('#userName').val().trim().length > 0 && /^[가-힣a-zA-Z\s]+$/.test($('#userName').val().trim());
		var isPhoneValid = /^[0-9]{11}$/.test($('#user_phon').val().trim());
		var isCodeValid = $('#phonCheckNo').val().trim().length === 6 && $('#phonCheckNo').val().trim() === serverCode;

		if (isNameValid && isPhoneValid && isCodeValid) {
			$('#join-button').removeClass('disabled').prop('disabled', false);
		} else {
			$('#join-button').addClass('disabled').prop('disabled', true);
		}

	}
	// 다음버튼 클릭 시 이벤트
	$('#join-button').click(function() {
		var userName = $('#userName').val();
		var userPhone = $('#user_phon').val();
		var form = $('<form></form>');
		form.attr("method", "post");
		form.attr("action", "/clickWrap.do");

		// 폼 필드 추가
		form.append($('<input>').attr('type', 'userName').attr('name', 'userName').attr('value', userName));
		form.append($('<input>').attr('type', 'userPhone').attr('name', 'userPhone').attr('value', userPhone));

		// 폼 제출
		$(document.body).append(form);
		form.submit();
	});






}); // end


function loginButtonClick() {
	var id = $('#id').val().trim();
	var password = $('#password').val().trim();

	// ID 입력 필드 검사
	if (id === '') {
		$('#id').next('.valid_box').find('.txt').text('아이디를 입력해주세요.');
		$('#id').focus();
		return false;
	}

	// 비밀번호 입력 필드 검사
	if (password === '') {
		$('#password').next('.valid_box').find('.txt').text('비밀번호를 입력해주세요.');
		$('#password').focus();
		return false;
	}

	// AJAX를 이용한 로그인 요청
	$.ajax({
		url: '/login.dox',
		type: 'POST',
		data: {
			userId: id,
			userPassword: password
		},
		success: function(response) {
			if (response === 'success') {
				window.location.href = '/main.do';
			} else if (response === 'deactivated') {
				alert('회원탈퇴한 계정입니다.');
			} else {
				$('#loginModal').show();
				setTimeout(function() {
					$('#loginModal').hide();
				}, 3000);
			}
		},
		error: function(xhr, status, error) {
		}
	});
}



