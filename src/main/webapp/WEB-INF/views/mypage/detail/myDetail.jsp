<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/component/component.css">
<link rel="stylesheet" href="/css/component/component2.css">
<link rel="stylesheet" href="/css/reset/reset.css">
<link rel="stylesheet" href="/css/main/main.css">
<link rel="stylesheet" href="/css/common/common.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/js/mypage/mypage.js?ver=20231122"></script>
</head>
<body style="overflow: visible;">
	<div id="root" style="height: 100%">
		<div class="pc_wrap">
			<div class="wrap sub_wrap">
				<jsp:include page="/WEB-INF/views/common/header.jsp" />
				<div class="container">
					<div class="inner">
						<div class="contents">
							<div class="title_wrap">
								<h2 class="title_30">내 정보 관리</h2>
								<a href="mypage.do" class="link_btn mt40">마이페이지 홈으로</a>
							</div>
							<div class="sub_cont">
								<div class="title_wrap">
									<p class="title_18">기본 정보</p>
								</div>
								<div class="white_box border">
									<div class="form_row">
										<div class="data_management">
											<label for="coname" class="form_label">아이디</label>
											<p class="data_txt">${userInfo.userId }</p>
										</div>
										<div class="data_management">
											<label for="password" class="form_label">비밀번호</label>
											<p class="data_txt notice">개인정보 보호를 위해 주기적으로 변경해주세요</p>
											<div class="btn_modify">
												<button id="passwordChangeBtn" class="btn">변경</button>
											</div>
										</div>
										<div class="data_management">
											<label for="sellphone" class="form_label">휴대폰 번호</label>
											<p class="data_txt" id="userPhone">${userInfo.userPhone}</p>
											<div class="btn_modify">
												<button id="phoneChangeBtn" class="btn">본인 인증 후 변경</button>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="sub_cont">
								<div class="title_wrap">
									<p class="title_18">추가정보</p>
								</div>
								<div class="white_box border">
									<div class="form_row">
									
										<div id="addressContainer" class="data_management">
											<label for="address" class="form_label">주소</label>
											<p  class="data_txt">
												<c:choose>
													<c:when test="${not empty userInfo.userAddress1}">
												
												${userInfo.userAddress2} 
														${userInfo.userAddress3}
													
													</c:when>
													<c:otherwise>
														<input id="address" type="text" placeholder="주소를 등록해 주세요" disabled="">
													</c:otherwise>
												</c:choose>
											</p>

											<div class="btn_modify">
												<c:if test="${not empty userInfo.userAddress1}">
													<button class="btn" id="addressDelete">삭제</button>
												</c:if>
												<form id="addressForm" action="/mypage/info/address" method="GET">
												<button id="addChangeBtn" class="btn">변경</button>
												<%--  <input type="hidden" name="userNo" value="${userInfo.userNo}"> --%>
												</form>
											</div>
										</div>
										
										<div id="driverLicenseContainer" class="data_management">
											<label for="driverLicense" class="form_label">운전면허 정보</label>
											<p class="data_txt">
												<c:choose>
													<c:when test="${not empty licensInfo.licenseType}">
										                ${licensInfo.licenseType}<br />
										                번호: ${licensInfo.licenseNumber}<br />
										                취득일: ${licensInfo.issueDate}<br />
										                만료일: ${licensInfo.expirationDate}
										            </c:when>
													<c:otherwise>
														<input type="text" placeholder="운전 면허 정보를 등록해 주세요" disabled="">
													</c:otherwise>
												</c:choose>
												<input id="driverLicense1" type="hidden" value="${licensInfo.licenseType}">
												<input id="driverLicense2" type="hidden" value="${licensInfo.licenseNumber}">
												<input id="driverLicense3" type="hidden" value="${licensInfo.issueDate}">
												<input id="driverLicense4" type="hidden" value="${liccensInfo.expirationDate}">
											</p>
											<div class="btn_modify">
												<c:if test="${not empty licensInfo.licenseType}">
													<button class="btn" id="licenseDelete">삭제</button>
												</c:if>
												<form id="licenseForm" action="/mypage/info/license" method="GET">
												<button id="licenseChangeBtn" class="btn">변경</button>
												</form>
											</div>
										</div>
										
										<div class="data_management">
											1<label for="payment" class="form_label">결제수단관리</label>
											<p class="data_txt">
												<c:choose>
													<c:when test="${not empty carInfo.cardClsNm}">
											[대표] ${carInfo.cardClsNm}<br/> 카드번호 : ${carInfo.cardNo} 
											</c:when>
													<c:otherwise>
														<input id="payment" type="text" placeholder="결제수단을 등록해 주세요" disabled="">
													</c:otherwise>
												</c:choose>
											</p>
											<div class="btn_modify">
												<button class="btn">변경</button>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="sub_cont">
								<div class="title_wrap">
									<p class="title_18">계정관리</p>
								</div>
								<div class="white_box border">
									<div class="form_row">
										<div class="data_management">
											<p class="data_txt">로그아웃</p>
											<div class="btn_modify">
												<button class="btn arrow" id="logout">로그아웃 버튼</button>
											</div>
										</div>
										<div class="data_management">
											<p class="data_txt">회원탈퇴</p>
											<div class="btn_modify">
												<button id="unregisterOpenBtn" class="btn arrow">회원탈퇴 버튼</button>
											</div>
										</div>
										<!-- 회원탈퇴 모달 -->
										<div id="unregisterModal" style="display: none;" class="layerPopup small">
											<jsp:include page="/WEB-INF/views/modal/unregisterModal.jsp"/>
										</div>
									</div>
								</div>
							</div>
						</div>
						<form name="reqPCCForm" method="post" action="">
							<input type="hidden" name="reqInfo" value=""><input type="hidden" name="retUrl" value=""> <input type="hidden" name="verSion" value="2">
						</form>
						<jsp:include page="../detail/sideBar.jsp" />
						<!-- 모달 -->
						<div id="pwChange" class="layerPopup small" style="display: none;">
							<jsp:include page="/WEB-INF/views/common/pwChange.jsp" />
						</div>
						<!-- 비밀번호 변경  -->
						<div id="pwChmodal" style="display: none;">
							<jsp:include page="/WEB-INF/views/common/pwChmodal.jsp" />
						</div>
						<!-- 휴대폰 변경 -->
						<div id="phone-modal" class="layerPopup small" style="display: none;">
							<jsp:include page="/WEB-INF/views/common/phonModal.jsp" />
						</div>
						<!-- 주소 삭제 모달-->
						<div id="add-modal" class="layerPopup alertPopup" style="display: none;">
							<jsp:include page="/WEB-INF/views/modal/addModal2.jsp" />
						</div>
						<!-- 주소삭제 성공모달  -->
						<div id="add-modal-success" style="display: none;">
							<jsp:include page="/WEB-INF/views/modal/addModal1.jsp" />
						</div>
						<!-- 주소 삭제 모달-->
						<div id="license-modal" class="layerPopup alertPopup" style="display: none;">
							<jsp:include page="/WEB-INF/views/modal/licenseModal2.jsp" />
						</div>
						<!-- 주소삭제 성공모달  -->
						<div id="license-modal-success" style="display: none;">
							<jsp:include page="/WEB-INF/views/modal/licenseModal1.jsp" />
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

</body>
</html>