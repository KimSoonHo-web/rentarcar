<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<div id="driverLicenseContainer" class="data_management">
	<label for="driverLicense" class="form_label">운전면허 정보</label>
	<p class="data_txt">
		<c:choose>
			<c:when test="${not empty licensInfo.licenseNo}">
                ${licensInfo.licenseType}<br />
                번호: ${licensInfo.licenseNumber}<br/>
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
		<c:if test="${not empty licensInfo.licenseNo}">
			<button class="btn" id="licenseDelete">삭제</button>
		</c:if>
		<form id="licenseForm" action="/mypage/info/license" method="GET">
		<button id="licenseChangeBtn" class="btn">변경</button>
		</form>
	</div>
</div> --%>