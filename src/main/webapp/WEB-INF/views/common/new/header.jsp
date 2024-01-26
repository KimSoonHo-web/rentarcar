<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/js/common/header.js?ver=20231122"></script>

</head>
<header id="header" class="header">
	<div class="nav_wrap">
		<div class="inner">
			<h1>
				<a href="/main.do" class="brand ">렌터카</a>
			</h1>
			<nav>
				<ul>
					<li><a>예약</a></li>
					<li><a>예약확인</a></li>
					<li><a>이용안내</a></li>
					<li><a>고객센터</a></li>
				</ul>
			</nav>
			<div class="side_menu">
				<div class="outlink">
					<a href="https://www.skcarrental.com/rent/promotion/inter_cm_counsel.do?utm_source=site_pc&utm_medium=gnbbanner&utm_campaign=english">English</a>
				</div>
				<c:if test="${empty sessionScope.userInfo}">
					<ul class="member">
						<li><a>로그인</a></li>
						<li><a>회원가입</a></li>
					</ul>
				</c:if>
				<c:if test="${not empty sessionScope.userInfo}">
					<ul class="member_a">
						<li><a>
								<div class="prof">
									<span class="txt">${userInfo.userName }님 안녕하세요</span>
								</div>
						</a></li>
						<li><a class="logout">로그아웃</a></li>
					</ul>
				</c:if>
			</div>
		</div>
	</div>
</header>
<!-- 모달 -->
<div id="logoutModal" class="layerPopup alertPopup" style="display: none;">
	<jsp:include page="/WEB-INF/views/common/logoutModal.jsp" />
</div>
<!-- 비밀번호 입력 모달 -->
<diV id="pw-ok" class="layerPopup small" style="display: none;">
	<jsp:include page="/WEB-INF/views/common/pwCkModal.jsp" />
</diV>
<!-- 로그아웃 모달 -->
<div id="logoutSuccessModal" style="display: none;">
	<jsp:include page="/WEB-INF/views/common/logoutSuccessModal.jsp" />
</div>



