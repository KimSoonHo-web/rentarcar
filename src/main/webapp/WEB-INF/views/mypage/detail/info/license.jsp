<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>면허증 입력</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/css/component/component.css">
<link rel="stylesheet" href="/css/reset/reset.css">
<link rel="stylesheet" href="/css/main/main.css">
<link rel="stylesheet" href="/css/common/common.css">
<script type="text/javascript" src="/js/mypage/mypage.js?ver=20231122"></script>
</head>
<body style="overflow: visible;">
	<div id="root" style="height: 100%">
		<div class="pc_wrap">
			<div class="wrap sub_wrap">
				<jsp:include page="/WEB-INF/views/common/header.jsp" />
				<div class="container">
					<div class="inner">
						<div class="contents" style="margin: auto;">
							<h2 class="title_30">운전면허정보 입력</h2>
							<p class="title_16">운전면허정보를 입력해주세요</p>
							<span class="title_14 txt_lightgray">회원가입 후에도 입력할 수 있어요</span>
							<div class="caution_box mt40">
								<div class="detail_info noti_wrap mt0">
									<div class="detail_info__tit">
										<p class="title_14">약관에 동의해야 운전면허정보를 저장할 수 있어요</p>
									</div>
								</div>
							</div>
							<div class="sub_cont mt12">
								<div class="inner">
									<div class="license_img">
										<img src="https://homepage.skcarrental.com/assets/img/contents/img_license.png" alt="운전면허증예시">
									</div>
									<div class="info_box">
										<div id="license-type" class="select_box form_row ">
											<label class="form_label">면허종류</label>
											<select>
												<option value="">면허종류를 선택해주세요</option>
												<option value="2종보통">2종보통</option>
												<option value="1종보통">1종보통</option>
												<option value="1종대형">1종대형</option>
												<option value="1종특수-대형견인차(트레일러)">1종특수-대형견인차(트레일러)</option>
												<option value="1종특수-구난차(레커)">1종특수-구난차(레커)</option>
												<option value="1종특수-소형견인차">1종특수-소형견인차</option>
												<option value="국제면허">국제면허</option>
											</select>
											<div style="display: none;" id="erorr-form1" class="valid_box">
												<p id="erorr-text1" class="txt">면허종류를 선택해주세요</p>
											</div>
										</div>
											
										<div id="license-no" class="form_row ">
											<label for="number" class="form_label">면허번호</label>
											<input id="number" maxlength="12" type="text" placeholder="면허번호를 입력해주세요" value="${licensInfo.licenseNumber }">
											<div style="display: none;" id="erorr-form2" class="valid_box">
												<p id="erorr-text2" class="txt"></p>
											</div>
											<div class="ex_box">
												<p class="txt">구면허증) 서울-01-123456-00 → 서울0112345600</p>
												<p class="txt">신면허증) 11-01-123456-00 → 110112345600</p>
											</div>
										</div>
										<div id="issue-date" class="form_row ">
											<label for="isDate" class="form_label">발급일자</label>
											<input id="isDate" type="tel" placeholder="예) 20210101" value="${licensInfo.issueDate }">
											<div style="display: none;" id="erorr-form3" class="valid_box">
												<p id="erorr-text3" class="txt"></p>
											</div>
										</div>
										<div id="expiration-date" class="form_row ">
											<label for="exDate" class="form_label">만료일자</label>
											<input id="exDate" type="tel" placeholder="예) 20251231" value="${licensInfo.expirationDate }">
											<div style="display: none;" id="erorr-form4" class="valid_box">
												<p id="erorr-text4" class="txt"></p>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="sub_cont mt12">
								<div class="inner">
									<div class="agree_chk_wrap">
										<span class="chk_box total_chk">
											<input type="checkbox" id="totalChk" name="payTotal">
											<label for="totalChk">전체동의</label>
										</span>
										<ul class="agree_list">
											<li>
												<span  class="chk_box">
													<input type="checkbox" id="agree01" name="chk">
													<label for="agree01">개인정보 수집 및 이용 동의(선택)</label>
												</span>
												<span id="view1" class="view">
													<a>보기</a>
												</span>
											</li>
											<li>
												<span class="chk_box">
													<input type="checkbox" id="agree02" name="chk">
													<label for="agree02">고유식별정보 수집 및 이용 동의(선택)</label>
												</span>
												<span id="view2" class="view">
													<a>보기</a>
												</span>
											</li>
										</ul>
									</div>
									<div id="view1-modal" style="display: none;" class="layerPopup open bg_white small">
										<jsp:include page="/WEB-INF/views/join/views/add-view1.jsp" />
									</div>
									<div id="view2-modal" style="display: none;" class="layerPopup open bg_white small">
										<jsp:include page="/WEB-INF/views/join/views/license-view1.jsp" />
									</div>
								</div>
							</div>
							<div class="btn_group multy">
								<button id="next-button" type="button" class="btn type01 disabled">운전면허 정보를 입력하세요</button>
							</div>
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