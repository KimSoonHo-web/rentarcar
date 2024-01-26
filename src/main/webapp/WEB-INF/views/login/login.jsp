<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/css/component/component.css">
<link rel="stylesheet" href="/css/reset/reset.css">
<link rel="stylesheet" href="/css/main/main.css">
<link rel="stylesheet" href="/css/common/common.css">
<script type="text/javascript" src="/js/login/login.js?ver=20231116"></script>

</head>
<body style="overflow: visible;">
	<div id="root" style="height: 100%">
		<div class="pc_wrap">
			<div class="wrap sub_wrap">
				<jsp:include page="/WEB-INF/views/common/header.jsp" />
				<!--  -->
				<div class="container">
					<div class="inner">
						<div class="contents" style="margin: auto; width: 850px;">
							<p class="login_tit">누구나, 모두가 SK렌터카 이제 시작해 볼까요?</p>
							<p class="login_desc">빌리카 계정으로도 이용할 수 있어요!</p>
							<div class="login_box">
								<div>
									<fieldset>
										<legend></legend>
										<div class="form_row">
											<label for="id" class="blind">아이디</label> <input id="id" type="text" placeholder="아이디를 입력해 주세요" value="">
											<div class="valid_box">
												<p class="txt"></p>
											</div>
										</div>
										<div class="form_row">
											<label for="password" class="blind">비밀번호</label> <input id="password" type="password" placeholder="비밀번호를 입력해 주세요" value="">
											<div class="valid_box">
												<p class="txt"></p>
											</div>
										</div>
										<div class="btn_group">
											<button id="login" type="button" class="btn type01">로그인</button>
										</div>
										<ul class="login_link">
											<li><a id="signupLink">회원가입</a></li>
											<li><a id="idPwBtn">아이디 찾기/비밀번호 재설정</a></li>
										</ul>
										<div class="layerPopup small" id="verificationMoal" style="display: none;">
											<jsp:include page="/WEB-INF/views/common/verificationMoal.jsp" />
										</div>
									</fieldset>
								</div>
								<div class="login_guide">
									<p class="title_20">비회원으로 예약하셨나요?</p>
									<p class="title_14 txt_lightgray">발급된 예약번호로 예약내역을 확인해 보세요</p>
									<button type="button" class="btn_confirm">비회원 예약확인</button>
								</div>

								<!-- 회원가입 모달 -->
								<div id="signupModal" style="display: none">
									<jsp:include page="/WEB-INF/views/common/joinModal.jsp" />
								</div>
							</div>
							<div class="login_easy_wrap">
								<p class="login_easy_tit">간편 로그인</p>
								<ul>
									<li><button type="button">
											<img src="https://homepage.skcarrental.com/pc_assets/img/contents/btn_kakao.png" alt="카카오로그인">
										</button></li>
									<li><button type="button">
											<img src="https://homepage.skcarrental.com/pc_assets/img/contents/btn_naver.png" alt="네이버로그인">
										</button></li>
									<li><button type="button">
											<img src="https://homepage.skcarrental.com/pc_assets/img/contents/btn_apple.png" alt="애플로그인">
										</button></li>
								</ul>
							</div>
						</div>
						<div id="phone-modal" style="display: none;" class="layerPopup small">
							<jsp:include page="/WEB-INF/views/common/phonModal.jsp" />
						</div>
					</div>
				</div>

				<!-- 모달 -->
				<div id="loginModal" style="display: none;">
					<jsp:include page="/WEB-INF/views/common/loginModal.jsp" />
				</div>
				<div class="footer_wrap">
					<jsp:include page="/WEB-INF/views/common/footer.jsp" />
				</div>
			</div>
		</div>
	</div>
</body>
</html>