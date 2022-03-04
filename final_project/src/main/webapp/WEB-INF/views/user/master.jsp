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
		<th>권한</th>
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
					</td>
					<td>
						<sec:authorize access="hasAnyRole('ROLE_MASTER','ROLE_ADMIN')">
							<select id="authChange">
								<option selected>권한선택</option>
								<option value="ROLE_USER">일반회원</option>
								<option value="ROLE_MASTER">관리자</option>
							</select>
						</sec:authorize>
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
	$("#authChange").on("change",function(){
		var selectAuth = $(this);
		var changedVal = selectAuth.val();
		console.log(changedVal);
		
		
	});
</script>
</body>
</html>