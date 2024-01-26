$(document).ready(function() {
	console.log("find호출");

	$('#newPwBtn').click(function() {
		$('body').css('overflow', 'hidden');
		$('#pwfindModal').show();
	})


	// 새 비밀번호와 비밀번호 확인 입력란에 입력 이벤트 핸들러 추가
	$('#newPwd, #newPwdChk').on('input', function() {
		var newPwd = $('#newPwd').val();
		var newPwdChk = $('#newPwdChk').val();

		// 비밀번호 검증을 위한 정규 표현식 (영문자, 숫자, 특수문자 포함 10~20자)
		var passwordRegex = /^(?=.*[!@#$%^&*()_+])[A-Za-z0-9!@#$%^&*()_+]{10,20}$/;

		// 두 비밀번호가 일치하고 정규 표현식 조건을 만족하는지 검사
		if (newPwd.match(passwordRegex) && newPwd === newPwdChk) {
			// 조건을 만족하면 버튼 활성화
			$('#changeBtn').removeClass('disabled').prop('disabled', false);
			$('#errorForm2, #errorForm3').hide();
			$('#changeBtn').text('변경하기');
			console.log("비밀번호가 정규식 조건을 만족하고 일치합니다."); // 성공 로그

		} else {
			// 조건을 만족하지 않으면 버튼 비활성화 및 에러 메시지 표시
			$('#changeBtn').addClass('disabled').prop('disabled', true);

			// 구체적인 에러 메시지 표시
			if (!newPwd.match(passwordRegex)) {
				$('#errorForm2').show();
				$('#errorText2').text('비밀번호가 요구 조건을 만족하지 않습니다.');

			} else {
				$('#errorForm2').hide();
			}

			if (newPwd !== newPwdChk) {
				$('#errorForm3').show();
				$('#errorText3').text('비밀번호가 일치하지 않습니다.');

			} else {
				$('#errorForm3').hide();
			}
		}
	});
	
	// 변경하기 클릭 시 
	$('#changeBtn').click(function(){
		
		var newPwd = $('#newPwd').val();
	   $.ajax({
                url: '/changePassword', 
                type: 'POST',
                data: {
                    'newPassword': newPwd
                },
                success: function(response) {
                    alert('성공');
                    window.location.href="/main.do";
                    
                },
                error: function(xhr, status, error) {
                }
			
			
		})		
	})
	
	// 닫기 버튼 클릭 핸들러
	$('#pwChBtn').click(function() {
		$('body').css('overflow', 'visible');
		$('#pwfindModal').hide();
		// 닫을 때 폼 필드 초기화 및 에러 메시지 숨김
		$('#newPwd, #newPwdChk').val('');
		$('#errorForm2, #errorForm3').hide();
		$('#changeBtn').addClass('disabled').prop('disabled', true);
		$('#changeBtn').text('새로운 비밀번호를 입력해 주세요');
	});


}) // end