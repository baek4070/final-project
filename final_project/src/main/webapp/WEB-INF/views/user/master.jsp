<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 관리자 페이지 -->
<jsp:include page="/WEB-INF/views/home/header.jsp"/>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<sec:authentication var="user" property="principal.user"/>
<style>
	.table{
		border:1px solid black;
	}
	.deleteBtn{
		wi
	}
</style>

<h1>관리자 페이지</h1>
<table class="table" border="1">
	<tr>
		<th>회원번호</th>
		<th>이메일</th>
		<th>이름</th>
		<th>생년월일</th>
		<th>전화번호</th>
		<th>마지막 방문 일자</th>
		<th>탈퇴 여부</th>
	</tr>
	<c:choose>
		<c:when test="${!empty userList}">
			<c:forEach var="user" items="${userList}">
				<tr>
					<td>${user.uno}</td>
					<td>${user.u_id}</td>
					<td>${user.u_name}</td>
					<td>${user.u_birth}</td>
					<td>${user.u_phone}</td>
					<td>
						<f:formatDate value="${user.u_visit_date}" pattern="yyyy-MM-dd (E) HH:mm"/>
					</td>
					<td>
						<select>
							<option value="y" ${user.u_withdraw eq 'y' ? 'selected' : '' }>비활성화</option>
							<option value="n" ${user.u_withdraw eq 'n' ? 'selected' : '' }>활성화</option> 
						</select>
						<input type="button" value="비활성화 Y/N" class="deleteBtn"/>
					</td>
				</tr>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<tr>
				<th colspan="7">등록된 회원이 없습니다.</th>
			</tr>
		</c:otherwise>
	</c:choose>
</table>
<script>
	
</script>
</body>
</html>