<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	
	
		<div class="spot_btns">
			<div class="accordion_wrap">
				<p class="acc_title">전체</p>
				<c:forEach items="${regionList}" var="region">
					<!-- 상세 클릭 이벤트 -->
					<div class="que" data-region-no="${region.regionNo}">
						<span class="regi_name">${region.regionName}</span>
						<!-- 지역 배지 -->
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
					<!-- 지점 리스트 들어갈 곳 -->
					<div class="anw" style="display: none;">
						<jsp:include page="../sideBar/branchDetailSideBar.jsp" />
					</div>
				</c:forEach>
			</div>
		</div>
	
</body>
</html>