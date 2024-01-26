<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<script type="text/javascript" src="/js/car/carList.js?ver=20231116"></script>
<script type="text/javascript" src="/js/common/sideBar/branchSideBar.js?ver=20231116"></script>



</head>

<body style="overflow: visible;">
	<div id="root" style="height: 100%">
		<div class="pc_wrap">
			<div class="wrap main_wrap">
				<jsp:include page="/WEB-INF/views/common/header.jsp" />
				<div class="container">
					<div class="inner">
						<div class="contents">
							<div class="banner_hot">
								<div class="test">
									<ul class="banner_slider">
										<li><a href="#"><img src="https://homepage.skcarrental.com/pc_assets/img/etc/@banner_hot_01.png?20230830" alt="제주 럭셔리 차박 빈손으로 떠나자"></a></li>
									</ul>
								</div>
							</div>
							<!-- 차량 리스트 -->
							<c:forEach items="${carList}" var="carLists">
								<div class="dill_box_type">
									<div class="dill_box_wrap">
										<div class="top_cont">
											<div class="main_ctext">
												<img src="${carLists.imageMarkPath }" alt="${carLists.carMake }" class="car_logo"> <span class="car_enter">${carLists.carMake }</span> <em class="c_prd_name">${carLists.carModel }</em>
											</div>
											<div class="img_area">
												<img src="${carLists.imageCarPath}" alt="">
											</div>
										</div>
										<ul class="dill_list_box">
											<li class="list_item" data-value="2300000000229_0"><a class="dill_list">
													<div class="car_name">
														<p class="main_name">${carLists.carName}</p>
														<span class="sb_text">${carLists.carYear}년식 · ${carLists.carSeatCount}인승</span>
													</div>
													<div class="price_wrap">
														<div class="price_info">
															<div class="rate_box">${carLists.dcTitle}</div>
															<div class="price_num">
																<span class="price_regular">${carLists.carPrice}원</span> <span class="price_sale"></span> <em class="rate">${carLists.dcNo}%</em>
															</div>
														</div>
														<div class="btn_group">
															<form action="/carDetail.do" method="get">
																<button id="reservationBtn" class="btn type01">예약</button>
																<input type="hidden" name="carNo" id="carNo" value="${carLists.carNo}"> <input type="hidden" name="date" id="date" value="${date}"> <input type="hidden" name="branch" id="branch" value="${branch}">
															</form>
														</div>
													</div>
											</a></li>
										</ul>
									</div>
								</div>
							</c:forEach>
						</div>

						<div id="resultSideBar" class="sidebar">
							<div id="sideScroll" class="inner scroll_p">
								<div class="res_form">
									<h2 class="title">선택한 여정</h2>
									<div class="cont">
										<a class="ico_place">${branch }
											<button class="btn_edit">수정</button>
										</a>
									</div>
									<div class="cont">
										<a class="ico_date">${date}
											<button class="btn_edit">수정</button>
										</a>
									</div>
									<div class="btn_group">
										<button class="btn type02">재검색</button>
									</div>
								</div>
								<button class="btn btn_filter">필터적용</button>
							</div>
						</div>
						<div id="branchSideBar" style="display: none;" class="sidebar">
							<jsp:include page="../car/branchSideBar.jsp"/>	
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