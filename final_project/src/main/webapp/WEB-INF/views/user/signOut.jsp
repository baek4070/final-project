<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/home/header.jsp"/>
<form id="logoutForm" action="${path}/user/signOut" method="POST">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
<script>
	window.onload = function(){
		$("#logoutForm").submit();
	}	
</script>
</body>
</html>