$(document).ready(function() {
	console.log("헤더 호출");
	// 마이페이지 
	$('.prof').click(function() {
		window.location.href = "/mypage.do";
	});


	//로그인 회원가입 클릭 이벤트
	$('.member').click(function() {
		window.location.href = "/login.do";
	});

	// 로그아웃 이미지 클릭 이벤트
	$('.logout').click(function() {
		$('body').css('overflow', 'hidden');
		$('#logoutModal').show();
	});
	// 로그아웃 이미지 클릭 이벤트
	$('#logout').click(function() {
		$('body').css('overflow', 'hidden');
		$('#logoutModal').show();
	});
	// 로그아웃 모달 취소
	$('#logoutCloseBtn').click(function() {
		$('body').css('overflow', 'visible');
		$('#logoutModal').hide();
	});

	/*	// 모달 로그아웃 버튼 클릭 이벤트
		$('#logoutBtn').click(function() {
			$.ajax({
				url: '/logout.dox',
				type: 'POST',
				success: function(response) {
					if (response === 'success') {
						// 헤더 콘텐츠를 새로고침하는 함수
						$.ajax({
							url: '/fetchHeaderContent',
							type: 'GET',
							success: function(response) {
								$('#header').html(response); // 헤더 부분을 새로운 내용으로 업데이트합니다.
								console.log("헤더 콘텐츠가 성공적으로 새로고침되었습니다.");
							}
						});
						$('#logoutModal').hide();
						$('#logoutSuccessModal').show();
						setTimeout(function() {
							$('#logoutSuccessModal').hide();
						}, 5000);
					}
				},
				error: function(xhr, status, error) {
					console.log("Error logging out: ", error);
					alert('로그아웃 중 문제가 발생했습니다.');
				}
			});
		});
	
	*/

	$('#logoutBtn').click(function() {
		$.ajax({
			url: '/logout.dox',
			type: 'POST',
			success: function(response) {
				if (response === 'success') {
					$('#logoutModal').hide();
					 location.reload();
					/*refreshHeader();*/



				}
			},
			error: function(xhr, status, error) {
				console.log("Error logging out: ", error);
				alert('There was a problem logging out.');
			}
		});
	});



	//마이페이지 - 내정보 관리 클릭 이벤트
	$('#myInfoBtn').click(function() {
		$('body').css('overflow', 'hidden');
		$('#pw-ok').show();
	});


	//마이페이지 - 모달 이벤트
	$('#pw').keyup(function() {
		if ($('#pw').val().trim() != '') {
			$('#pwCkBtn').prop('disabled', false).text('입력 완료');
		} else {
			$('#pwCkBtn').prop('disabled', true).text('비밀번호를 입력해주세요');
		}
	});

	$('#pwCkBtn').click(function() {
		var enteredPassword = $('#pw').val();

		$.ajax({
			url: '/checkPassword', // 서버의 엔드포인트 URL
			type: 'POST',
			data: {
				enteredPassword: enteredPassword
			},
			success: function(response) {
				// 서버로부터의 응답 처리
				if (response) {
					window.location.href = "/myDetail.do";
				} else {
					$('#pwErorrForm').show(); // 비밀번호 불일치 시 에러 메시지 표시
				}
			},
			error: function(xhr, status, error) {
				console.error('An error occurred: ' + error);
				// 사용자에게 오류 메시지 표시 (예시)
				alert('오류가 발생했습니다. 다시 시도해주세요.');
			}
		});
	});


	//마이페이지 - 내정보 관리모달 취소 
	$('#closeBtn').click(function() {
		$('body').css('overflow', 'visible');
		$('#pw-ok').hide();
	});


}); //end


function refreshHeader() {
	$.ajax({
		url: '/fetchHeaderContent',
		type: 'GET',
		success: function(response) {
			$('#header').html(response);
			console.log("Header content refreshed successfully.");
			$('#logoutSuccessModal').show();
			$('body').css('overflow', 'visible');
			setTimeout(function() {
				$('#logoutSuccessModal').hide();
			}, 3000);
		},
		error: function(xhr, status, error) {
			console.log("Error refreshing header content: ", error);
		}
	});
}

