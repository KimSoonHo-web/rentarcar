<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/component/component.css">
<link rel="stylesheet" href="/css/component/component2.css">
<link rel="stylesheet" href="/css/reset/reset.css">
<link rel="stylesheet" href="/css/main/main.css">
<link rel="stylesheet" href="/css/common/common.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/js/mypage/mypage.js?ver=20231122"></script>

</head>
<body style="overflow: visible;">
	<div id="root" style="height: 100%">
		<div class="pc_wrap">
			<div class="wrap sub_wrap">
				<jsp:include page="/WEB-INF/views/common/header.jsp" />
				<div class="container">
					<div class="inner">
						<div class="contents">
							<div class="title_wrap">
								<h2 class="title_30">마이페이지</h2>
							</div>
							<div class="sub_cont">
								<div class="profile_cont">
									<div class="txt">
										<p class="name">
											<strong>${userInfo.userName }님 </strong>안녕하세요!
										</p>
										<p class="desc">언제나, 어디서나 SK 렌터카와 함께해 주세요</p>
									</div>
									<button id="myInfoBtn" class="link_btn">내 정보 관리</button>
								</div>
							</div>
							<div class="sub_cont">
								<div class="title_wrap">
									<p class="title_18">나의 단기렌트</p>
									<a class="moreview">전체보기</a>
								</div>
								<div class="car_info_box" style="cursor: pointer;">
									<div class="car_info__txt">
										<p class="reservation_num" style="display: flex;">
											예약번호<span aria-live="polite" aria-busy="true"><span class="react-loading-skeleton" style="margin-left: 5px; width: 5rem;">‌</span><br></span>
										</p>
										<p class="title_18">
											<span aria-live="polite" aria-busy="true"><span class="react-loading-skeleton">‌</span><br></span>
										</p>
										<p class="date">
											<span aria-live="polite" aria-busy="true"><span class="react-loading-skeleton">‌</span><br></span>
										</p>
										<p class="company">
											<span aria-live="polite" aria-busy="true"><span class="react-loading-skeleton">‌</span><br></span>
										</p>
									</div>
									<span class="photo"></span>
								</div>
								<ul class="flex_box_row row2">
									<li><a target="_blank" class="white_box border"><div class="down_list_info link_type">
												<dl>
													<dt>나의 쿠폰/상품권</dt>
													<dd>가지고 계신 쿠폰을 확인해 보세요</dd>
												</dl>
											</div></a></li>
									<li><a target="_blank" class="white_box border"><div class="down_list_info link_type">
												<dl>
													<dt>1:1 문의 내역</dt>
													<dd>정확한 답변으로 안내해 드릴게요</dd>
												</dl>
											</div></a></li>
								</ul>
							</div>
							<div class="sub_cont">
								<div class="title_wrap">
									<p class="title_18">나의 장기렌트</p>
								</div>
								<a target="_blank" class="white_box"><figure class="row_cards">
										<img src="https://homepage.skcarrental.com/pc_assets/img/contents/main_b05.jpg" alt="">
										<figcaption>
											<p class="title_16">스마트케어</p>
											<p class="title_14">계약부터 장비까지 스마트 케어로 관리해 보세요</p>
										</figcaption>
									</figure></a>
							</div>
						</div>
						<div class="sidebar">
							<div id="sideScroll" class="inner">
								<jsp:include page="../mypage/fillterWrap.jsp"/>
							</div>
						</div>
						<jsp:include page="/WEB-INF/views/common/chatTop.jsp" />

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