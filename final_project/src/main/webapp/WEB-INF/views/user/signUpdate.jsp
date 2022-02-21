<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:include page="/WEB-INF/views/home/header.jsp"/>

<form action="signUpdatePost" method="POST">
	<input type="hidden" name="uno" id="uno"/>
	<table border=1>
		<tr>
			<th colspan=2><h1>회원정보 수정</h1></th>
		</tr>
		<tr>
			<td>아이디</td>
			<td>
				<input type="text" name="u_id" id="u_id" value="${userInfo.u_id}" />
			</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>
				<input type="text" name="u_name" id="u_name" value="${userInfo.u_name}" /> 
			</td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td>
				<input type="text" name="u_pw" id="u_pw" value="${userInfo.u_pw}" /> 
			</td>
		</tr>
		<tr>
			<td colspan=2>
				<input type="button" value="홈" onclick="location.href='${path}/home';"/>
				<input type="submit" value="수정하기" /> 
			</td>
		</tr>
	</table>
</form>

</body>
</html>