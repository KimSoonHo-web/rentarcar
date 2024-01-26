$(document).ready(function() {



	// 마이페이지 

	// 비밀번호 변경 버튼 클릭 이벤트
	$('#passwordChangeBtn').click(function() {
		$('body').css('overflow', 'hidden');
		$('#pwChange').show();
		$('#originPwd').focus();

	});
	// 비밀번호 변경 모달 닫기
	$('#pwChBtn').click(function() {
		$('body').css('overflow', 'visible');
		// 모달 숨기기
		$('#pwChange').hide();

		// 오류 메시지 숨기고, 폼의 오류 클래스 제거, 입력 필드 값 초기화
		$('.valid_box').hide(); // 모든 오류 메시지를 숨깁니다.
		$('.form_row').removeClass('error'); // 모든 폼에 적용된 오류 클래스를 제거합니다.
		$('#pwChange input[type="password"]').val(''); // 모든 비밀번호 입력 필드를 초기화합니다.
		// 비밀번호 변경 버튼 비활성화
		updateSubmitButtonStatus();


	});
	// 기존 비밀번호 유효성 검사
	$('#originPwd').on('keyup blur', function() {
		var originPwd = $('#originPwd').val().trim();
		if (originPwd === '') {
			showError('#erorrForm1', '#erroText1', '기존 비밀번호를 입력해주세요.');
			$('#originPwdForm').addClass('error');
		} else {
			$.ajax({
				url: '/checkPassword',
				type: 'POST',
				data: { enteredPassword: originPwd },
				success: function(isMatch) {
					if (isMatch) {
						hideError('#erorrForm1', '#originPwdForm');
					} else {
						showError('#erorrForm1', '#erroText1', '기존 비밀번호가 일치하지 않습니다.');
						$('#originPwdForm').addClass('error');
					}
					updateSubmitButtonStatus();
				},
				error: function(xhr, status, error) {
					console.error('An error occurred: ' + error);
					updateSubmitButtonStatus();
				}
			});
		}
	});

	// 새 비밀번호 유효성 검사
	$('#newPwd').on('keyup blur', function() {
		var newPwd = $('#newPwd').val().trim();
		var passwordRegex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{10,20}$/;

		if (newPwd === '') {
			showError('#erorrForm2', '#erroText2', '새 비밀번호를 입력해주세요.');
			$('#newPwdForm').addClass('error');
			updateSubmitButtonStatus();

		} else if (!passwordRegex.test(newPwd)) {
			showError('#erorrForm2', '#erroText2', '영문, 숫자, 특수문자 포함 10~20자 이내로 입력해주세요.');
			$('#newPwdForm').addClass('error');
			updateSubmitButtonStatus();

		} else {
			$.ajax({
				url: '/checkNewPassword',
				type: 'POST',
				data: {
					newPwd: newPwd
				},
				success: function(isDifferent) {
					if (isDifferent) {
						hideError('#erorrForm2', '#newPwdForm');
						updateSubmitButtonStatus();

					} else {
						showError('#erorrForm2', '#erroText2', '기존 비밀번호와 다른 새 비밀번호를 입력해주세요.');
						$('#newPwdForm').addClass('error');
					}
					updateSubmitButtonStatus();
				},
				error: function(xhr, status, error) {
					console.error('오류 발생: ' + error);
					updateSubmitButtonStatus();
				}
			});
		}
	});

	// 새 비밀번호 확인 유효성 검사
	$('#newPwdChk').on('keyup blur', function() {
		var newPwd = $('#newPwd').val().trim();
		var confirmNewPwd = $('#newPwdChk').val().trim();

		if (confirmNewPwd === '') {
			showError('#erorrForm3', '#erroText3', '새 비밀번호를 다시 입력해주세요.');
			$('#newPwdChkForm').addClass('error');
			updateSubmitButtonStatus();

		} else if (newPwd !== confirmNewPwd) {
			showError('#erorrForm3', '#erroText3', '새 비밀번호와 일치하지 않습니다.');
			$('#newPwdChkForm').addClass('error');
			updateSubmitButtonStatus();

		} else {
			hideError('#erorrForm3', '#newPwdChkForm');
		}
		updateSubmitButtonStatus();
	});

	//버튼 클릭 시 비밀번호 변경
	$('#chengeBtn').on('click', function() {
		var newPwd = $('#newPwd').val().trim();


		$.ajax({
			url: '/changePassword',
			type: 'POST',
			data: {
				newPassword: newPwd
			},
			success: function(response) {
				// 모달 숨기기
				$('body').css('overflow', 'visible');

				$('#pwChange').hide();

				// 오류 메시지 숨기고, 폼의 오류 클래스 제거, 입력 필드 값 초기화
				$('.valid_box').hide(); // 모든 오류 메시지를 숨깁니다.
				$('.form_row').removeClass('error'); // 모든 폼에 적용된 오류 클래스를 제거합니다.
				$('#pwChange input[type="password"]').val(''); // 모든 비밀번호 입력 필드를 초기화합니다.
				// 비밀번호 변경 버튼 비활성화
				updateSubmitButtonStatus();
				$('#pwChmodal').show();
				$('#modalText').text('비밀번호 변경이 완료 되었습니다.!!!!');
				setTimeout(function() {
					$('#pwChmodal').hide();
				}, 3000);

			},
			error: function(xhr, status, error) {
				// Handle errors
				console.error('실패: ' + error);
			}
		});
	});

	// 오류 메시지를 보여주는 함수
	function showError(errorFormSelector, errorTextSelector, errorMessage) {
		$(errorFormSelector).show();
		$(errorTextSelector).text(errorMessage);
	}

	// 오류 메시지를 숨기는 함수
	function hideError(errorFormSelector, formSelector) {
		$(errorFormSelector).hide();
		$(formSelector).removeClass('error');
	}


	// 변경 버튼 활성화 상태 업데이트 함수
	function updateSubmitButtonStatus() {
		var isOriginPwdValid = !$('#originPwdForm').hasClass('error') && $('#originPwd').val() !== '';
		var isNewPwdValid = !$('#newPwdForm').hasClass('error') && $('#newPwd').val() !== '';
		var isNewPwdChkValid = !$('#newPwdChkForm').hasClass('error') && $('#newPwdChk').val() !== '';



		if (isOriginPwdValid && isNewPwdValid && isNewPwdChkValid) {
			$('#chengeBtn').prop('disabled', false).text('입력 완료');
		} else {
			$('#chengeBtn').prop('disabled', true).text('새로운 비밀번호를 입력해 주세요');
		}

	}

	// 전화번호를 가져옵니다.
	var phone = $('#userPhone').text();

	// 정규표현식을 사용하여 전화번호 형식을 변경합니다.
	// 이 예제는 전화번호가 10자리일 경우를 가정합니다.
	var formattedPhone = phone.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');

	// 형식이 변경된 전화번호를 다시 설정합니다.
	$('#userPhone').text(formattedPhone);



	// 비밀번호 변경 버튼 클릭 이벤트
	$('#phoneChangeBtn').click(function() {
		$('body').css('overflow', 'hidden');
		$('#phone-modal').show();

	});
	// 비밀번호 변경 모달 닫기
	$('#btnClose').click(function() {
		$('body').css('overflow', 'visible');
		$('#phone-modal').hide();

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

	/*// 전화번호 입력 필드의 입력 이벤트 핸들러
	$('#user_phon').on('input', function() {
		var phoneNumber = $(this).val();
		// 숫자가 아닌 문자 제거
		var filteredNumber = phoneNumber.replace(/[^0-9]/g, '');
		$(this).val(filteredNumber);

		// 전화번호 정규 표현식 (10자리 또는 11자리 숫자)
		var phoneRegex = /^[0-9]{11}$/;

		if (phoneRegex.test(filteredNumber)) {
			// 유효한 전화번호인 경우 버튼 활성화
			$('#sendPhoneButton').removeClass('disabled').prop('disabled', false);
			$('#error2').hide();
		} else {
			// 유효하지 않은 전화번호인 경우 버튼 비활성화 및 오류 메시지 표시
			$('#sendPhoneButton').addClass('disabled').prop('disabled', true);
			$('#error2').show();
			$('#error2-text').text('‘-’ 없이 숫자만 입력해주세요.');
		}
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
		var newPhoneNumber = $('#user_phon').val();
		$.ajax({
			url: '/updatePhoneNumber',
			type: 'POST',
			data: { newPhoneNumber: newPhoneNumber },
			success: function(response) {
				var formattedPhoneNumber = formatPhoneNumber(newPhoneNumber);
				$('body').css('overflow', 'visible');
				$('#userPhone').text(formattedPhoneNumber); $('#phone-modal').hide();
				$('#pwChmodal').show();
				$('#modalText').text('휴대폰번호가 업데이트 되었습니다.!!!!');
				setTimeout(function() {
					$('#pwChmodal').hide();
				}, 3000);
			},
			error: function(xhr, status, error) {
				console.error('Error updating phone number: ' + error);
			}
		});

	});


	//주소 삭제 버튼
	$('#addressDelete').click(function() {
		$('body').css('overflow', 'hidden');
		$('#add-modal').show();
		$('#modalTitle').text('주소정보를 삭제하시겠어요?');
		$('#modalCloseBtn').text('취소');
		$('#modalBtn').text('확인');

	});

	//주소모달 닫기 버튼
	$('#modalCloseBtn').click(function() {
		$('body').css('overflow', 'visible');
		$('#add-modal').hide();
	});

	//주소모달 확인 버튼
	$('#modalBtn').click(function() {
		$.ajax({
			url: '/update-address',
			type: 'Post',
			data: {
				userAddress1: '',
				userAddress2: '',
				userAddress3: ''
			},
			success: function(response) {
				$.ajax({
					url: '/getUpdatedAddress',
					type: 'GET',
					success: function(updatedContent) {
						$('#addressContainer').html(updatedContent);
					}
				});
				$('#add-modal').hide();
				$('body').css('overflow', 'visible');
				$('#add-modal-success').show();
				$('.go3958317564').text("주소정보가 삭제 되었습니다.");
				setTimeout(function() {
					$('#add-modal-success').hide(); // 3초 후 알림 숨김
				}, 3000);
			},
			error: function(xhr, status, error) {
				// 오류 처리
				alert('주소 삭제 중 오류가 발생했습니다.');
			}
		});
	});
	//운전면허 삭제 버튼
	$('#licenseDelete').click(function() {
		$('body').css('overflow', 'hidden');
		$('#license-modal').show();
		$('#modalTitle1').text('운전면허 정보를 삭제하시겠어요?');
		$('#modalCloseBtn1').text('취소');
		$('#modalBtn1').text('확인');

	});

	//운전면허 모달 닫기 버튼
	$('#modalCloseBtn1').click(function() {
		$('body').css('overflow', 'visible');
		$('#license-modal').hide();
	});
	$('#modalBtn1').click(function() {
		$.ajax({
			url: '/delect-license',
			type: 'Post',
			success: function(response) {
				$.ajax({
					url: '/getUpdatedlicense',
					type: 'GET',
					success: function(updatedContent) {
						$('#driverLicenseContainer').html(updatedContent);
					}
				});
				$('#license-modal').hide();
				$('body').css('overflow', 'visible');
				$('#license-modal-success').show();
				$('#modalText1').text("운전면허 정보가 삭제 되었습니다.");
				setTimeout(function() {
					$('#license-modal-success').hide(); // 3초 후 알림 숨김
				}, 3000);
			}
		})
	});

	//주소변경 버튼
	/*$('#addChangeBtn').click(function() {
		console.log("클릭");
		
	});*/


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
		addupdateNextButtonState();

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
		addupdateNextButtonState();
	});

	// 다음 버튼 클릭 이벤트
	$('#next-addbutton').click(function() {
		/* var userNo = $('#userNo').val(); // 유저 번호*/
		var zipNo = $('#zipNo').val(); // 우편번호
		var addr = $('#addr').val(); // 주소
		var dtlAddr = $('#dtlAddr').val(); // 상세주소
		/*  console.log(userNo);*/
		console.log(zipNo);
		console.log(addr);
		console.log(dtlAddr);

		$.ajax({
			url: '/updateAddress', // 주소 업데이트 처리 URL
			type: 'POST',
			data: {
				/*  userNo: userNo,*/
				zipNo: zipNo,
				addr: addr,
				dtlAddr: dtlAddr
			},
			success: function(response) {
				window.location.href = '/myDetail.do';
			},
			error: function(xhr, status, error) {
				alert('주소 업데이트에 실패했습니다.');
			}
		});
	});

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
		$('#next-button').click(function() {
			var licenseType = $('#license-type select').val();
			var licenseNumber = $('#number').val();
			var issueDate = $('#isDate').val();
			var expirationDate = $('#exDate').val();

			console.log(licenseType, licenseNumber, issueDate, expirationDate);

			$.ajax({
				url: '/updatelicense',
				type: 'POST',
				data: {
					licenseType: licenseType,
					licenseNumber: licenseNumber,
					issueDate: issueDate,
					expirationDate: expirationDate
				},
				success: function(response) {
					window.location.href = '/myDetail.do';
				},
				error: function(xhr, status, error) {
				}
			});
		});
	});




	function updateNextButtonState() {
		var allFieldsFilled =
			$('select').val() &&
			$('#number').val() && $('#isDate').val() && $('#exDate').val() &&
			$('#agree01').is(':checked') && $('#agree02').is(':checked');

		if (allFieldsFilled) {
			$('#next-button').removeClass('disabled').prop('disabled', false);
			$('#next-button').text("확인");
		} else {
			$('#next-button').addClass('disabled').prop('disabled', true);
			$('#next-button').text("운전면허 정보를 입력하세요");

		}
	}
	// 모든 입력 필드와 체크박스의 변경 이벤트에 함수 연결
	$('input, select, #agree01, #agree02').change(updateNextButtonState);




	// 회원 탈퇴 버튼 클릭 시
	$('#unregisterOpenBtn').click(function() {
		$('body').css('overflow', 'hidden');
		$("#unregisterModal").show();
	})

	// 회원탈퇴 모달 닫기 버튼
	$('#unregisterCloseBtn').click(function() {
		$('body').css('overflow', 'visible');
		$("#unregisterModal").hide();
	})



	// 회원탈퇴 모달 닫기 버튼
	$('#unregisterContinueBtn').click(function() {
		$('body').css('overflow', 'visible');
		$("#unregisterModal").hide();
	})


	// 회원탈퇴 모달 체크박스 클릭 시 버튼 활성화
	$('#agree').change(function() {
		if (this.checked) {
			$('#unregisterBtn').prop('disabled', false);
		} else {
			$('#unregisterBtn').prop('disabled', true);
		}
	});

	// 회원탈퇴
	$('#unregisterBtn').click(function() {
		$.ajax({
			url: '/deactivate-account', // 백엔드 엔드포인트 URL
			type: 'POST',
			success: function(response) {
				alert("계정이 성공적으로 비활성화되었습니다.");
				window.location.href = '/login.do';
			},
			error: function(error) {
				alert("계정 비활성화 중 오류가 발생했습니다. 다시 시도해주세요.");
			}
		});
	});






});//end	


// 주소 버튼 상태
function addupdateNextButtonState() {
	var dtlAddrValue = $('#dtlAddr').val();
	var isAgree01Checked = $('#agree01').is(':checked');

	if (dtlAddrValue && isAgree01Checked) {
		$('#next-addbutton').removeClass('disabled').prop('disabled', false);
		console.log("Deactivating button and changing text to 변경하기");
		$('#next-addbutton').text('변경하기')
	} else {
		$('#next-addbutton').addClass('disabled').prop('disabled', true);
		console.log("Activating button and changing text to 주소를 입력해주세요");
		$('#next-addbutton').text('주소를 입력해주세요')

	}
}



// 휴대폰 번호 포멧
function formatPhoneNumber(number) {
	var cleaned = ('' + number).replace(/\D/g, '');
	var match = cleaned.match(/^(\d{3})(\d{4})(\d{4})$/);

	if (match) {
		return match[1] + '-' + match[2] + '-' + match[3];
	}
	return null;
}

