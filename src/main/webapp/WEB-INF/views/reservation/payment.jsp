<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/js/reservation/payment.js?ver=20231207"></script>
</head>
<body>
	<div class="container">
		<div class="inner">
			<div class="contents">
				<div class="title_wrap">
					<h2 class="title_30">결제</h2>
					<ul class="step_wrap">
						<li class="">예약</li>
						<li class="on">결제</li>
						<li class="">완료</li>
					</ul>
				</div>
				<p class="title_24">
					<span>예약 내용을 꼼꼼히 확인하시고</span><br> 결제를 진행해 주세요
				</p>
				<p class="title_18 mt40">쿠폰/상품권</p>
				<div class="sub_cont pay_coupon_wrap">
					<div class="inner">
						<div class="title_wrap">
							<p class="title_16" style="display: flex;">
								<i><img src="https://homepage.skcarrental.com/pc_assets/img/contents/ico_coupon.png" alt=""></i>보유 쿠폰 0개
							</p>
							<a class="moreview">구현중</a>
						</div>
					</div>
				</div>
				<p class="title_18 mt60">결제방법</p>
				<div class="sub_cont">
					<ul class="cards_pay_list">
						<li>
						<span class="chk_box">
							<input type="radio" id="radios00" name="radioDefault" readonly="" value="BIKYskb000012m2311221525365060" checked="">
							<label for="radios00">
								<span class="left">
									<strong class="name">
										<i>
											<img src="https://homepage.skcarrental.com/pc_assets/img/contents/ico_card_20x20.png" alt="">
										</i>${cardInfo.cardPw }
									</strong>
									<span class="num"> · ${cardInfo.cardNo } · ${cardInfo.cardClsNm }</span>
								</span>
							</label>
						</span>
						<span class="right">
							<span class="badge">대표</span>
						</span>
						</li>
						<li>
							<span class="chk_box">
								<input type="radio" id="radios01" name="radioDefault" readonly="" value="card">
								<label for="radios01">
									<span class="left">
										<strong class="name">
											<i>
												<img src="https://homepage.skcarrental.com/pc_assets/img/contents/ico_card_20x20.png" alt="">
											</i>신용 · 체크카드
										</strong>
										<span class="num"></span>
									</span>
								</label>
							</span>
						</li>
						<li>
							<span class="chk_box">
								<input type="radio" id="radios02" name="radioDefault" readonly="" value="naver">
								<label for="radios02">
									<span class="left">
										<strong class="name">
											<i>
												<img src="https://homepage.skcarrental.com/pc_assets/img/contents/ico_naver_20x20.png" alt="">
											</i>네이버페이
										</strong>
										<span class="num"></span>
									</span>
								</label>
							</span>
						</li>
						<li>
							<span class="chk_box">
								<input type="radio" id="radios03" name="radioDefault" readonly="" value="kakao">
								<label for="radios03">
									<span class="left">
										<strong class="name">
											<i>
												<img src="https://homepage.skcarrental.com/pc_assets/img/contents/ico_kakao_20x20.png" alt="">
											</i>카카오페이
										</strong>
										<span class="num"></span>
									</span>
								</label>
							</span>
						</li>
					</ul>
					
					<div class="ex_txt">
						<p>결제수단 등록은 ‘마이페이지 &gt; 내 정보 관리 &gt; 결제수단관리’에서 가능합니다.</p>
					</div>
				</div>
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
										<i><img src="https://homepage.skcarrental.com/assets/img/contents/ico_journey02.png" alt=""></i>${date }
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
						<div class="side_box journey_wrap">
							<div>
								<p class="tit">운전자</p>
								<dl>
									<dt>
										<i><img src="/pc_assets/img/contents/ico_use_step05.png" alt=""></i>${userInfo.userName }
									</dt>
									<dd>${licensInfo.licenseType } · ${cardInfo.idNo }</dd>
								</dl>
							</div>
						</div>
						<div class="side_box pay_wrap">
							<p class="tit">결제내역</p>
							<ul class="pay_list">
								<li><span>표준가</span><span id="priceRegular">${priceRegular }</span></li>
							</ul>
							<ul class="pay_list">
								<li><span>보험료</span><span id="insurancePremium">${insurancePremium }</span></li>
							</ul>
							<ul class="pay_list">
								<li><span>할인금액</span><span id="memberDiscount" class="txt_orange">${memberDiscount }</span></li>
							</ul>
							<ul class="pay_list total">
								<li><span>총 결제금액</span><span id="totalPayment"> ${totalPayment }</span></li>
								<li class="desc">항목별 합계금액 원 단위 절상 또는 절사</li>
							</ul>
						</div>
						<div class="btn_group">
							<div class="balloon_bt_box">
								<form name="payForm" method="post" action="https://web.nicepay.co.kr/v3/webstd/js/nicepay-3.0.js">
									<input type="hidden" name="userNo" value="${cardInfo.userNo }">
									<input type="hidden" name="carNo" value="${carDetail.carNo }">
									<input type="hidden" name="branchName" value="${carDetail.branchName }">
									<input type="hidden" name="branchName" value="${carDetail.branchName }">
									<input type="hidden" name="carName" value="${carDetail.carName }">
									<input type="hidden" name="date" value="${date }">
									<button id="totalPaymentBtn" type="button" class="btn type01" formtarget="_blank">${totalPayment }</button>
									<p class="balloon_box" style="width: 200px;">이용약관에 동의 생략</p>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>