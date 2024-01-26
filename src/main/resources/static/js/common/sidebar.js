$(document).ready(function() {

	console.log("사이드바 js 호출");

	//지점 선택 클릭 시
	$('#localBtn').click(function() {
		$('#sideBar').hide();
		$('#locationSidebar').show();
	});

	// 닫기 클릭 시
	$('#localCloseBtn').click(function() {
		console.log("닫기 클릭");
		$('#sideBar').show();
		$('#locationSidebar').hide();
		$('.que').removeClass('on');
		$('.anw').hide();
		$('#search').val('');
	});

	$('.que').click(function() {
		// 현재 클릭된 .que 엘리먼트
		var current = $(this);
		var regionNo = current.data('region-no'); // 클릭된 .que의 데이터에서 지역 코드(regionNo) 검색

		// 현재 클릭된 .que가 이미 활성화된 상태인지 확인
		var isActive = current.hasClass('on');

		// 모든 .que 엘리먼트에서 'on' 클래스 제거하고 모든 .anw 엘리먼트 숨기기
		$('.que').removeClass('on');
		$('.anw').hide();

		if (isActive) {
			// 이미 활성화된 .que 엘리먼트를 클릭한 경우, 'on' 클래스 제거하고 해당 .anw 숨기기
			current.removeClass('on');
			current.next('.anw').hide();
		} else {
			// 다른 .que 엘리먼트를 클릭한 경우, 'on' 클래스 추가
			current.addClass('on');

			// AJAX 요청을 통해 지역별 지점 정보 가져오기
			$.ajax({
				url: '/getBranches', // 서버 엔드포인트 URL 설정
				type: 'GET',
				data: { regionNo: regionNo },
				success: function(response) {
					// AJAX 응답으로 .anw 엘리먼트의 내용 업데이트 및 표시
					current.next('.anw').html(response).show();
				},
				error: function(xhr, status, error) {
					// AJAX 요청 실패 시 오류 메시지 출력
					console.error('지점 정보 검색 오류:', error);
				}
			});
		}
	});


	// 검색창에 키 입력이 있을 때마다 이 함수가 실행됨

	$('#search').on('keyup', function() {
		var searchQuery = $('#search').val();

		$.ajax({
			url: '/searchBranches',
			type: 'GET',
			data: { searchQuery: searchQuery },
			success: function(response) {
				// 검색 결과로 DOM 업데이트
				
				
				
				
			},
			error: function() {
				// 오류 처리
				
				
			}
		});
	});



	/*

	
		// 검색창에 키 입력이 있을 때마다 이 함수가 실행됨
		$('#search').on('keyup', function() {
			var searchQuery = $('#search').val();
	
			// 검색창에 입력된 값이 없을 경우
			if (searchQuery.length === 0) {
				// 기존 상태로 돌아가기
				$('.accordion_wrap').show();
				$('#no_result').remove();
				$('#result').remove();
				$('.icons').html('<a class="icon_search_m"><span class="blind">검색</span></a>');
			} else {
				// 검색창에 값이 있을 경우, 아이콘을 '모두 지우기'로 변경
				$('.icons').html('<a class="icon_cancel_m"><span class="blind">모두 지우기</span></a>');
				// AJAX를 통해 서버에 검색 요청
				$.ajax({
					url: '/search',
					type: 'GET',
					data: { query: searchQuery },
					success: function(response) {
						console.log("Success", response);
						displaySearchResults(response);
					},
					error: function() {
						// 오류 처리
					}
				});
			}
		});
	
		// '모두 지우기' 아이콘 클릭 시
		$(document).on('click', '.icon_cancel_m', function() {
			// 검색창을 비우고 기존 상태로 복귀
			$('#search').val('');
			$('.accordion_wrap').show();
			$('#no_result').remove();
			$('#result').remove();
			$('.icons').html('<a class="icon_search_m"><span class="blind">검색</span></a>');
		});
	
	
	
	
	
		// 검색 결과를 화면에 표시하는 함수
		function displaySearchResults(results) {
			var searchQuery = $('#search').val();
			console.log("Search Results:", results);
	
			// 검색 결과가 없는 경우
			if (results.length === 0) {
				// 검색 결과가 없으면 메시지 표시
				if ($('#no_result').length === 0) {
					var noResultsDiv = $('<div id="no_result" class="spot_result_wrap no_result"><dl><dt>검색 결과가 없습니다</dt><dd>다시 검색해 주세요</dd></dl></div>').show();
					$('.heading_wrap').after(noResultsDiv);
				}
				$('.accordion_wrap').hide();
			} else {
				// 검색 결과가 있는 경우
				// 이전의 결과 또는 메시지 제거
				$('#no_result').remove();
				$('#result').remove();
				// 검색 결과를 담을 div 생성
				var resultsDiv = $('<div id="result" class="spot_result_wrap"></div>');
				// 검색 결과 제목 추가
				var resultsTitle = $('<p class="result_title">검색결과 <em>' + results.length + '</em>곳</p>');
				// 검색 결과 목록 추가
				var resultList = $('<ul class="result_list"></ul>');
	
				// 각 검색 결과에 대해 목록 항목 생성
				results.forEach(function(result) {
					if (typeof result.branchNo !== 'undefined') {
						// 정상적으로 결과 처리
					} else {
						console.error('결과에 대한 지점 번호가 undefined입니다', result);
					}
					var highlightedBranchName = result.branchName.replace(new RegExp(searchQuery, "gi"), function(match) {
						return "<mark>" + match + "</mark>";
					});
					var listItem = $('<li><div class="navi_rtext ico_map_org" style="cursor: pointer;"><p><em><em>' + highlightedBranchName + '</em></em></p></div><div class="navi_map_link"><a href="#" class="branchDetail" data-branch-no="' + result.branchNo + '">상세</a></div>');
					resultList.append(listItem);
				});
	
				// 결과 제목과 목록을 resultsDiv에 추가하고, 이를 heading_wrap 뒤에 삽입
				resultsDiv.append(resultsTitle).append(resultList);
				$('.heading_wrap').after(resultsDiv);
			}
		}
	
		// 지역 번호에 따른 지점 정보를 가져오는 함수
		function fetchBranches(regionNo) {
			// AJAX를 통해 서버로부터 지점 정보 요청
			$.ajax({
				url: '/getBranches', // 요청 URL
				type: 'GET', // HTTP 요청 방식
				data: { regionNo: regionNo }, // 요청 파라미터
				success: function(response) {
					// 요청 성공 시 실행될 함수
					var htmlContent = '';
					response.forEach(function(branch) {
						// 받아온 각 지점 정보에 대한 HTML 생성
						htmlContent += '<li>';
						htmlContent += '<div class="navi_rtext ico_map_org" style="cursor: pointer;">';
						htmlContent += '<p>' + branch.branchName + '</p>';
						if (branch.stationName) {
							htmlContent += '<span>' + branch.stationName + '</span>';
						}
						htmlContent += '</div>';
						// 각 지점 상세 정보 페이지로의 링크 추가
						htmlContent += '<div class="navi_map_link"><a href="#" class="branchDetail" data-branch-no="' + branch.branchNo + '">상세</a></div>';
						htmlContent += '</li>';
					});
					// 생성된 HTML을 DOM에 삽입
					$('.navi_map_group').html('<ul class="navi_map_group">' + htmlContent + '</ul>');
				},
	
				error: function(error) {
					// 요청 실패 시 실행될 함수
					console.log('Error fetching branches:', error);
				}
			});
		}
	
		// 지점 상세 링크 클릭 이벤트 리스너
		$(document).on('click', '.branchDetail', function(e) {
			e.preventDefault(); // 기본 링크 동작 방지
			e.stopPropagation(); // 이벤트가 DOM 트리로 전파되는 것을 방지
			var branchNo = $(this).data('branch-no'); // data-branch-no 속성에서 지점 번호 가져오기
			// 해당 지점의 상세 정보를 가져오는 함수 호출
			fetchBranchDetail(branchNo);
			// 결과 목록 숨기기
			$('#result').hide();
	
		});
	
		// 지점 상세 정보를 가져오는 함수
		function fetchBranchDetail(branchNo) {
			// AJAX를 통해 서버로부터 지점 상세 정보 요청
			$.ajax({
				url: '/getBranchDetail/' + branchNo, // 요청 URL
				type: 'GET', // HTTP 요청 방식
				data: { branchNo: branchNo }, // 요청 파라미터
				success: function(response) {
					console.log(response)
					$('#no_result').hide();
					$('#result').hide();
					// 메인으로 보낼 지점 번호
					$('#selectDestination').data('branch-no', response.branchNo);
	
	
					// 요청 성공 시 실행될 함수
					//주소 상세주소 
					var branchAddress = response.branchAddress1;
					if (response.branchAddress2) {
						branchAddress += ' ' + response.branchAddress2;
					}
	
					//전화번호
					var formattedPhone = formatPhoneNumber(response.branchPhon);
	
	
	
					$('.spot_title h4').text(response.branchName);
					$('.spot_title span').text(response.branchStation);
					$('#branchNo').val(response.branchNo);
					$('.spot_text_sb .left_txt span').eq(0).text(branchAddress);
					$('.spot_text_sb .left_txt span').eq(2).text(formattedPhone);
					$('.spot_text_sb dl dd').first().text(response.branchRenta);
					$('.spot_text_sb dl dd').eq(1).text(response.branchReturn);
	
					// 관련 div 표시 및 숨기기
					$("#mapBar").show();
					$("#localBar").hide();
					$('#sideScroll').hide();
				},
				error: function(error) {
					// 요청 실패 시 실행될 함수
					console.log('Error fetching branch detail:', error);
				}
			});
		}
	
		// 지점상세 닫기 클릭
		$('#branchCloseBtn').click(function() {
			$("#localBar").show();
			$('#sideScroll').hide();
			$("#mapBar").hide();
		})
	
	
		// 목적지 선택 이벤트 
		$('#selectDestination').on('click', function() {
			var branchNo = $('#branchNo').val();
	
			$.ajax({
				url: '/calendar',
				type: 'GET',
				data: { branchNo: branchNo },
				success: function(response) {
					$('#calendar').html(response).show();
					$("#mapBar").hide();
					$("#localBar").hide();
					$('#sideScroll').hide();
				},
				error: function(xhr, status, error) {
					// Handle any errors
					console.error("Error: " + error);
					console.error("Status: " + status);
					console.error("Response: " + xhr.responseText);
				}
			});
		});
	
		// '전체'를 제외한 다른 리스트 항목 클릭 이벤트
		$('.btn_option_wrap li a').click(function() {
			// 클릭된 항목의 부모 요소에 'on' 클래스 토글
			$(this).parent().toggleClass('on');
	
			// '전체' 항목의 'on' 클래스 제거
			$('.btn_option_wrap li:first').removeClass('on');
	
			// 'on' 클래스가 있는 항목의 수 계산 (전체 제외)
			var selectedCount = $('.btn_option_wrap li.on').length;
	
			// 선택된 항목 수에 따라 텍스트 변경
			$('.ico_car').html(selectedCount + '개 선택<i class="ico_reset"></i>');
			console.log('클릭 : ' + selectedCount);
		});
	
		// '전체' 클릭 이벤트
		$('.btn_option_wrap li:first a').click(function() {
			// 모든 'on' 클래스 제거
			$('.btn_option_wrap li').removeClass('on');
	
			// '전체'에만 'on' 클래스 추가
			$('.btn_option_wrap li:first').addClass('on');
	
			// 텍스트를 '전체 차량'으로 변경
			$('.ico_car').html('모든 차량<i class="ico_reset"></i>');
		});
	
	
	
		// 리셋 아이콘 클릭 이벤트
		$(document).on('click', '.ico_reset', function() {
			console.log("클릭");
			// 모든 목록 항목에서 'on' 클래스 제거
			$('.btn_option_wrap li').removeClass('on');
			// 'All' 항목을 'on'으로 설정
			$('.btn_option_wrap li:first').addClass('on');
			$('.ico_car').html('모든 차량<i class="ico_reset"></i>');
			// 'ico_car' 요소의 텍스트를 "All vehicles"로 초기화
		});
	
	
	
	
	
	
	*/





}); //end

/*// 휴대폰 번호 포멧
function formatPhoneNumber(phone) {
	if (phone.length === 10) {
		return phone.replace(/(\d{2})(\d{4})(\d{4})/, '$1-$2-$3');
	} else if (phone.length === 9) {
		return phone.replace(/(\d{2})(\d{3})(\d{4})/, '$1-$2-$3');
	}
	return phone;
}*/

