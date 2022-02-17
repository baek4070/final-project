<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../home/home.jsp"/>
<form action="signInPost" method="POST">
	<table>
		<tr>
			<th><h1>로그인</h1></th>
		</tr>
		<tr>
			<td>아이디</td>
			<td>
				<input type="text" name="u_id" id="u_id" placeholder="ID" required/>
			</td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td>
				<input type="password" name="u_pw" id="u_pw" placeholder="PASSWORD" required/>
			</td>
		</tr>
		<tr>
			<td>
				<input type="checkbox" name="useCookie" />로그인유지
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="SIGN IN"/>
				<input type="button" value="SIGN UP" onclick="location.href='${path}/user/signUp';"/>				
			</td>
		</tr>
	</table>
</form>
<script>
	var msg = '${message}';
	if(msg != ''){
		alert(msg);
	}
</script>
</body>
</html>