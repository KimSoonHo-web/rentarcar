<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소입력창</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/css/component/component.css">
<link rel="stylesheet" href="/css/reset/reset.css">
<link rel="stylesheet" href="/css/main/main.css">
<link rel="stylesheet" href="/css/common/common.css">
<script type="text/javascript" src="/js/join/address.js?ver=20231119"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>
<body style="overflow: visible;">
	<div id="root" style="height: 100%">
		<div class="pc_wrap">
			<div class="wrap sub_wrap">
				<jsp:include page="/WEB-INF/views/common/header.jsp" />
				<div class="container">
					<div class="inner">
						<div class="contents" style="margin: auto;">
							<h2 class="title_30">주소정보 입력</h2>
							<p class="title_16">주소정보를 입력해주세요</p>
							<span class="title_14 txt_lightgray">회원가입 후에도 입력할 수 있어요</span>
							<div class="caution_box mt40">
								<div class="detail_info noti_wrap mt0">
									<div class="detail_info__tit">
										<p class="title_14">약관에 동의해야 주소정보를 저장할 수 있어요</p>
									</div>
								</div>
							</div>
							<div class="sub_cont mt12">
								<div class="inner">
									<div class="info_box">
										<div class="form_row in_btn">
											<span>
												<label for="adress" class="form_label">주소</label>
												<input id="zipNo" type="text" readonly="" placeholder="우편번호" value="">
											</span>
											<button id="add-button" type="button" class="btn">주소검색</button>
											<input id="addr" type="text" readonly="" placeholder="주소" value="">
											<input id="dtlAddr" type="text" placeholder="상세주소" value="">
										</div>
									</div>
								</div>
							</div>
							<div class="sub_cont mt12">
								<div class="inner">
									<div class="agree_chk_wrap">
										<ul class="agree_list">
											<li class="mt0">
												<span class="chk_box">
													<input type="checkbox" id="agree01" name="chk">
													<label for="agree01">개인정보 수집 및 이용 동의(선택)</label>
												</span>
												<span id="view1" class="view">
													<a>보기</a>
												</span>
											</li>
										</ul>
									</div>
									<div id="view1-modal" style="display: none;" class="layerPopup open bg_white small">
										<jsp:include page="../join/views/add-view1.jsp" />
									</div>
								</div>
							</div>
								<div class="btn_group multy">
								<form action="/license.do" method="post">
									<input type="hidden" id="userId" name="userId" value="${userId }">
									<input type="hidden" id="userPassword" name="userPassword" value="${userPassword }">
									<input type="hidden" id="userName" name="userName" value="${userName }">
									<input type="hidden" id="userPhone" name="userPhone" value="${userPhone }">
									<button id="skip-button" type="submit" class="btn type04">건너 뛰기</button>
								</form>	
									<button id="next-button"  type="button" class="btn type01 disabled">다음</button>
								</div>
						</div>
						<jsp:include page="/WEB-INF/views/common/chatTop.jsp" />
					</div>
				</div>
				<div id="add-modal" style="display:none; position: fixed; z-index: 9999; inset: 16px 16px 100px; pointer-events: none;">
					<div class="go4109123758" style="left: 0px; right: 0px; display: flex; position: absolute; transition: all 230ms cubic-bezier(0.21, 1.02, 0.73, 1) 0s; transform: translateY(0px); bottom: 0px; justify-content: center;">
						<div class="go2072408551" style="border-radius: 18px; background: rgba(33, 37, 41, 0.8); color: rgb(255, 255, 255); padding: 4px 6px; font-size: 13px; animation: 0.35s cubic-bezier(0.21, 1.02, 0.73, 1) 0s 1 normal forwards running go2645569136;">
							<div role="status" aria-live="polite" class="go3958317564">주소 선택 후 상세주소를 입력해 주세요.</div>
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