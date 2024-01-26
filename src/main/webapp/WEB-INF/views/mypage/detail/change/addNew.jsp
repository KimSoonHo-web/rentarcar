<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<div id="addressContainer" class="data_management">
	<label for="address" class="form_label">주소</label>
	<p  class="data_txt">
		<c:choose>
			<c:when test="${not empty userInfo.userAddress1}">
			우편번호 : ${userInfo.userAddress1}<br />
			주소 : ${userInfo.userAddress2} <br />
				상세주소 : ${userInfo.userAddress3}
			
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
		 <input type="hidden" name="userNo" value="${userInfo.userNo}">
		</form>
	</div>
</div>