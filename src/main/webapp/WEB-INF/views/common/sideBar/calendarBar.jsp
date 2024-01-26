<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery 라이브러리 -->
</head>
<script>
	
</script>
<body>
	<div class="heading_wrap border_none">
		<h2 class="heading">얼마동안 빌릴까요?</h2>
		<a id="calenderCloseBtn" class="btn_close"><span class="blind">닫기</span></a>
	</div>

	<div class="fillter_wrap">


		<div class="time_sel" style="position: relative; z-index: 100;">
			<p>
				조회기간을 선택해주세요~
				 <input type="text" id="datepicker1">
				 <input type="text" id="datepicker2">
			</p>
		</div>
		<!-- 시간 -->
		<div class="time_sel" style="position: relative; z-index: 100;">
			<div class="time_filed">
				<div class="select_box">
					<label class="form_label">대여시간</label> <select id="rentalTime" class="rental">
						<option value="">대여시간 선택</option>
						<!-- jQuery를 통해 옵션들이 여기에 삽입됩니다 -->
					</select>
				</div>
				<div class="select_box">
					<label class="form_label">대여시간</label> <select id="returnTime" class="return">
						<option value="">반환시간 선택</option>
						<!-- jQuery를 통해 옵션들이 여기에 삽입됩니다 -->
					</select>
				</div>
			</div>
		</div>


		<div class="btn_group multy type01" style="position: relative; z-index: 100;">
			<button id="calendarCancelBtn" class="btn type04">취소</button>
			<button id="selectSchedule" class="btn type01">일정 선택완료</button>
		</div>
	</div>

</body>
<script>

$(document).ready(function() {

	// 날짜 및 시간 선택기의 값이 변경될 때마다 버튼의 활성화 상태를 체크
	$('#datepicker1, #datepicker2, #rentalTime, #returnTime').on('change', function() {
		var date1 = $('#datepicker1').val();
		var date2 = $('#datepicker2').val();
		var time1 = $('#rentalTime').val();
		var time2 = $('#returnTime').val();

		// 모든 필드에 값이 있는지 확인
		if (date1 && date2 && time1 && time2) {
			$('#selectSchedule').removeAttr('disabled');
		} else {
			$('#selectSchedule').attr('disabled', 'disabled');
		}
	});

	// 일정 선택완료 클릭 이벤트
	$('#selectSchedule').click(function() {
		console.log("selectSchedule  클릭");
		var branchNo = $('#branchNo').val();
		var rentalDate = $('#datepicker1').val();
		var returnDate = $('#datepicker2').val();
		var rentalTime = $('#rentalTime').val();
		var returnTime = $('#returnTime').val();

		console.log("branchNo : ", branchNo);
		console.log("rentalDate : ", rentalDate);
		console.log("returnDate : ", returnDate);
		console.log("rentalTime : ", rentalTime);
		console.log("returnTime : ", returnTime);
			
		$.ajax({
			url: '/getUpdatesideBar',
			type: 'get',
			data:
			{branchNo: branchNo,
			rentalDate: rentalDate,
			returnDate: returnDate,
			rentalTime: rentalTime,
			returnTime: returnTime},
			success: function(updatedContent) {
				$('#sideScroll').html(updatedContent);
				$('#calendar').hide();
				$('#sideScroll').show();
				
			},
			error: function(xhr, status, error) {
				console.error(error);
			}
		});
	});

	
	// 대여 날짜 선택기 초기화
	$("#datepicker1").datepicker({
	    dateFormat: 'yy-mm-dd',
	    minDate: 0,
	    onSelect: function(selectedDate) {
	        var minReturnDate = $('#datepicker1').datepicker('getDate');
	        minReturnDate.setDate(minReturnDate.getDate() + 1);
	        $("#datepicker2").datepicker("option", "minDate", minReturnDate);
	    }
	});

	// 반환 날짜 선택기 초기화
	$("#datepicker2").datepicker({
	    dateFormat: 'yy-mm-dd',
	    minDate: '+1d'
	});

	// 초기 상태를 오늘 날짜와 내일 날짜로 설정
	$("#datepicker1").datepicker('setDate', new Date());
	$("#datepicker2").datepicker('setDate', '+1d');

	// 대여 시간 선택 드롭다운 생성
	var $select = $('#rentalTime');
	for (var hour = 7; hour <= 22; hour++) {
	    for (var min = 0; min < 60; min += 30) {
	        var time = hour.toString().padStart(2, '0') + ':' + min.toString().padStart(2, '0');
	        $select.append($('<option>', {
	            value: time,
	            text: time
	        }));
	    }
	}
		// 대여 시간 선택 드롭다운 생성 및 초기 시간 설정
		var $select = $('#rentalTime');
		for (var hour = 7; hour <= 22; hour++) {
			for (var min = 0; min < 60; min += 30) {
				var time = hour.toString().padStart(2, '0') + ':'
						+ min.toString().padStart(2, '0');
				$select.append($('<option>', {
					value : time,
					text : time
				}));
			}
		}
		$select.val('11:00'); // 초기 시간을 오전 11시로 설정

		// 반환 시간 선택 드롭다운 생성 및 초기 시간 설정
		var $returnSelect = $('#returnTime');
		for (var hour = 8; hour <= 22; hour++) {
			for (var min = 0; min <= 30; min += 30) {
				var time = hour.toString().padStart(2, '0') + ':'
						+ min.toString().padStart(2, '0');
				$returnSelect.append($('<option>', {
					value : time,
					text : time
				}));
			}
		}
		$returnSelect.val('15:00'); // 초기 시간을 오후 3시(15:00)로 설정
		
		
		$('#calenderCloseBtn').click(function(){
			$('#calendar').hide();
			$('#sideScroll').show();
		})
		$('#calendarCancelBtn').click(function(){
			$('#calendar').hide();
			$('#sideScroll').show();
		})
});
	
	


</script>
</html>