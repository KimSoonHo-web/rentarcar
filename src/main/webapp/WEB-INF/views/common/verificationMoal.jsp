<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<div class="layerPopup_wrap">
	<div class="layerPopup_heading">
		<h2 class="heading">본인인증</h2>
		<button id=verificationMoalClose class="btn_close">닫기</button>
	</div>
	<div class="layerPopup_content">
		<div class="form_row_box">

			<div id="name" class="form_row">
				<label for="userName" class="form_label">성함</label>
				<input type="text" id="nameInput" name="nameInput" value="">
			</div>

			<div id="phone" class="form_row ">
				<label style="top: -10px;"  for="userPhon" class="form_label">전화번호</label> 
				<input maxlength="11" type="tel" id="phoneInput" name="phoneInput" value="">
			</div>
		</div>
	</div>
	<div class="layerPopup_bottom bottom_gray">
		<div class="btn_group">
			<button id="findBtn" class="btn type01 disabled" disabled>아이디 비빌번호 찾기</button>
		</div>
	</div>
</div>

	