<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
</head>
<body>
	<div class="layerPopup_wrap">
		<div class="layerPopup_heading">
			<h2 class="heading">새로운 비밀번호를 입력해주세요</h2>
			<button id="pwChBtn" class="btn_close">닫기</button>
		</div>
		<div class="layerPopup_content" style="    background: #f7f7f9;">
			<div class="form_control" style="    padding-top: 14px;">
				<div id="newPwdForm" class="form_row ">
					<label for="names" class="form_label">새 비밀번호</label>
					<input id="newPwd" name="newPwd" type="password" value="">
					<div class="ico_wrap">
						<i class="ico_error"></i>
					</div>
					<div style="display: none;" id="errorForm2"  class="valid_box">
						<p id="errorText2" class="txt"></p>
					</div>
					<div class="ex_box">
						<p class="txt">영문, 숫자, 특수문자 포함 10~20자 이내</p>
					</div>
				</div>
				<div id="newPwdChkForm" class="form_row ">
					<label for="names" class="form_label">새 비밀번호 확인</label> 
					<input id="newPwdChk" name="newPwdChk" type="password" value="">
					<div class="ico_wrap">
						<i class="ico_error"></i>
					</div>
					<div style="display: none;" id="errorForm3"  class="valid_box">
						<p id="errorText3" class="txt"></p>
					</div>
					<div class="ex_box">
						<p class="txt">비밀번호를 다시 입력해주세요</p>
					</div>
				</div>

			</div>
		</div>
		<div class="layerPopup_bottom bottom_gray">
			<div class="btn_group">
				<button id="changeBtn" class="btn type04" disabled="">새로운 비밀번호를 입력해 주세요</button>
			</div>
		</div>
	</div>
</body>
</html>