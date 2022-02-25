<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/home/header.jsp"/>

<form action="${pageContext.request.contextPath}/user/signIn" method="POST">
	<table>
		<tr>
			<th colspan="2">
				<h1>로그인</h1>
				<h2>${message}</h2>
			</th>
		</tr>
		<tr>
			<td>E-MAIL</td>
			<td>
				<input type="text" name="u_id" id="u_id" />
			</td>
		</tr>
		<tr>
			<td>PASSWORD</td>
			<td>
				<input type="password" name="u_pw" id="u_pw" />
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<label>
					<input type="checkbox" name="userCookie" id="userCookie" />로그인 유지
				</label>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="로그인" id="loginBtn"/>
				<input type="button" value="회원가입" onclick="location.href='${path}/user/signUp';"/>				
			</td>
		</tr>
	</table>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
</body>
</html>