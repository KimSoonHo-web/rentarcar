<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<script type="text/javascript" src="/js/car/detail/carDetail.js?ver=20231116"></script>
<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4b3351d7fc8d65a1ae74dd71863b2831"></script> -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4b3351d7fc8d65a1ae74dd71863b2831&libraries=services"></script>


</head>
<body>
<body style="overflow: visible;">
	<div id="root" style="height: 100%">
		<div class="pc_wrap">
			<div class="wrap main_wrap">
				<jsp:include page="/WEB-INF/views/common/header.jsp" />
				<div class="container">
					<div class="inner">
						<div class="contents">
							<div class="title_wrap">
								<h2 class="title_30 mb0">차량상세</h2>
							</div>
							<div class="top_product">
								<div class="img_area">
									<img src="${carDetail.imageCarPath}" alt="">
								</div>
								<div class="product_box">
									<p class="car_logo">
										<img src="${carDetail.imageMarkPath}" alt="쉐보레">
									</p>
									<div class="brand_info">
										<h2>
											${carDetail.carMake}<strong> ${carDetail.carModel}</strong>
										</h2>
										<p class="sub_title">${carDetail.carName}</p>
									</div>
								</div>
								<ul class="spec_list">
									<li><p class="ico">
											<img src="https://homepage.skcarrental.com/assets/img/contents/ico_oil.png" alt="">
										</p>
										<p class="sbj">연료</p>
										<p class="obj">${carDetail.otFuel}
									<li><p class="ico">
											<img src="https://homepage.skcarrental.com/assets/img/contents/ico_persons.png" alt="">
										</p>
										<p class="sbj">승차인원</p>
										<p class="obj">
											${carDetail.carSeatCount} <em> 명</em>
										</p></li>
									<li><p class="ico">
											<img src="https://homepage.skcarrental.com/assets/img/contents/ico_car_year.png" alt="">
										</p>
										<p class="sbj">연식</p>
										<p class="obj">${carDetail.carYear }</p></li>
									<li><p class="ico">
											<img src="https://homepage.skcarrental.com/assets/img/contents/ico_driverAge21.png" alt="">
										</p>
										<p class="sbj">운전자나이</p>
										<p class="obj">
											<em>만 </em>${carDetail.otAge}<em> 세 이상</em>
										</p></li>
									<li><p class="ico">
											<img src="https://homepage.skcarrental.com/assets/img/contents/ico_driverEx1.png" alt="">
										</p>
										<p class="sbj">운전경력</p>
										<p class="obj">
											${carDetail.otCareer}<em> 년 이상</em>
										</p></li>
								</ul>
							</div>
							<div class="detail_info user_review_box" style="margin-top: 32px;">
								<div class="detail_info__tit">
									<p class="title_20">이용자 리뷰</p>
									<p class="title_14">고객들은 이런 경험을 했어요</p>
								</div>
								<div class="more_btn">
									<a>더보기</a>
								</div>
								<!-- 리뷰 테이블  -->
								<div class="chips_list">구현중</div>
							</div>
							<div class="detail_info" style="margin-top: 32px;">
								<div class="detail_info__tit">
									<p class="title_20">차량옵션</p>
								</div>
								<div class="option_box">
									<ul>
										<li><div class="option_list">
												<img src="https://homepage.skcarrental.com/pc_assets/img/contents/ico_camera_24x24.png" alt="">
												<div class="option_txt">
													<p>${carDetail.otText1}·${carDetail.otText2}</p>
												</div>
											</div></li>
									</ul>
								</div>
							</div>
							<div class="detail_info" style="margin-top: 32px;">
								<div class="detail_info__tit">
									<p class="title_20">적재공간</p>
									<span class="s_txt">정보제공: MYSQL</span>
								</div>
								<div class="option_box">
									<ul>
										<li class="space_list"><div class="option_list">
												<img src="https://homepage.skcarrental.com/assets/img/common/ico_goldbag_32x32.png" alt="골프백 이미지">
												<div class="option_txt">
													<p>골프백</p>
													<span>가로 42cm · 세로 129cm 기준</span>
												</div>
											</div>
											<div class="right_txt">
												<p>${carDetail.otGolfbag}개</p>
											</div></li>
										<li class="space_list"><div class="option_list">
												<img src="https://homepage.skcarrental.com/pc_assets/img/contents/ico_stroller_32x32.png" alt="유모차 이미지">
												<div class="option_txt">
													<p>유모차</p>
												</div>
											</div>
											<div class="right_txt">
												<p>${carDetail.otStroller}</p>
											</div></li>
									</ul>
								</div>
							</div>
							<div class="detail_info" style="margin-top: 32px;">
								<div class="detail_info__tit">
									<p class="title_20">인수 및 반납장소</p>
									<span class="s_txt">정보제공: 카카오 지도</span>
								</div>
								<!-- 카카오 지도  -->
								<div class="navy_box">
									<div class="navy_wrap">
										<div id="react-naver-map" tabindex="0" style="width: 100%; height: 190px; position: relative; overflow: hidden; background: rgb(248, 249, 250);"></div>
										<div class="navy_txt">
											<h4 class="point_name">${carDetail.branchName}</h4>
											<ul class="spot_text_sb">
												<li>
													<dl>
														<dt>주소</dt>
														<dd>
															${carDetail.branchAddress1} ${carDetail.branchAddress2}
															<div class="right_btn">
																<a>카카오 지도로 보기</a>
															</div>
														</dd>
													</dl>
												</li>
												<li>
													<dl>
														<dt>전화</dt>
														<dd>${carDetail.branchPhon}</dd>
													</dl>
												</li>
												<li>
													<dl>
														<dt>이용 가능한 시간</dt>
														<dd>인수 ${carDetail.branchRenta}</dd>
														<dd>반납 ${carDetail.branchReturn}</dd>
													</dl>
												</li>
											</ul>
											<hr class="small">
											<div class="rule_info">
												<p class="title">인수 및 반납 규정</p>
												<ul class="dot_list">
													<li>인수 및 반납은 지점별 이용 가능한 시간 내 가능해요</li>
													<li>예약자(제1운전자) 뿐 아니라 사전에 등록된 제2운전자와 제3운전자도 인수 및 반납이 가능해요</li>
													<li>차량 인수 시, 운전면허 지참은 필수예요(도로교통법상 유효한 운전면허 소지자)</li>
												</ul>
											</div>
										</div>
									</div>
									<div class="detail_info noti_wrap" style="margin-top: 32px;">
										<div class="detail_info__tit">
											<p class="title_16 mb0">유의사항</p>
										</div>
										<div class="info_txt">
											<ul class="dot_list">
												<li><div class="notice_box">이미지와 실제 차량은 사양 및 색상이 다를 수 있어요</div></li>
												<li><div class="notice_box">100% 금연차량으로 운영하고 있어요</div></li>
												<li><div class="notice_box">
														<span class="list_txt">반려동물은 같이 탈 수 없어요</span>
														<button class="question_mark">
															<span class="blind">도움말</span>
														</button>
													</div></li>
												<li><div class="notice_box">
														<span class="list_txt">낚시용품을 실을 수 없어요</span>
														<button class="question_mark">
															<span class="blind">도움말</span>
														</button>
													</div></li>
											</ul>
										</div>
									</div>
									<div class="detail_info" style="margin-top: 32px;">
										<div class="detail_info__tit mask">
											<p class="title_16">COVID-19 방역 안내</p>
										</div>
										<p class="info_txt">SK렌터카는 COVID-19 감염 예방을 위해 전 차량 항균 소독하고 있습니다.</p>
									</div>
								</div>
							</div>
							<div class="btn_group single">
								<a href="javascript:window.history.back();" class="btn">목록으로 돌아가기</a>
							</div>
							<!-- 모달 -->
							<div id="no_member_modal" style="display: none;" class="layerPopup small bg_white">
								<div class="layerPopup_wrap">
									<div class="login_banner">
										<button id="no_member_close" class="btn_close">
											<img src="https://homepage.skcarrental.com/pc_assets/img/common/ico_close_w_24x24.png" alt="닫기">
										</button>
										<img src="https://homepage.skcarrental.com/pc_assets/img/etc/@banner_login_sale.png" alt="회원으로 예약하면 40-60% 무조건 할인!">
										<div class="btn_group btn_login_induce" style="margin-top: 245px; text-align: center;">
											<a class="btn type01">회원예약으로 할인받기</a><a class="btn_non_member">본인 인증하고 비회원 예약하기</a>
										</div>
										<form name="reqPCCForm" method="post" action="">
											<input type="hidden" name="reqInfo" value=""><input type="hidden" name="retUrl" value=""><input type="hidden" name="verSion" value="2">
										</form>
									</div>
								</div>
							</div>
							<!--  -->
						</div>
						<div class="sidebar">
							<div id="sideScroll" class="inner scroll_p">
								<div class="rental_area">
									<ul class="rental_sel">
										<li class="place">${carDetail.branchName}</li>
										<li class="date">${date }</li>
										<li class="brand">${carDetail.carName}</li>
									</ul>
									<div class="rental_price">
										<div class="sale">
											<span class="sale_price">회원 할인가</span> <span id="price_sale" class="price"></span> <span id="rate" class="sale_rate">${carDetail.dcNo}%</span>
										</div>
										<div class="default">
											<span class="default_price">표준가</span> <span id="price_regular" class="price">${carDetail.carPrice}</span>
										</div>
									</div>
										<div class="btn_group type01 multy">
									<c:if test="${empty sessionScope.userInfo}">
											<button id="no_member_btn" class="btn type03">비회원 예약</button>
											<button id="price_sale_btn" class="btn type01">으로 예약하기</button>
									</c:if>
										</div>
											<div class="btn_group type01">
										<form action="/reservation.do" method="get">
											<c:if test="${not empty sessionScope.userInfo}">
												<button type="submit" id="price_sale_btn" class="btn type01">으로 예약하기</button>
												<input type="hidden" name="carNo" id="carNo" value="${carDetail.carNo}">
												<input type="hidden" name="date" id="date" value="${date}">
											</c:if>
										</form>
									</div>
								</div>
							</div>
						</div>
						<jsp:include page="/WEB-INF/views/common/chatTop.jsp" />
					</div>
					<div class="footer_wrap">
						<jsp:include page="/WEB-INF/views/common/footer.jsp" />
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>