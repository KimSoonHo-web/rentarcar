<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 모달</title>
</head>
<div class="layerPopup_wrap">
	<div class="layerPopup_heading">
		<h2 class="heading">아이디와 비밀번호를 입력해 주세요</h2>
		<button id="btnClose" class="btn_close">닫기</button>
	</div>
	<div class="layerPopup_content">
		<div class="form_row_box">
			<div id="id-form" class="form_row">
				<label for="id" class="form_label">아이디</label><input type="text" id="id" name="userId" value="">
				<div id="idError" class="ex_box">
				
					<div id="error-Icon" class="ico_wrap">
						<i class="ico_error"></i>
					</div>
					
					<div id="error1" class="valid_box">
						<p id="error1-text" class="txt"></p>
					</div>
					<p class="txt">영문, 숫자 포함 4~20자 이내</p>
				</div>
			</div>
			<div id="pw-form" class="form_row ">
				<label for="password" class="form_label">비밀번호</label><input type="password" id="password" name="userPassword" value="">
				<div class="ex_box">
					<!-- 에러문구 -->
					<div id="error2" class="valid_box">
						<p id="error2-text" class="txt"></p>
					</div>
					<p class="txt">영문, 숫자, 특수문자 포함 10~20자 이내</p>
				</div>
			</div>
			<div id="pwck-form" class="form_row ">
				<label for="passwordCheck" class="form_label">비밀번호 확인</label><input type="password" id="passwordCheck" name="passwordCheck" value="">
				<div class="ex_box">
					<!-- 에러문구 -->
					<div id="error3" class="valid_box">
						<p id="error3-text" class="txt"></p>
					</div>
					<p class="txt">비밀번호를 다시 입력해주세요</p>
				</div>
			</div>
			<input type="hidden" id="userName" name="userName" value="${userName}">
			<input type="hidden" id="userPhone" name="userPhone" value="${userPhone}">
		</div>
	</div>
	<div class="layerPopup_bottom bottom_gray">
		<div class="btn_group">
			<button id="join-button" class="btn type01 disabled" disabled>아이디와 비밀번호를 입력해주세요</button>
		</div>
	</div>
</div>
</body>
</html>