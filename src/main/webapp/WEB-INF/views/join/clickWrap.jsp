<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/css/component/component.css">
<link rel="stylesheet" href="/css/reset/reset.css">
<link rel="stylesheet" href="/css/main/main.css">
<link rel="stylesheet" href="/css/common/common.css">
<script type="text/javascript" src="/js/join/clickWrap.js?ver=20231117"></script>
</head>
<body style="overflow: visible;">
	<div id="root" style="height: 100%">
		<div class="pc_wrap">
			<div class="wrap sub_wrap">
				<jsp:include page="/WEB-INF/views/common/header.jsp" />
				<!--  -->
				<div class="container">
					<div class="inner">
						<div class="contents" style="margin: auto;">
							<h2 class="title_30">SK렌터카 약관동의</h2>
							<p class="title_20">
								SK렌터카 회원가입을 위해<br>이용약관에 동의해 주세요
							</p>
							<div class="sub_cont mt40">
								<div class="inner">
									<div class="agree_chk_wrap">
										<span class="chk_box total_chk"> <input type="checkbox" id="totalChk" name="totalChk"> <label for="totalChk">모든 필수/선택 약관을 확인하고 전체 동의합니다.</label>
										</span>
										<ul class="agree_list">
											<li>
												<span class="chk_box">
													<input type="checkbox" id="agree01" name="chk">
													<label for="agree01">SK렌터카 이용약관(필수)</label>
												</span> 
												<span id="view1" class="view">
													<a> 보기 </a>
												</span>
											</li>
											<li>
												<span class="chk_box">
													<input type="checkbox" id="agree02" name="chk">
													<label for="agree02">개인정보 수집 및 이용 동의(필수)</label>
												</span>
												<span id="view2" class="view">
													<a>보기</a>
												</span>
											</li>
											<li>
												<span class="chk_box">
													<input type="checkbox" id="prsnInfoPeriod" name="chk">
													<label for="prsnInfoPeriod">개인정보 유효기간 5년 동의(선택)</label>
												</span>
												<span id="view3" class="view">
													<a>보기</a>
												</span>
											</li>
											<li>
												<span class="chk_box">
													<input type="checkbox" id="mktAgree" name="chk">
													<label for="mktAgree">마케팅 활용 동의(선택)</label>
												</span>
												<span id="view4" class="view">
													<a>보기</a>
												</span>
											</li>
											<li>
												<span class="chk_box">
													<input type="checkbox" id="smsRcvAgree" name="chk">
													<label for="smsRcvAgree">SMS 수신동의(선택)</label>
												</span>
											</li>
											<li>
												<span class="chk_box">
													<input type="checkbox" id="emailRcvAgree" name="chk">
													<label for="emailRcvAgree"> 이메일 수신동의(선택)</label>
												</span>
											</li>
										</ul>
									</div>
								</div>
								<ul class="non_list mt20 pl4">
									<li>고객님에게는 동의를 거부할 권리가 있으나, 약관에 동의하셔야 SK렌터카 서비스를 이용할 수 있습니다</li>
								</ul>
							</div>
							<div class="btn_group multy">
								<button id="agreeCompleteBtn" type="button" class="btn type01 disabled" disabled>동의 완료</button>
							</div>
							<div id="join-modal" style="display: none;" class="layerPopup small">
								<jsp:include page="../join/joinModal.jsp"/>
							</div>
						</div>
						<!--  -->
						<div id="view1-modal" style="display: none;" class="layerPopup bottom large resPop">
							<jsp:include page="../join/views/view1.jsp"/>
						</div>
						<div style="display: none;" id="view2-modal" class="layerPopup open bg_white small">
							<jsp:include page="../join/views/view2.jsp"/>
						</div>
						<div style="display: none;" id="view3-modal" class="layerPopup bg_white small open privacy_agree">
							<jsp:include page="../join/views/view3.jsp"/>
						</div>
						<div style="display: none;" id="view4-modal" class="layerPopup open bg_white small">
							<jsp:include page="../join/views/view4.jsp"/>
						</div>
						<!--  -->
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