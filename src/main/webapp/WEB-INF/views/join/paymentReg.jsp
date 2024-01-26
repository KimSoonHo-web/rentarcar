<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제수단등록</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/css/component/component.css">
<link rel="stylesheet" href="/css/reset/reset.css">
<link rel="stylesheet" href="/css/main/main.css">
<link rel="stylesheet" href="/css/common/common.css">
<script type="text/javascript" src="/js/join/paymentReg.js?ver=2023120"></script>
</head>
<body>
<body style="overflow: visible;">
	<div id="root" style="height: 100%">
		<div class="pc_wrap">
			<div class="wrap sub_wrap">
				<jsp:include page="/WEB-INF/views/common/header.jsp" />
				<div class="container">
					<div class="inner">
						<div class="contents" style="margin: auto;">
							<h2 class="title_30">결제수단 등록</h2>
							<div class="sub_cont">
								<div class="white_box">
									<div class="form_row select_box flex">
										<div class="row">
											<label for="cardClsNm" class="form_label">카드유형</label>
											 <select id="cardClsNm" name="cardClsNm">
												<option value="">카드 종류를 선택해 주세요</option>
												<option value="개인카드">개인카드</option>
												<option value="법인카드(기명)">법인카드(기명)</option>
												<option value="법인카드(무기명)">법인카드(무기명)</option>
											</select>
											<div style="display: none;" id="erorr-form1" class="valid_box">
												<p id="erorr-text1" class="txt"></p>
											</div>
										</div>
										<div class="row">
											<label for="cardNo" class="form_label">카드번호</label>
											<input id="cardNo" name="cardNo" type="tel" maxlength="16" placeholder="카드 번호를 입력해 주세요" value="">
											<div class="ico_wrap">
												<button id="cardNo-btn-reset" class="btn_reset">
													<span class="blind">reset</span>
												</button>
											</div>
											<div style="display: none;" id="erorr-form2" class="valid_box">
												<p id="erorr-text2" class="txt"></p>
											</div>
										</div>
									</div>
									<div class="form_row flex">
										<div class="row">
											<label for="validity" class="form_label">유효기간</label>
											<input id="expDtm" name="expDtm" type="tel" maxlength="5" placeholder="MM/YY" autocomplete="new-password" value="">
											<div class="ico_wrap">
												<button id="expDtm-btn-reset" class="btn_reset">
													<span class="blind">reset</span>
												</button>
											</div>
											<div style="display: none;" id="erorr-form3" class="valid_box">
												<p id="erorr-text3" class="txt"></p>
											</div>
										</div>
										<div class="row">
											<label for="cardPw" class="form_label">비밀번호 앞 2자리</label>
											<div class="two_digits">
												<input id="cardPw" name="cardPw" type="password" maxlength="2" autocomplete="new-password"><span class="hidden">**</span>
											</div>
											<div style="display: none;" id="erorr-form4" class="valid_box">
												<p id="erorr-text4" class="txt"></p>
											</div>
										</div>
									</div>
									<div class="form_row">
										<label for="birthday" class="form_label">생년월일 6자리</label>
										<input id="idNo" name="idNo" type="tel" maxlength="6" placeholder="숫자만 입력해 주세요" value="">
										<div class="ico_wrap">
											<button id="idNo-btn-reset" class="btn_reset">
												<span class="blind">reset</span>
											</button>
										</div>
										<div style="display: none;" id="erorr-form5" class="valid_box">
											<p id="erorr-text5" class="txt"></p>
										</div>
									</div>
								</div>
							</div>
							<div class="sub_cont mt12">
								<div class="inner">
									<div class="agree_chk_wrap">
										<span class="chk_box total_chk"><input type="checkbox" id="totalChk" name="totalChk">
											<label for="totalChk">모든 필수/선택 약관을 확인하고 전체 동의합니다.</label>
										</span>
										<ul class="agree_list">
											<li><span class="chk_box">
													<input type="checkbox" id="agree01" name="agree01">
													<label for="agree01">전자금융거래 이용약관(필수)</label>
												</span>
												<span id="view1" class="view">
													<a>보기</a>
												</span>
											</li>
											<li>
												<span class="chk_box">
													<input type="checkbox" id="agree03" name="agree03">
													<label for="agree03">개인(신용)정보 수집 및 이용 동의(선택)</label>
												</span>
												<span id="view3" class="view">
													<a>보기</a>
												</span>
											</li>
										</ul>
									</div>
									<div id="view1-modal" style="display: none;" class="layerPopup open bg_white small">
										<jsp:include page="../join/views/pay-view1.jsp" />
									</div>
									<div id="view3-modal" style="display: none;" class="layerPopup open bg_white small">
										<jsp:include page="../join/views/pay-view3.jsp" />
									</div>
								</div>
							</div>
							<div class="btn_group multy">
							<form action="join.dox" method="Post">	
								<button id="skip-button" type="button" class="btn type04">건너뛰기</button>
								<input type="hidden" id="userId" name="userId" value="${userId }">
								<input type="hidden" id="userPassword" name="userPassword" value="${userPassword }">
								<input type="hidden" id="userName" name="userName" value="${userName }">
								<input type="hidden" id="userPhone" name="userPhone" value="${userPhone }">
								<input type="hidden" id="userAddress1" name="userAddress1" value="${userAddress1 }">
								<input type="hidden" id="userAddress2" name="userAddress2" value="${userAddress2 }">
								<input type="hidden" id="userAddress3" name="userAddress3" value="${userAddress3 }">
								<input type="hidden" id="licenseType" name="licenseType" value="${licenseType }">
								<input type="hidden" id="licenseNumber" name="licenseNumber" value="${licenseNumber }">
								<input type="hidden" id="issueDate" name="issueDate" value="${issueDate }">
								<input type="hidden" id="expirationDate" name="expirationDate" value="${expirationDate }">
							</form>
							<button id="next-button" type="button" class="btn type01 disabled">결제카드 등록</button>
							</div>
							
						</div>
						<!-- 회원가입 성공 시  -->
						<div style="display: none;" id="successful" class="layerPopup alertPopup">
							<jsp:include page="../join/views/join-successful.jsp" />
						</div>
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