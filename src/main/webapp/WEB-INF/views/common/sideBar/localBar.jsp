<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

	<div class="heading_wrap">
		<h2 class="heading">어디로 갈까요?</h2>
		<a id="localCloseBtn" class="btn_close">
			<span  class="blind">닫기</span>
		</a>
		
		<div class="search_input">
			<input id="search" type="text" placeholder="지역, 지점명을 검색해 보세요" value="">
			<div class="icons">
				<a class="icon_search_m">
					<span class="blind">검색</span>
				</a>
			</div>
		</div>
	</div>
	<div id="regionList" class="select_list_wrap">
		<div class="spot_btns">
			<div class="accordion_wrap">
				<p class="acc_title">전체</p>
				<c:forEach items="${regionList}" var="region">
				<!-- 파뀔 부분  -->
				<div class="que"  data-region-no="${region.regionNo}">
					<span class="regi_name">${region.regionName}</span>
					<!-- 지역 배찌  -->
					<c:if test="${region.regionBox1 != null}">
					<em class="regi_box">${region.regionBox1}</em>
					</c:if>
					<c:if test="${region.regionBox2 != null}">
					<em class="regi_box">${region.regionBox2}</em>
					</c:if>
					<div class="arrow-wrap">
						<span class="arrow-top"></span>
						<span class="arrow-bottom"></span>
					</div>
				</div>
				<!-- 상세지점 -->
			    <div  class="anw" style="display: none;">
				<div class="navi_map_lists">
					<div class="navi_map_wrap">
						<div class="navi_list_group">
							<p class="navi_map_title">${region.regionName}</p>
							  <!-- AJAX로 업데이트 될 부분 -->
							<ul class="navi_map_group"></ul>
						</div>
					</div>
				</div>
				</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<!--  -->
</html>