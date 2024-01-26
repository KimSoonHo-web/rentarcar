<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="heading_wrap">
		<h2 class="heading"></h2>
		<a id="branchCloseBtn" class="btn_close"><span class="blind">닫기</span></a>
	</div>
	<div class="spot_wrap">
		<!-- 지도  api 들어갈 부분 -->
		<div class="spot_map"></div>
		<div class="spot_text_group">
			<div class="spot_title">
				<h4></h4>
				<span></span>
				<input type="hidden" id="branchNo">
			</div>
			<div class="spot_text_sb">
				<ul>
					<li><div class="left_txt">
							<p>주소</p>
							<span></span>
							<span></span>
						</div>
						<div class="right_btn">
							<a>네이버 지도로 보기</a>
						</div></li>
					<li><div class="left_txt">
							<p>전화</p>
							<span></span>
						</div></li>
					<li><div class="left_txt">
							<p>이용 가능한 시간</p>
							<dl>
								<dt>대여</dt>
								<dd></dd>
							</dl>
							<dl>
								<dt>반납</dt>
								<dd></dd>
							</dl>
						</div></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="btn_group b_fixed">
		<button id="selectDestination" class="btn type01">여기를 목적지로</button>
	</div>
</body>
</html>