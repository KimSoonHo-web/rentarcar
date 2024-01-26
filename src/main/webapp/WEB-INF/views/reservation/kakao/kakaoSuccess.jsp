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
<script type="text/javascript" src="/js/reservation/payment.js?ver=20231207"></script>
</head>
<body style="overflow: visible;">
	<div id="root" style="height: 100%">
		<div class="pc_wrap" style="">
			<div class="wrap sub_wrap">
				<jsp:include page="/WEB-INF/views/common/header.jsp" />
				<div class="container">
					<div class="inner">
						<div class="contents result_wrap" style="margin: auto;">
							<div class="sub_cont">
								<div class="inner">
									<h2 class="title_30 txt_left">
										짝짝짝!<br>${userInfo.userName }님 예약이 완료되었어요
									</h2>
									<span class="title_18 txt_left">가벼운 발걸음으로 곧 만나요!</span>
									<p class="result_img">
										<img src="${carDetail.imageCarPath}" alt="" style="width: 320px;">
									</p>
									<ul class="rv_result_list">
										<li><strong><i><img src="https://homepage.skcarrental.com/pc_assets/img/contents/ico_journey04.png" alt="">
										</i>${paymentRequest.partnerOrderId }</strong>
										<span><a>복사하기(구현중)</a></span>
										</li>
										<li><strong><i><img src="https://homepage.skcarrental.com/pc_assets/img/contents/ico_journey01.png" alt=""></i>${paymentRequest.branchName }</strong><span><a>지도보기(구현중)</a></span></li>
										<li><strong><i><img src="https://homepage.skcarrental.com/pc_assets/img/contents/ico_journey02.png" alt=""></i>${paymentRequest.date }</strong><span></span></li>
										<li><strong><i><img src="https://homepage.skcarrental.com/pc_assets/img/contents/ico_journey03.png" alt=""></i>${paymentRequest.carName }</strong></li>
									</ul>
									<div class="btn_group multy">
										<button id="homeBtn" type="button" class="btn type04">홈으로</button>
										<button id="reservationOkBtn" type="button" class="btn type01">예약확인</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="footer_wrap">
					<jsp:include page="/WEB-INF/views/common/footer.jsp" />
				</div>
			</div>
		</div>
	</div>
</body>
</html>