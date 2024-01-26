<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<script type="text/javascript" src="/js/common/sidebar.js?ver=20231116"></script>
</head>
<body>
	<div id="sideBar" class="sidebar" style="top: -440px;">
		<div class="inner scroll_p" id="sideScroll" style="max-height: 562px;">
			<div class="res_form">
				<div class="cont">
					<a id="localBtn" class="ico_place" style="cursor: default;">지점을 선택해주세요</a>
				</div>
				<div class="cont">
					<a class="ico_date">기간을 선택해주세요</a>
				</div>
				<div class="cont">
					<a class="ico_car">모든 차량<i class="ico_reset"></i></a>
				</div>
				<div class="btn_group">
					<button class="btn type01">차량 조회하고 예약하기</button>
				</div>
			</div>
		</div>
	</div>

	<!--  -->
	<div id="locationSidebar" class="sidebar" style="top: -440px; display: none;">
		<div id="sideScroll" class="inner" style="max-height: 562px;">
			<div class="side_pop">
				<div class="heading_wrap">
					<h2 class="heading">어디로 갈까요?</h2>
					<a id="localCloseBtn" class="btn_close"> <span class="blind">닫기</span>
					</a>

					<div class="search_input">
						<input id="search" type="text" placeholder="지역, 지점명을 검색해 보세요" value="">
						<div class="icons">
							<a class="icon_search_m"> <span class="blind">검색</span>
							</a>
						</div>
					</div>
				</div>

				<!-- 지역 리스트 -->
				<div class="select_list_wrap">
					<jsp:include page="../sideBar/regionalList.jsp" />
				</div>
				<!-- 검색 결과 있으면 -->
				<div id="searchResults" style="display:none;" class="spot_result_wrap">
					<jsp:include page="../sideBar/search/brancSearchPage.jsp" />
				</div>
				<!-- 검색 결과 없으면 -->
				<div id="noResult" style="display:none;" class="spot_result_wrap no_result">
					<jsp:include page="../sideBar/search/noResult.jsp" />
				</div>
			</div>
		</div>
	</div>
</body>
</html>