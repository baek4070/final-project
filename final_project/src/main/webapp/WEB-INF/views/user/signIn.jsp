<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/home/headeronuser.jsp"/>
<style>
	#text{
		text-align:center;
	}
	#button{
		
	}
</style>
<div class="" style="display:flex; justify-content:center; align-items:center; padding-top:250px;">
<form action="/user/signIn" method="POST">
	<table>
		<tr>
			<th colspan="2">
				<h1 id="text">로그인</h1>
				<h2>${message}</h2>
			</th>
		</tr>
		<tr>
			<td>E-MAIL</td>
			<td>
				<input type="text" name="u_id" id="u_id" placeholder="E-Mail" class="form-control"/>
			</td>
		</tr>
		<tr>
			<td>PASSWORD</td>
			<td>
				<input type="password" name="u_pw" id="u_pw" placeholder="password" class="form-control"/>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<label>
					<input type="checkbox" class="form-check-input" name="userCookie" id="userCookie" />로그인 유지
				</label>
			</td>
		</tr>
		<tr>	
			<td colspan="2">			
				<input type="submit" class="btn-primary form-control" value="로그인" id="loginBtn"/>
			</td>
		</tr>
		<tr>
			<td colspan="2" id="button">
				<input type="button" class="form-control btn-primary" value="회원가입" onclick="location.href='${path}/user/signUp';"/>		
			</td>
		</tr>
	</table>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
</div>
</body>
</html>