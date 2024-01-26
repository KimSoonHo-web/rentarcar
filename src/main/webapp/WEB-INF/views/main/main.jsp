<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<link rel="stylesheet" href="/css/component/component.css">
<link rel="stylesheet" href="/css/component/component2.css">
<link rel="stylesheet" href="/css/reset/reset.css">
<link rel="stylesheet" href="/css/slick-dot/slick-dot.css">
<link rel="stylesheet" href="/css/main/main.css">
<link rel="stylesheet" href="/css/common/common.css">
<link rel="stylesheet" href="/css/calender/calender.css">


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/js/main/main.js?ver=20231116"></script>
</head>

<body style="overflow: visible;">
	<div id="root" style="height: 100%">
		<div class="pc_wrap">
			<div class="wrap main_wrap">
				<jsp:include page="/WEB-INF/views/common/header.jsp" />

				<div class="container">
					<!-- 스와이퍼 슬라이드 -->
					<jsp:include page="../main/visualWrap.jsp" />
					<!-- body 부분 -->
					<div class="inner">
						<jsp:include page="../main/cantents.jsp" />
						<jsp:include page="../main/sideBar/sideBar.jsp" />
						<jsp:include page="/WEB-INF/views/common/chatTop.jsp" />
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
<!-- <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 -->
 </html>
 