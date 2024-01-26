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
<script type="text/javascript" src="/js/login/find/find.js?ver=20231128"></script>
</head>
<body style="overflow: visible;">
	<div id="root" style="height: 100%">
		<div class="pc_wrap">
			<div class="wrap sub_wrap">
				<jsp:include page="/WEB-INF/views/common/header.jsp" />
				<div class="container">
					<div class="inner">
						<div class="contents result_wrap" style="margin: auto;">
							<h2 class="title_30">회원님의 아이디를 찾았어요!</h2>
							<ul class="id_list">
								<li>
									<a>
									<strong>
										<i>
											<img src="https://homepage.skcarrental.com/assets/img/contents/ico_id_sk.png" alt="sk">
										</i>${userInfo.userId }
									</strong>
									<span>${userInfo.userCreate} 가입하셨어요</span>
									</a>
								</li>
							</ul>
							<div class="btn_group multy">
								<button id="newPwBtn" type="button" class="btn type04">비밀번호 재설정</button>
							</div>
						</div>
						<jsp:include page="/WEB-INF/views/common/chatTop.jsp" />
						<div style="display: none; " id="pwfindModal" class="layerPopup open bg_white small">
							<jsp:include page="/WEB-INF/views/common/pwfindModal.jsp" />
						</div>
					</div>
				</div>
			</div>
			<div class="footer_wrap">
				<jsp:include page="/WEB-INF/views/common/footer.jsp" />
			</div>
		</div>
	</div>

</body>
</html>