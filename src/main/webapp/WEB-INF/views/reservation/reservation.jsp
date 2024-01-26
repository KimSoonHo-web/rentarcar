<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/component/component.css">
<link rel="stylesheet" href="/css/component/component2.css">
<link rel="stylesheet" href="/css/reset/reset.css">
<link rel="stylesheet" href="/css/slick-dot/slick-dot.css">
<link rel="stylesheet" href="/css/main/main.css">
<link rel="stylesheet" href="/css/common/common.css">
<link rel="stylesheet" href="/css/calender/calender.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/js/reservation/reservation.js?ver=20231206"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


</head>
<script type="text/javascript">
	var storedValue = "${licensInfo.licenseType}"; 
	if (storedValue) {
		$('#licenseTypeSelect').val(storedValue);
	}
</script>
<body style="overflow: visible;">
	<div id="root" style="height: 100%">
		<div class="pc_wrap" style="">
			<div class="wrap sub_wrap">
				<jsp:include page="/WEB-INF/views/common/header.jsp" />
				<div class="container">
					<div class="inner">
						<div class="contents">
							<div class="title_wrap">
								<h2 class="title_30">예약</h2>
								<ul class="step_wrap">
									<li class="on">예약</li>
									<li class="">결제</li>
									<li class="">완료</li>
								</ul>
							</div>
							
							<!-- 보험  -->
							<div class="sub_cont">
								<p class="title_18">어떤 보험을 선택할까요</p>
								<span class="title_14">합리적인 가격, 마음의 평화! 안전도 즐거움도 지키세요</span>
								<div class="inner">
									<p class="title_16 major">보험 선택하기</p>
									<p class="title_14 txt_lightgray">상대방과 나를 보호하는 종합보험이 포함되어 있어요</p>
									<ul class="insur_tab horz">
										<li  data-premium="0"  class="">
											<a class="">
												<div class="tit_wrap">
													<h4 class="tit">선택안함</h4>
													<p class="ex_txt">0원 추가</p>
												</div>
												<div class="txt_wrap">
													<p class="txt">사고 시 고객부담금</p>
													<p class="btn">전액</p>
												</div>
											</a>
										</li>
										<li data-premium="48000" class="">
											<a class="">
												<div class="tit_wrap">
													<h4 class="tit">일반자차</h4>
													<p class="ex_txt">48,000원 추가</p>
												</div>
												<div class="txt_wrap">
													<p class="txt">사고 시 고객부담금</p>
													<p class="btn">30만원</p>
												</div></a></li>
										<li data-premium="51000" class="">
											<a class="type">
												<div class="tit_wrap">
													<h4 class="tit">완전자차</h4>
													<p class="ex_txt">51,000원 추가</p>
												</div>
												<div class="txt_wrap">
													<p class="txt">사고 시 고객부담금</p>
													<p class="btn">면제</p>
												</div>
											</a>
										</li>
									</ul>
									<div class="cont_btm">
										<div class="insur_link">
											<a>보장내용을 알아볼까요?</a>
										</div>
									</div>
								</div>
							</div>
							<!--  -->
							<div class="sub_cont">
								<p class="title_18">운전자(예약자) 정보를 입력해 주세요</p>
								<span class="title_14">입력한 정보는 안전하게 보호할게요</span>
								<div class="inner">
									<p class="title_16 major">기본정보</p>
									<div class="info_box mb40">
										<div class="form_row ">
											<label for="name" class="form_label">이름</label> <input id="name" type="text" placeholder="이름을 입력해주세요" value="${userInfo.userName}" disabled="">
										</div>
										<div class="form_row ">
											<label for="phone" class="form_label">휴대폰</label> <input id="phone" type="tel" placeholder="휴대폰을 입력해 주세요" value="${userInfo.userPhone}" disabled="">
										</div>

									</div>

									<p class="title_16 major">운전면허 정보</p>
									<div class="license_img">
										<img src="https://homepage.skcarrental.com/assets/img/contents/img_license.png" alt="운전면허증예시">
									</div>
									<div class="info_box">
										<div class="form_row select_box">
											<label class="form_label">면허종류</label>
											<label for=licenseType class="form_label">면허종류</label> <input id="licenseType" type="text" placeholder="면허증을 입력해주세요" value="${licensInfo.licenseType}" disabled="">
											
											<div style="display: none;" class="valid_box">
												<p class="txt">면허종류를 선택해주세요</p>
											</div>
											
										</div>
										<div class="form_row ">
											<label for="number" class="form_label">면허번호</label> <input disabled="" maxlength="12" id="number" type="text" placeholder="면허번호를 입력해주세요" value="${licensInfo.licenseNumber}">
											<div  style="display: none;" class="valid_box">
												<p class="txt">면허번호를 입력해주세요</p>
											</div>
											<div class="ex_box">
												<p class="txt">구면허증) 서울-01-123456-00 → 서울0112345600</p>
												<p class="txt">신면허증) 11-01-123456-00 → 110112345600</p>
											</div>
										</div>
										<div class="form_row ">
											<label for="isDate" class="form_label">발급일자</label> <input disabled="" maxlength="8" id="isDate" type="tel" placeholder="예) 20210101" value="${licensInfo.issueDate}">
											<div  style="display: none;" class="valid_box">
												<p class="txt">발급일자를 입력해주세요</p>
											</div>
										</div>
										<div class="form_row ">
											<label for="exDate" class="form_label">만료일자</label> <input disabled="" maxlength="8" id="exDate" type="tel" placeholder="예) 20251231" value="${licensInfo.expirationDate}">
											<div  style="display: none;" class="valid_box">
												<p class="txt">만료일자를 입력해주세요</p>
											</div>
										</div>
									</div>
									<div class="cont_btm">
										<div class="insur_link">
											<a>자세한 자격 조건이 궁금하세요?</a>
										</div>
									</div>
								</div>
							</div>
							<div class="res_ex_txt">
								<ul class="dot_list">
									<li>입력한 운전자 정보와 예약자 정보가 다를 경우 대여가 제한될 수 있어요.</li>
									<li>나이, 면허종류, 운전경력에 따라 이용 가능한 차종 및 차량이 다를 수 있어요.</li>
									<li>‘운전자 추가 등록’은 예약완료 후 ‘예약내역’ 페이지에서 추가할 수 있어요.</li>
								</ul>
							</div>
						</div>
						
						<div id="reservationModal"  style="display: none;" class="layerPopup open bg_white">
							<jsp:include page="/WEB-INF/views/modal/reservationModal.jsp" />
						</div>
						<div class="sidebar">
							<div id="sideScroll" class="inner scroll_p" style="max-height: 632px;">
								<div>
									<div class="title_wrap">
										<p class="title_18">여정 정보</p>
									</div>
									<div class="car_img">
										<img src="${carDetail.imageCarPath }" alt="">
									</div>
									<div class="side_box journey_wrap">
										<div>
											<p class="tit">${userInfo.userName}님의여정</p>
											<dl>
												<dt>
													<i><img src="https://homepage.skcarrental.com/assets/img/contents/ico_journey01.png" alt=""></i>${carDetail.branchName }
												</dt>
											</dl>
										</div>
										<div>
											<dl>
												<dt>
													<i><img src="https://homepage.skcarrental.com/assets/img/contents/ico_journey02.png" alt="">
													</i>${date }
												</dt>
											</dl>
										</div>
										<div>
											<dl>
												<dt>
													<i><img src="https://homepage.skcarrental.com/assets/img/contents/ico_journey03.png" alt=""></i>${carDetail.carName }
												</dt>
												<dd>${carDetail.carYear }년식${carDetail.otFuel }</dd>
											</dl>
										</div>
									</div>
									<div class="side_box pay_wrap">
										<p class="tit">결제내역</p>
										<ul class="pay_list">
											<li><span>표준가</span><span id="price_regular">${carDetail.carPrice }</span></li>
										</ul>
										<!-- 보험료 -->
										<ul class="pay_list">
											<li><span>보험료</span>
												<span id="insurance-premium"></span>
											</li>
										</ul>
										<!--  -->
										<ul class="pay_list">
											<li>
											<span>회원할인</span>
												<span id="deducting" class="txt_orange"></span>
											</li>
											
											<li>
												<span id="rate" style="display: none;" class="txt_orange">${carDetail.dcNo}</span>
											</li>
										</ul>
										<ul class="pay_list total">
											<li><span>총 결제금액</span>
											<span id="price_sale"></span></li>
											<li class="desc">항목별 합계금액 원 단위 절상 또는 절사</li>
										</ul>
									</div>
									<div class="btn_group">
										<div class="balloon_bt_box">
											<button id="payBtn" type="button" class="btn type01">입력완료</button>
											<p class="balloon_box" style="width: 200px;">여정 정보를 확인해주세요</p>
											<form name="payForm" method="post" action="/payForm.do">
												<input type="hidden" name="carNo" value="${carDetail.carNo}">
												<input type="hidden" name=userNo value="${userInfo.userNo}">
												<input type="hidden" name=date value="${date}">
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div>
					<div style="position: fixed; z-index: 9999; inset: 16px 16px 100px; pointer-events: none;"></div>
				</div>
				<div class="footer_wrap">
					<jsp:include page="/WEB-INF/views/common/footer.jsp" />
				</div>
			</div>
		</div>
	</div>
</body>

</html>