<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div class="layerPopup_wrap">
		<div class="layerPopup_heading">
			<h2 class="heading">비밀번호를 입력해 주세요</h2>
			<button id="closeBtn" class="btn_close">닫기</button>
		</div>
		<div class="layerPopup_content">
			<div class="form_control">
				<div class="form_row">
					<label for="names" class="form_label">비밀번호</label> <input id="pw" name="names" type="password" placeholder="영문, 숫자, 특수문자 포함 10~20자 이내" maxlength="20">
					<div style="display: none;" id="pwErorrForm" class="valid_box">
						<p id="pwErorrText" class="txt">비밀번호를 다시 입력해주세요</p>
					</div>
				</div>
			</div>
		</div>
		<div class="layerPopup_bottom bottom_gray">
			<div class="btn_group">
				<button id="pwCkBtn" disabled class="btn type01">비밀번호를 입력해 주세요</button>
			</div>
		</div>
	</div>
</body>
</html>