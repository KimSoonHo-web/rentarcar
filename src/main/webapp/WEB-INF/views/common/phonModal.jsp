<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>본인인증 모달</title>
</head>
<div class="layerPopup_wrap">
	<div class="layerPopup_heading">
		<h2 class="heading">본인인증</h2>
		<button id="btnClose" class="btn_close">닫기</button>
	</div>
	<div class="layerPopup_content">
		<div class="form_row_box">
			<div id="userName-form" class="form_row">
				<label for="userName" class="form_label">성함</label>
				<input type="text" id="userName" name="userName"  value="">
				
				<div id="icError" class="ex_box">
					<div id="error-Icon" class="ico_wrap">
						<i class="ico_error"></i>
					</div>
					<div style="display: none;" id="error1" class="valid_box">
						<p id="error1-text" class="txt"></p>
					</div>
					<p class="txt">성함을 입력해주세요.</p>
				</div>
			</div>
			
			<div id="user_phon-form" class="form_row ">
				<label for="user_phon" class="form_label">전화번호</label>
				<input maxlength="11" type="tel" id="user_phon" name="user_phon" value="">
				<div  class="ex_box">
					<!-- 에러문구 -->
					<div style="display: none;" id="error2" class="valid_box">
						<p id="error2-text" class="txt"></p>
					</div>
					<p class="txt">전화번호를 입력해 주세요. '-' 뺴고 입력</p>
					<div class="btn_group">
						<button id="sendPhoneButton" class="btn type01 disabled" >전화번호 전송</button>
					</div>	
				</div>
			</div>
			
			<div id="phonCheck" class="form_row ">
				<label for="phonCheck" class="form_label">인증번호</label>
				<input maxlength="6" type="tel" id="phonCheckNo" name="phonCheckNo" value="">
				<div class="ex_box">
					<!-- 에러문구 -->
					<div style="display: none;" id="error3" class="valid_box">
						<p id="error3-text" class="txt"></p>
					</div>
					<p class="txt">인증번호를 입력해주세요.</p>
				</div>
			</div>
		</div>
	</div>
	<div class="layerPopup_bottom bottom_gray">
		<div class="btn_group">
			<button id="join-button" class="btn type01 disabled" disabled>다음</button>
		</div>
	</div>
</div>

</html>