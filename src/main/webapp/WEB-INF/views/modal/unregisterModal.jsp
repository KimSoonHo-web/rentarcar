<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<div class="layerPopup_wrap">
	<div class="layerPopup_heading">
		<h2 class="heading">정말로 떠나실거에요?</h2>
		<p class="desc">아직도 해 드릴게 참 많은걸요</p>
		<button id="unregisterCloseBtn" class="btn_close">닫기</button>
	</div>
	<div class="layerPopup_content">
		<div class="form_control">
			<div class="visual_overview unregister">
				<p class="obj">
					단기 렌트부터<br>내 차량관리까지 한 번에!
				</p>
				<p class="sbj">
					그 다음은 어떤 서비스가 찾아올지<br>궁금하지 않으세요?
				</p>
			</div>
			<div class="caution_box">
				<p class="title_16">함께할 그날까지 열심히 달리고 있을게요</p>
				<p class="title_desc">꼭, 다시 만나요!</p>
				<div class="detail_info noti_wrap">
					<div class="detail_info__tit">
						<p class="title_16">헤어지기 전에 확인해 주세요</p>
					</div>
					<div class="info_txt">
						<p class="obj">통합탈퇴</p>
						<p class="sbj">SK렌터카 탈퇴 시 스마트케어, 빌리카 동시 탈퇴처리</p>
						<p class="obj">삭제정보</p>
						<p class="sbj">회원 정보, 서비스 이용기록</p>
						<ul class="dot_list small">
							<li>예약관련 정보는 관련 법령에 따라 일정기간 보관될 수 있습니다</li>
							<li>재가입 시, 기존 이력이 복구되지 않을 수 있습니다</li>
						</ul>
					</div>
				</div>
				<div class="check_group mt16">
					<span class="chk_box"><input type="checkbox" id="agree" name="chkDefault00"><label for="agree">위 내용을 확인했습니다</label></span>
				</div>
			</div>
		</div>
	</div>
	<div class="layerPopup_bottom mt24">
		<div class="btn_group multy type01">
			<button id="unregisterBtn" class="btn type04" disabled="">탈퇴</button>
			<button id="unregisterContinueBtn" class="btn type01">계속 이용할게요</button>
		</div>
	</div>
</div>