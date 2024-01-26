<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<script type="text/javascript" src="/js/common/sidebar.js?ver=20231116"></script>

</head>
<body>
	<div class="inner scroll_p" id="sideScroll" style="max-height: 562px;">
		<div class="res_form">
			<div class="cont">
				<a id="localBtn" class="ico_place" style="cursor: default;">${branchVo.branchName}</a>
			</div>
			<div class="cont">
				<a class="ico_date">${rentalDate}${rentalTime} ~ ${returnDate}${returnTime} </a>
			</div>
			<div class="cont">
				<a class="ico_car">모든 차량<i class="ico_reset"></i></a>
				<div class="carousel">
					<ul class="btn_option_wrap small">
						<li class="on"><a>전체</a></li>
						<li class=""><a>전기차</a></li>
						<li class=""><a>수입전기차</a></li>
						<li class=""><a>경형/소형</a></li>
						<li class=""><a>중형/대형</a></li>
						<li class=""><a>SUV</a></li>
						<li class=""><a>승합</a></li>
						<li class=""><a>수입</a></li>
					</ul>
				</div>
			</div>
			<div class="btn_group">
				
				<form id="vehicleForm" action="/carList.do" method="get" style="display:none;">
				<button type="submit" id="carSelectBtn" class="btn type01">차량 조회하고 예약하기</button>
				    <input type="hidden" name="branch" id="formBranch" value="${branchVo.branchName}">
				    <input type="hidden" name="rentalDate" id="rentalDate" value="${rentalDate}">
				    <input type="hidden" name="rentalTime" id="rentalTime" value="${rentalTime}">
				    <input type="hidden" name="returnDate" id="returnDate" value="${returnDate}">
				    <input type="hidden" name="returnTime" id="returnTime" value="${returnTime}">
				    <input type="hidden" name="returnTime" id="returnTime" value="${returnTime}">
				</form>
			</div>
		</div>
	</div>

</body>
</html>