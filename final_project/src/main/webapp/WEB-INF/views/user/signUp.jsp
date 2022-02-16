<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/user/header.jsp"/>
<style>
	#signInBtn{
		width:100%;
		background-color:skyblue;
		color:white;
	}
	#signInBtn:hover{
		background-color:#ccc;
	}
</style>
<form action="signUpPost" method="POST">
	<table border=1>
		<tr>
			<th colspan=2><h1>회원가입</h1></th>
		</tr>
		<tr>
			<td>아이디</td>
			<td>
				<input type="text" name="u_id" id="u_id" required/>
			</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>
				<input type="text" name="u_name" id="u_name" required/> 
			</td>
			
		</tr>
		<tr>
			<td>비밀번호</td>
			<td>
				<input type="password" name="u_pw" id="u_pw" required/>
			</td>
		</tr>	
		<tr>
			<td>비밀번호 확인</td>
			<td>
				<input type="password" name="u_repw" required/>
			</td>
		</tr>	
		<tr>
			<td colspan=2>
				<input type="submit" id="signInBtn" value="회원가입"/>
				<input type="button" onclick="location.href='${path}/sign/signIn';" value="SIGN IN"/>
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