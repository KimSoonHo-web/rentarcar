<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
</head>
<body>
<c:if test="${not empty branche}">
    <!-- 반복문 밖에서 regionName을 한 번만 표시 -->
    <p class="navi_map_title">${branche[0].regionName}</p>
</c:if>
	<c:forEach items="${branche }" var="brancheList">
		<div class="navi_map_lists">
			<div class="navi_map_wrap">
				<div class="navi_list_group">
				<%-- 	<p class="navi_map_title">${brancheList.regionName}</p> --%>
					<ul class="navi_map_group">
						<li>
							<div class="navi_rtext ico_map_org" style="cursor: pointer;">
								<p>${brancheList.branchName}</p>
								<span>${brancheList.branchStation}</span>
							</div>
							<div class="navi_map_link">
								<a>상세</a>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</c:forEach>
</body>
</html>