<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/home/header.jsp"/>
<form id="logoutForm" action="${path}/user/signOut" method="POST">
	<!-- 
	<table>
		<tr>
			<td>이메일</td>
			<td>
				<input type="text" placeholder="e-mail" id="u_id"/>
			</td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td>
				<input type="password" placeholder="비밀번호" id="u_pw"/>
			</td>
		</tr>
	</table>

 -->
 	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
<script>
	
	var result = "${result}";
	if(result != "") alert(result);
	
	var message = "${message}";
	if(message != "") alert(message);
	
	window.onload = function(){
		$("#logoutForm").submit();
	}
	
</script>
</body>
</html>