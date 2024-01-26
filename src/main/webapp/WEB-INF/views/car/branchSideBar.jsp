<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>

</head>
<body>
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
			<div class="select_list_wrap">
				<div class="spot_btns">

					<div class="accordion_wrap">
						<p class="acc_title">전체</p>
						<c:forEach items="${regionList}" var="region">
						<!-- 상세 클릭 이벤트 -->
							<div class="que" data-region-no="${region.regionNo}">
								<span class="regi_name">${region.regionName}</span>
								<!-- 지역 배찌  -->
								<c:if test="${region.regionBox1 != null}">
									<em class="regi_box">${region.regionBox1}</em>
								</c:if>
								<c:if test="${region.regionBox2 != null}">
									<em class="regi_box">${region.regionBox2}</em>
								</c:if>
								<div class="arrow-wrap">
									<span class="arrow-top"></span> <span class="arrow-bottom"></span>
								</div>
							</div>

							<div class="anw" style="display: none;">
								<div class="navi_map_lists">
									<div class="navi_map_wrap">
										<div class="navi_list_group">
											<p class="navi_map_title">${region.regionName}</p>
											<ul class="navi_map_group">
												<li><div class="navi_rtext ico_map_org" style="cursor: pointer;">
														<p>제주지점</p>
														<span>제주공항</span>
													</div>
													<div class="navi_map_link">
														<a>상세</a>
													</div></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
						<!--  -->
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>